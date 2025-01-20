@interface PKPaymentPreference
- (BOOL)isReadOnly;
- (BOOL)preferenceObject:(id)a3 representsContact:(id)a4;
- (BOOL)supportsDeletion;
- (NSArray)preferences;
- (NSMutableDictionary)errors;
- (NSString)footer;
- (NSString)title;
- (PKPaymentPreference)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6;
- (_NSRange)footerLinkRange;
- (id)errorsForPreference:(id)a3;
- (id)footerLinkActionBlock;
- (unint64_t)pendingIndex;
- (unint64_t)selectedIndex;
- (void)clearAllErrors;
- (void)setErrors:(id)a3;
- (void)setErrors:(id)a3 forPreference:(id)a4;
- (void)setFooter:(id)a3;
- (void)setFooterLinkActionBlock:(id)a3;
- (void)setFooterLinkRange:(_NSRange)a3;
- (void)setIsReadOnly:(BOOL)a3;
- (void)setPendingIndex:(unint64_t)a3;
- (void)setPreferences:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPaymentPreference

- (PKPaymentPreference)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentPreference;
  v12 = [(PKPaymentPreference *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preferences, a4);
    v13->_selectedIndex = a5;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    errors = v13->_errors;
    v13->_errors = v14;

    v13->_isReadOnly = a6;
    uint64_t v16 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v16;

    v13->_pendingIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (void)setErrors:(id)a3 forPreference:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NSArray *)self->_preferences indexOfObject:v6] != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableDictionary *)self->_errors setObject:v7 forKey:v6];
  }
}

- (id)errorsForPreference:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_errors objectForKey:a3];
}

- (void)clearAllErrors
{
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  errors = self->_errors;
  self->_errors = v3;
}

- (BOOL)preferenceObject:(id)a3 representsContact:(id)a4
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (_NSRange)footerLinkRange
{
  NSUInteger length = self->_footerLinkRange.length;
  NSUInteger location = self->_footerLinkRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setFooterLinkRange:(_NSRange)a3
{
  self->_footerLinkRange = a3;
}

- (id)footerLinkActionBlock
{
  return self->_footerLinkActionBlock;
}

- (void)setFooterLinkActionBlock:(id)a3
{
}

- (NSArray)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (unint64_t)pendingIndex
{
  return self->_pendingIndex;
}

- (void)setPendingIndex:(unint64_t)a3
{
  self->_pendingIndex = a3;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (BOOL)supportsDeletion
{
  return self->_supportsDeletion;
}

- (NSMutableDictionary)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong(&self->_footerLinkActionBlock, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end