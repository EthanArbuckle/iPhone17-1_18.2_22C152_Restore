@interface NWConcrete_nwswifttls
- (void)dealloc;
@end

@implementation NWConcrete_nwswifttls

- (void)dealloc
{
  if (self->metadata) {
    nw_protocol_metadata_access_handle();
  }
  v3.receiver = self;
  v3.super_class = (Class)NWConcrete_nwswifttls;
  [(NWConcrete_nwswifttls *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->handshaker, 0);
  objc_storeStrong((id *)&self->server_name, 0);
  objc_storeStrong((id *)&self->application_protocols, 0);
  objc_storeStrong((id *)&self->quic_transport_parameters, 0);
  objc_storeStrong((id *)&self->spki, 0);
  objc_storeStrong((id *)&self->session_state, 0);
  objc_storeStrong((id *)&self->session_update_queue, 0);
  objc_storeStrong(&self->session_update_block, 0);
  objc_storeStrong((id *)&self->tls_encryption_level_update_queue, 0);
  objc_storeStrong(&self->tls_encryption_level_update_block, 0);
  objc_storeStrong(&self->tls_secret_update_block, 0);
  objc_storeStrong((id *)&self->metadata, 0);

  objc_storeStrong((id *)&self->options, 0);
}

@end