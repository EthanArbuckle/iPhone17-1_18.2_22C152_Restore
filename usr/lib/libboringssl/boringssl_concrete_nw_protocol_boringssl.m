@interface boringssl_concrete_nw_protocol_boringssl
- (void)dealloc;
@end

@implementation boringssl_concrete_nw_protocol_boringssl

- (void)dealloc
{
  nw_protocol_boringssl_cleanup(self);
  v3.receiver = self;
  v3.super_class = (Class)boringssl_concrete_nw_protocol_boringssl;
  [(boringssl_concrete_nw_protocol_boringssl *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->current_input_frame, 0);
  objc_storeStrong((id *)&self->client_queue, 0);
  objc_storeStrong((id *)&self->association, 0);
  objc_storeStrong((id *)&self->parameters, 0);
  objc_storeStrong(&self->message_writer, 0);

  objc_storeStrong((id *)&self->pending_output_data, 0);
}

@end