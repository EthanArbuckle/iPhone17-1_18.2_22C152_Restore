@interface PSUICellularUsageContentSpecifiers
- (NSArray)leadingContentSpecifiers;
- (NSArray)trailingContentSpecifiers;
- (NSMutableArray)appSpecifiers;
- (id)specifiers;
- (void)setAppSpecifiers:(id)a3;
- (void)setLeadingContentSpecifiers:(id)a3;
- (void)setTrailingContentSpecifiers:(id)a3;
@end

@implementation PSUICellularUsageContentSpecifiers

- (id)specifiers
{
  v3 = [(NSArray *)self->_leadingContentSpecifiers arrayByAddingObjectsFromArray:self->_appSpecifiers];
  v4 = [v3 arrayByAddingObjectsFromArray:self->_trailingContentSpecifiers];

  return v4;
}

- (NSArray)leadingContentSpecifiers
{
  return self->_leadingContentSpecifiers;
}

- (void)setLeadingContentSpecifiers:(id)a3
{
}

- (NSMutableArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
}

- (NSArray)trailingContentSpecifiers
{
  return self->_trailingContentSpecifiers;
}

- (void)setTrailingContentSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingContentSpecifiers, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_leadingContentSpecifiers, 0);
}

@end