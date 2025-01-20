@interface boringssl_concrete_boringssl_psk_cache
@end

@implementation boringssl_concrete_boringssl_psk_cache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->psk_selection_queue, 0);
  objc_storeStrong(&self->psk_selection_block, 0);
  objc_storeStrong((id *)&self->context, 0);

  objc_storeStrong((id *)&self->list, 0);
}

@end