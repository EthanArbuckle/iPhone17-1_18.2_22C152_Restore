@interface NEPrivateLTEMonitor
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
@end

@implementation NEPrivateLTEMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_privateLTENetworks, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_currentInterface, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ connection state changed for context: %@", (uint8_t *)&v11, 0x16u);
  }

  if (!a4) {
    sub_100093C84((uint64_t)self, v8, v9);
  }
}

@end