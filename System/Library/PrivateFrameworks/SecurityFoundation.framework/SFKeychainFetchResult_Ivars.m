@interface SFKeychainFetchResult_Ivars
@end

@implementation SFKeychainFetchResult_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->error, 0);
  objc_storeStrong(&self->value, 0);
}

@end