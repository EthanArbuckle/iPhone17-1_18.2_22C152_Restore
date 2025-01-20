@interface SBDodgingItemPreference
- (BOOL)canBePositionedOutsideContainerBounds;
- (BOOL)isUpdatingInteractively;
- (CGPoint)preferredCenter;
- (CGSize)minimumSize;
- (CGSize)preferredSize;
- (NSSet)excludedDodgingIdentifiers;
- (SBDodgingItemPreference)initWithPreferredSize:(CGSize)a3 preferredCenter:(CGPoint)a4 updateInteractively:(BOOL)a5 dodgingAxisMask:(unint64_t)a6 minimumSize:(CGSize)a7 canBePositionedOutsideContainerBounds:(BOOL)a8 excludedDodgingIdentifiers:(id)a9;
- (unint64_t)dodgingAxisMask;
@end

@implementation SBDodgingItemPreference

- (SBDodgingItemPreference)initWithPreferredSize:(CGSize)a3 preferredCenter:(CGPoint)a4 updateInteractively:(BOOL)a5 dodgingAxisMask:(unint64_t)a6 minimumSize:(CGSize)a7 canBePositionedOutsideContainerBounds:(BOOL)a8 excludedDodgingIdentifiers:(id)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v16 = a3.height;
  CGFloat v17 = a3.width;
  id v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SBDodgingItemPreference;
  v20 = [(SBDodgingItemPreference *)&v25 init];
  v21 = v20;
  if (v20)
  {
    v20->_preferredSize.CGFloat width = v17;
    v20->_preferredSize.CGFloat height = v16;
    v20->_preferredCenter.CGFloat x = x;
    v20->_preferredCenter.CGFloat y = y;
    v20->_updateInteractivelCGFloat y = a5;
    v20->_dodgingAxisMask = a6;
    v20->_minimumSize.CGFloat width = width;
    v20->_minimumSize.CGFloat height = height;
    v20->_canBePositionedOutsideContainerBounds = a8;
    uint64_t v22 = [v19 copy];
    excludedDodgingIdentifiers = v21->_excludedDodgingIdentifiers;
    v21->_excludedDodgingIdentifiers = (NSSet *)v22;
  }
  return v21;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)preferredCenter
{
  double x = self->_preferredCenter.x;
  double y = self->_preferredCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isUpdatingInteractively
{
  return self->_updateInteractively;
}

- (unint64_t)dodgingAxisMask
{
  return self->_dodgingAxisMask;
}

- (CGSize)minimumSize
{
  double width = self->_minimumSize.width;
  double height = self->_minimumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)canBePositionedOutsideContainerBounds
{
  return self->_canBePositionedOutsideContainerBounds;
}

- (NSSet)excludedDodgingIdentifiers
{
  return self->_excludedDodgingIdentifiers;
}

- (void).cxx_destruct
{
}

@end