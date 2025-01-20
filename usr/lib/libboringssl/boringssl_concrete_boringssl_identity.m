@interface boringssl_concrete_boringssl_identity
- (void)dealloc;
@end

@implementation boringssl_concrete_boringssl_identity

- (void)dealloc
{
  private_key = self->private_key;
  if (private_key) {
    CFRelease(private_key);
  }
  self->private_key = 0;
  v4.receiver = self;
  v4.super_class = (Class)boringssl_concrete_boringssl_identity;
  [(boringssl_concrete_boringssl_identity *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->decryption_result, 0);
  objc_storeStrong((id *)&self->signature_result, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong(&self->decrypt_block, 0);
  objc_storeStrong(&self->sign_block, 0);
  objc_storeStrong((id *)&self->identity, 0);

  objc_storeStrong((id *)&self->certificates, 0);
}

@end