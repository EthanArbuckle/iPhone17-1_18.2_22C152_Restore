@interface WBSURLCompletionUserTypedString
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSArray)components;
- (NSString)normalizedString;
- (NSString)searchQueryParameterString;
- (WBSURLCompletionUserTypedString)init;
- (WBSURLCompletionUserTypedString)initWithCoder:(id)a3;
- (WBSURLCompletionUserTypedString)initWithString:(id)a3;
- (WBSURLCompletionUserTypedString)stringWithoutWhitespace;
- (WBSURLCompletionUserTypedString)typedStringForURLMatching;
- (id).cxx_construct;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSURLCompletionUserTypedString

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    systemEightBitStringEncoding = CFStringGetFastestEncoding(@" ");
  }
}

- (WBSURLCompletionUserTypedString)init
{
  return 0;
}

- (WBSURLCompletionUserTypedString)initWithString:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSURLCompletionUserTypedString;
  v5 = [(WBSURLCompletionUserTypedString *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = objc_msgSend(v4, "safari_stringByFoldingWideCharactersAndNormalizing");
    string = v6->_string;
    v6->_string = (NSString *)v7;

    v6->_length = CFStringGetLength((CFStringRef)v6->_string);
    v6->_containsAnySpaces = CFStringFind((CFStringRef)v6->_string, @" ", 0).location != -1;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)v6->_string);
    v6->_unichars = CharactersPtr;
    if (!CharactersPtr) {
      operator new[]();
    }
    CStringPtr = CFStringGetCStringPtr((CFStringRef)v6->_string, systemEightBitStringEncoding);
    v6->_chars = CStringPtr;
    if (!CStringPtr) {
      operator new[]();
    }
    v11 = v6;
  }

  return v6;
}

- (WBSURLCompletionUserTypedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userTypedString"];
  v6 = [(WBSURLCompletionUserTypedString *)self initWithString:v5];

  return v6;
}

- (void)dealloc
{
  if (self->_ownsUnichars)
  {
    unichars = self->_unichars;
    if (unichars) {
      MEMORY[0x1AD0C4750](unichars, 0x1000C40BDFB0063);
    }
  }
  if (self->_ownsChars)
  {
    chars = self->_chars;
    if (chars) {
      MEMORY[0x1AD0C4750](chars, 0x1000C4077774924);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)WBSURLCompletionUserTypedString;
  [(WBSURLCompletionUserTypedString *)&v5 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)searchQueryParameterString
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_searchQueryParameterString)
  {
    id v4 = NSString;
    objc_super v5 = [(NSString *)self->_string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    [v4 stringWithFormat:@"q=%@", v5];
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    searchQueryParameterString = self->_searchQueryParameterString;
    self->_searchQueryParameterString = v6;
  }
  os_unfair_lock_unlock(p_lock);
  v8 = self->_searchQueryParameterString;
  return v8;
}

- (WBSURLCompletionUserTypedString)stringWithoutWhitespace
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_stringWithoutWhitespace)
  {
    string = self->_string;
    objc_super v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v6 = [(NSString *)string safari_stringByRemovingCharactersInSet:v5];
    stringWithoutWhitespace = self->_stringWithoutWhitespace;
    self->_stringWithoutWhitespace = v6;
  }
  os_unfair_lock_unlock(p_lock);
  v8 = self->_stringWithoutWhitespace;
  return (WBSURLCompletionUserTypedString *)v8;
}

- (NSArray)components
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_components)
  {
    string = self->_string;
    objc_super v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v6 = [(NSString *)string componentsSeparatedByCharactersInSet:v5];
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_114);
    uint64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    components = self->_components;
    self->_components = v7;
  }
  os_unfair_lock_unlock(p_lock);
  v9 = self->_components;
  return v9;
}

BOOL __45__WBSURLCompletionUserTypedString_components__block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (WBSURLCompletionUserTypedString)typedStringForURLMatching
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  typedStringForURLMatching = v2->_typedStringForURLMatching;
  os_unfair_lock_unlock(p_lock);
  if (typedStringForURLMatching)
  {
    objc_super v5 = v2->_typedStringForURLMatching;
LABEL_9:
    v10 = v5;
    goto LABEL_10;
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v2->_stringOnlyContainsWhitespaces);
  if (v6)
  {
    objc_super v5 = v2;
    goto LABEL_9;
  }
  uint64_t v7 = [(NSString *)v2->_string safari_stringByTrimmingWhitespace];
  if ([v7 length])
  {
    os_unfair_lock_lock(p_lock);
    if (!v2->_typedStringForURLMatching)
    {
      v8 = [[WBSURLCompletionUserTypedString alloc] initWithString:v7];
      v9 = v2->_typedStringForURLMatching;
      v2->_typedStringForURLMatching = v8;
    }
    os_unfair_lock_unlock(p_lock);
    v2 = v2->_typedStringForURLMatching;
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&v2->_stringOnlyContainsWhitespaces);
  }
  v10 = v2;

LABEL_10:
  return v10;
}

- (NSString)normalizedString
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typedStringForURLMatching, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_stringWithoutWhitespace, 0);
  objc_storeStrong((id *)&self->_searchQueryParameterString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 44) = 0;
  return self;
}

@end