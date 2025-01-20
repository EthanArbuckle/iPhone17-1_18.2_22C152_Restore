@interface PKTextFieldTableViewSettingsRowFormatter
- (BOOL)isEqual:(id)a3;
- (NSSet)formatPaddingCharacters;
- (id)formattedValueFromInput:(id)a3;
- (id)submissionValueFromFormattedInput:(id)a3;
- (unint64_t)hash;
- (void)setFormatPaddingCharacters:(id)a3;
@end

@implementation PKTextFieldTableViewSettingsRowFormatter

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_formatPaddingCharacters];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKTextFieldTableViewSettingsRowFormatter *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = PKEqualObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)formattedValueFromInput:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)submissionValueFromFormattedInput:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    v5 = (void *)[v4 copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v6 = [(PKTextFieldTableViewSettingsRowFormatter *)self formatPaddingCharacters];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        v11 = v5;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v5 = [v11 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v13 + 1) + 8 * v10) withString:&stru_1EF1B5B50];

          ++v10;
          v11 = v5;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)formatPaddingCharacters
{
  return self->_formatPaddingCharacters;
}

- (void)setFormatPaddingCharacters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end