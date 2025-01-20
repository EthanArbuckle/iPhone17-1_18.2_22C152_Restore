@interface STSWifiHandoverSession
- (void)wifiP2PController:(id)a3 didConnectTo:(id)a4 port:(id)a5;
- (void)wifiP2PControllerDidDisconnect:(id)a3 error:(id)a4;
@end

@implementation STSWifiHandoverSession

- (void)wifiP2PController:(id)a3 didConnectTo:(id)a4 port:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v11 = a5;
  if (self)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiHandoverSession wifiP2PController:didConnectTo:port:]", 42, self, @"TargetAddr=%@, port=%@, isServer=%d", v9, v10, (uint64_t)v8);
    if (self->_isServer) {
      goto LABEL_13;
    }
    objc_setProperty_nonatomic_copy(self, v12, v8, 80);
    objc_setProperty_nonatomic_copy(self, v13, v11, 88);
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiHandoverSession wifiP2PController:didConnectTo:port:]", 42, 0, @"TargetAddr=%@, port=%@, isServer=%d", v9, v10, (uint64_t)v8);
  }
  port = self->_port;
  v15 = self->_hostname;
  v16 = port;
  if (self->_isServer)
  {
    nw_connection_t v17 = 0;
  }
  else
  {
    v18 = sub_10002759C((uint64_t)self);
    v19 = [(NSString *)v15 UTF8String];
    if (v16) {
      v20 = [(NSString *)v16 UTF8String];
    }
    else {
      v20 = "0";
    }
    host = nw_endpoint_create_host(v19, v20);
    nw_connection_t v17 = nw_connection_create(host, v18);
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _new_outbound_connection:port:]", 264, self, @"connection=%@", v22, v23, (uint64_t)v17);
  }
  if (!self->_isServer) {
    objc_storeStrong((id *)&self->_clientHandle, v17);
  }
  sub_10002644C((dispatch_queue_t *)self, v17);

LABEL_13:
}

- (void)wifiP2PControllerDidDisconnect:(id)a3 error:(id)a4
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession wifiP2PControllerDidDisconnect:error:]", 56, self, @"Session invalidated, error=%@", v4, v5, (uint64_t)a4);

  sub_100026588(self, v7, v8, v9, v10, v11, v12, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_clientHandle, 0);
  objc_storeStrong((id *)&self->_serverHandle, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_p2pController, 0);
  objc_storeStrong(&self->_configObject, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end