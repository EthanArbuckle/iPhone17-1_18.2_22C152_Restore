@interface TUIButtonBarGroupSet
- (NSArray)leadingButtonGroups;
- (NSArray)leadingSeparators;
- (NSArray)trailingButtonGroups;
- (NSArray)trailingSeparators;
- (NSArray)unifiedButtonGroups;
- (NSArray)unifiedSeparators;
- (void)setLeadingButtonGroups:(id)a3;
- (void)setLeadingSeparators:(id)a3;
- (void)setTrailingButtonGroups:(id)a3;
- (void)setTrailingSeparators:(id)a3;
- (void)setUnifiedButtonGroups:(id)a3;
- (void)setUnifiedSeparators:(id)a3;
@end

@implementation TUIButtonBarGroupSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedSeparators, 0);
  objc_storeStrong((id *)&self->_trailingSeparators, 0);
  objc_storeStrong((id *)&self->_leadingSeparators, 0);
  objc_storeStrong((id *)&self->_unifiedButtonGroups, 0);
  objc_storeStrong((id *)&self->_trailingButtonGroups, 0);
  objc_storeStrong((id *)&self->_leadingButtonGroups, 0);
}

- (void)setUnifiedSeparators:(id)a3
{
}

- (NSArray)unifiedSeparators
{
  return self->_unifiedSeparators;
}

- (void)setTrailingSeparators:(id)a3
{
}

- (NSArray)trailingSeparators
{
  return self->_trailingSeparators;
}

- (void)setLeadingSeparators:(id)a3
{
}

- (NSArray)leadingSeparators
{
  return self->_leadingSeparators;
}

- (void)setUnifiedButtonGroups:(id)a3
{
}

- (NSArray)unifiedButtonGroups
{
  return self->_unifiedButtonGroups;
}

- (void)setTrailingButtonGroups:(id)a3
{
}

- (NSArray)trailingButtonGroups
{
  return self->_trailingButtonGroups;
}

- (void)setLeadingButtonGroups:(id)a3
{
}

- (NSArray)leadingButtonGroups
{
  return self->_leadingButtonGroups;
}

@end