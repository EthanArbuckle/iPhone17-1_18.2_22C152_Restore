@interface OS_xpc_remote_connection
- (BOOL)send_in_progress;
- (OS_dispatch_queue)internal_queue;
- (OS_dispatch_queue)target_queue;
- (OS_dispatch_queue)tls_verify_queue;
- (OS_sec_identity)tls_identity;
- (OS_xpc_remote_listener)listener;
- (id)event_handler;
- (id)tls_verify;
- (int)state;
- (int)type;
- (void)dealloc;
- (void)setEvent_handler:(id)a3;
- (void)setInternal_queue:(id)a3;
- (void)setListener:(id)a3;
- (void)setSend_in_progress:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTarget_queue:(id)a3;
- (void)setTls_identity:(id)a3;
- (void)setTls_verify:(id)a3;
- (void)setTls_verify_queue:(id)a3;
- (void)setType:(int)a3;
@end

@implementation OS_xpc_remote_connection

- (OS_dispatch_queue)target_queue
{
  return self->_target_queue;
}

- (id)event_handler
{
  return self->_event_handler;
}

- (OS_dispatch_queue)internal_queue
{
  return self->_internal_queue;
}

- (int)state
{
  return self->_state;
}

- (int)type
{
  return self->_type;
}

- (void)dealloc
{
  free(self->remote_service_name);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_remote_connection;
  [(OS_xpc_remote_connection *)&v3 dealloc];
}

- (void)setInternal_queue:(id)a3
{
}

- (void)setTarget_queue:(id)a3
{
}

- (void)setEvent_handler:(id)a3
{
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)send_in_progress
{
  return self->_send_in_progress;
}

- (void)setSend_in_progress:(BOOL)a3
{
  self->_send_in_progress = a3;
}

- (OS_xpc_remote_listener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_sec_identity)tls_identity
{
  return self->_tls_identity;
}

- (void)setTls_identity:(id)a3
{
}

- (id)tls_verify
{
  return self->_tls_verify;
}

- (void)setTls_verify:(id)a3
{
}

- (OS_dispatch_queue)tls_verify_queue
{
  return self->_tls_verify_queue;
}

- (void)setTls_verify_queue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tls_verify_queue, 0);
  objc_storeStrong(&self->_tls_verify, 0);
  objc_storeStrong((id *)&self->_tls_identity, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_event_handler, 0);
  objc_storeStrong((id *)&self->_target_queue, 0);
  objc_storeStrong((id *)&self->_internal_queue, 0);
  objc_storeStrong((id *)&self->preexisting_connection, 0);
  objc_storeStrong((id *)&self->remote_service, 0);
  objc_storeStrong((id *)&self->outstanding_replies_stqh_last, 0);
  objc_storeStrong((id *)&self->outstanding_replies_stqh_first, 0);
  objc_storeStrong((id *)&self->streams_stqh_last, 0);
  objc_storeStrong((id *)&self->streams_stqh_first, 0);
  objc_storeStrong((id *)&self->pending_streams_stqh_last, 0);
  objc_storeStrong((id *)&self->pending_streams_stqh_first, 0);
  objc_storeStrong((id *)&self->msgq_stqh_last, 0);
  objc_storeStrong((id *)&self->msgq_stqh_first, 0);
  objc_storeStrong((id *)&self->reply_channel, 0);
  objc_storeStrong((id *)&self->root_channel, 0);
  objc_storeStrong((id *)&self->root_listener, 0);
  objc_storeStrong((id *)&self->root_connection, 0);
}

@end