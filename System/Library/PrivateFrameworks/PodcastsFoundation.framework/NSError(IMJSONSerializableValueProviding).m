@interface NSError(IMJSONSerializableValueProviding)
- (id)im_jsonSerializableValue;
@end

@implementation NSError(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"code";
  v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1, "code"));
  v12[0] = v2;
  v11[1] = @"domain";
  uint64_t v3 = [a1 domain];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = &stru_1F03A51F0;
  }
  v12[1] = v5;
  v11[2] = @"localizedDescription";
  uint64_t v6 = [a1 localizedDescription];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_1F03A51F0;
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

@end