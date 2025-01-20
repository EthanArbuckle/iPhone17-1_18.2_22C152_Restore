@interface NSError(WFMDM)
+ (id)sharingMixedMDMContentErrorWithActionName:()WFMDM;
@end

@implementation NSError(WFMDM)

+ (id)sharingMixedMDMContentErrorWithActionName:()WFMDM
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v6 = WFLocalizedString(@"Sharing content that contains both managed and unmanaged data is not allowed.");
  v7 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, *MEMORY[0x1E4F28568], 0);

  if (v4)
  {
    v8 = NSString;
    v9 = WFLocalizedString(@"Couldn’t Run “%@”");
    v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v4, 0);

    [v7 setObject:v10 forKey:*MEMORY[0x1E4F28588]];
  }
  v11 = [a1 errorWithDomain:@"WFActionErrorDomain" code:8 userInfo:v7];

  return v11;
}

@end