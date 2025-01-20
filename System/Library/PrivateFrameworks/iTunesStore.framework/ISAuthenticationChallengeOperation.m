@interface ISAuthenticationChallengeOperation
+ (id)operationWithChallenge:(id)a3;
- (ISAuthenticationChallenge)challenge;
- (NSURLCredential)credential;
- (id)_copyCredentialForSignInResponseDictionary:(id)a3;
- (void)dealloc;
- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4;
- (void)run;
- (void)setChallenge:(id)a3;
- (void)setCredential:(id)a3;
@end

@implementation ISAuthenticationChallengeOperation

- (void)dealloc
{
  [(ISAuthenticationChallengeOperation *)self setChallenge:0];
  [(ISAuthenticationChallengeOperation *)self setCredential:0];
  v3.receiver = self;
  v3.super_class = (Class)ISAuthenticationChallengeOperation;
  [(ISDialogOperation *)&v3 dealloc];
}

+ (id)operationWithChallenge:(id)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setChallenge:a3];

  return v4;
}

- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4
{
  if (a3 == 1) {
    id v7 = [(ISAuthenticationChallengeOperation *)self _copyCredentialForSignInResponseDictionary:a4];
  }
  else {
    id v7 = 0;
  }
  [(ISAuthenticationChallengeOperation *)self setCredential:v7];

  v8.receiver = self;
  v8.super_class = (Class)ISAuthenticationChallengeOperation;
  [(ISDialogOperation *)&v8 handleButtonSelected:a3 withResponseDictionary:a4];
}

- (void)run
{
  objc_super v3 = [[ISDialog alloc] initWithAuthenticationChallege:[(ISAuthenticationChallengeOperation *)self challenge]];
  [(ISDialog *)v3 setAllowDuplicates:1];
  [(ISDialogOperation *)self setDialog:v3];

  v4.receiver = self;
  v4.super_class = (Class)ISAuthenticationChallengeOperation;
  [(ISDialogOperation *)&v4 run];
}

- (id)_copyCredentialForSignInResponseDictionary:(id)a3
{
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x263F00030]);
  v5 = Value;
  if (!Value) {
    goto LABEL_8;
  }
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    CFTypeID v8 = CFGetTypeID(v5);
    if (v8 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v5) == 2)
    {
      ValueAtIndex = (NSString *)CFArrayGetValueAtIndex((CFArrayRef)v5, 0);
      v5 = (void *)CFArrayGetValueAtIndex((CFArrayRef)v5, 1);
      goto LABEL_9;
    }
    v5 = 0;
LABEL_8:
    ValueAtIndex = 0;
    goto LABEL_9;
  }
  ValueAtIndex = [[(ISAuthenticationChallengeOperation *)self challenge] user];
LABEL_9:
  if (!-[NSString length](ValueAtIndex, "length") || ![v5 length]) {
    return 0;
  }
  id v9 = objc_alloc(MEMORY[0x263F08BB8]);

  return (id)[v9 initWithUser:ValueAtIndex password:v5 persistence:1];
}

- (ISAuthenticationChallenge)challenge
{
  return (ISAuthenticationChallenge *)objc_getProperty(self, a2, 376, 1);
}

- (void)setChallenge:(id)a3
{
}

- (NSURLCredential)credential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCredential:(id)a3
{
}

@end