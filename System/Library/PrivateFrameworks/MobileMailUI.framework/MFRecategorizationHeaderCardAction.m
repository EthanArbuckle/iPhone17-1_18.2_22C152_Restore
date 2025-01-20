@interface MFRecategorizationHeaderCardAction
- (BOOL)isExpanded;
- (BOOL)isSenderRecategorization;
- (NSArray)children;
- (void)setChildren:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsSenderRecategorization:(BOOL)a3;
@end

@implementation MFRecategorizationHeaderCardAction

- (BOOL)isSenderRecategorization
{
  return self->_isSenderRecategorization;
}

- (void)setIsSenderRecategorization:(BOOL)a3
{
  self->_isSenderRecategorization = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
}

@end