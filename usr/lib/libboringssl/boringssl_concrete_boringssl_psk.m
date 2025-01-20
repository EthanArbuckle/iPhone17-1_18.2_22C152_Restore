@interface boringssl_concrete_boringssl_psk
@end

@implementation boringssl_concrete_boringssl_psk

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identity, 0);

  objc_storeStrong((id *)&self->key, 0);
}

@end