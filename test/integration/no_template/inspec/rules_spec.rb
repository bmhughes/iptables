if os[:family] == 'redhat'
  describe command('/sbin/iptables -nvL') do
    its(:stdout) { should match /ACCEPT.*tcp dpt:22/ }
  end
else
  describe iptables do
    it { should have_rule('-A FWR -p tcp -m tcp --dport 22 -j ACCEPT') }
  end
end
