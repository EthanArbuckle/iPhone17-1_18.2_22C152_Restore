@interface NESMProviderRegistration
- (BOOL)isEqual:(id)a3;
@end

@implementation NESMProviderRegistration

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v5 = 0;
    if (self) {
      goto LABEL_4;
    }
LABEL_9:
    unint64_t token = 0;
    goto LABEL_5;
  }
  uint64_t v5 = v4[1];
  if (!self) {
    goto LABEL_9;
  }
LABEL_4:
  unint64_t token = self->_token;
LABEL_5:
  BOOL v7 = v5 == token;
LABEL_7:

  return v7;
}

@end