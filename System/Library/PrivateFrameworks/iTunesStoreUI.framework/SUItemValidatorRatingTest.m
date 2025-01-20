@interface SUItemValidatorRatingTest
- (BOOL)validateItems:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SUItemValidatorRatingTest

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUItemValidatorRatingTest;
  return [(SUItemValidatorTest *)&v4 copyWithZone:a3];
}

- (BOOL)validateItems:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      v10 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v9) contentRating];
      if ([v10 shouldHideWhenRestricted])
      {
        if ([v10 isRestricted]) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    BOOL result = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_10:
  BOOL result = 1;
  if (a4) {
LABEL_13:
  }
    *a4 = 0;
  return result;
}

@end