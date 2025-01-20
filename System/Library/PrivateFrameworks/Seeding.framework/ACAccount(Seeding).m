@interface ACAccount(Seeding)
- (void)fetchCredentialTokenWithCompletion:()Seeding;
@end

@implementation ACAccount(Seeding)

- (void)fetchCredentialTokenWithCompletion:()Seeding
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__ACAccount_Seeding__fetchCredentialTokenWithCompletion___block_invoke;
  v6[3] = &unk_1E6CD8908;
  v6[4] = a1;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "aida_tokenForService:completionHandler:", @"com.apple.gs.beta.auth", v6);
}

@end