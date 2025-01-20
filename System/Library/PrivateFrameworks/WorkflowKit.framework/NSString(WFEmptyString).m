@interface NSString(WFEmptyString)
- (BOOL)wf_isEmpty;
- (id)wf_trimmedString;
@end

@implementation NSString(WFEmptyString)

- (BOOL)wf_isEmpty
{
  v1 = objc_msgSend(a1, "wf_trimmedString");
  BOOL v2 = [v1 length] == 0;

  return v2;
}

- (id)wf_trimmedString
{
  BOOL v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

@end