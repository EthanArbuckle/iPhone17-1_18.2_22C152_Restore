@interface SBDodgingItem
- (BOOL)isEqual:(id)a3;
- (CGPoint)center;
- (CGSize)containerSize;
- (CGSize)size;
- (NSArray)otherDodgingIdentifiers;
- (NSString)uniqueIdentifier;
- (SBDodgingItem)initWithUniqueIdentifier:(id)a3 view:(id)a4 delegate:(id)a5 dodgingResolverViewController:(id)a6;
- (SBDodgingItemDelegate)delegate;
- (SBDodgingItemPreference)preference;
- (UICoordinateSpace)containerCoordinateSpace;
- (UIView)view;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)invalidate;
- (unint64_t)hash;
- (void)setCenter:(CGPoint)a3;
- (void)setContainerCoordinateSpace:(id)a3;
- (void)setContainerSize:(CGSize)a3;
- (void)setNeedsUpdateAnimated:(BOOL)a3;
- (void)setOtherDodgingIdentifiers:(id)a3;
- (void)setPreference:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SBDodgingItem

- (SBDodgingItem)initWithUniqueIdentifier:(id)a3 view:(id)a4 delegate:(id)a5 dodgingResolverViewController:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBDodgingItem;
  v15 = [(SBDodgingItem *)&v23 init];
  if (v15)
  {
    if (v11)
    {
      if (v13) {
        goto LABEL_4;
      }
    }
    else
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v15, @"SBDodgingItem.m", 22, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier" object file lineNumber description];

      if (v13)
      {
LABEL_4:
        if (v14)
        {
LABEL_5:
          uint64_t v16 = [v11 copy];
          uniqueIdentifier = v15->_uniqueIdentifier;
          v15->_uniqueIdentifier = (NSString *)v16;

          objc_storeStrong((id *)&v15->_view, a4);
          objc_storeWeak((id *)&v15->_delegate, v13);
          objc_storeStrong((id *)&v15->_dodgingResolverViewController, a6);
          goto LABEL_6;
        }
LABEL_9:
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        v22 = [NSString stringWithUTF8String:"-[SBDodgingItem initWithUniqueIdentifier:view:delegate:dodgingResolverViewController:]"];
        [v21 handleFailureInFunction:v22, @"SBDodgingItem.m", 24, @"Invalid parameter not satisfying: %@", @"dodgingResolverViewController" file lineNumber description];

        goto LABEL_5;
      }
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, v15, @"SBDodgingItem.m", 23, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v15;
}

- (void)setNeedsUpdateAnimated:(BOOL)a3
{
}

- (id)invalidate
{
  return [(SBDodgingResolverViewController *)self->_dodgingResolverViewController invalidateItem:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uniqueIdentifier = self->_uniqueIdentifier;
  view = self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (void *)[v4 initWithUniqueIdentifier:uniqueIdentifier view:view delegate:WeakRetained dodgingResolverViewController:self->_dodgingResolverViewController];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 uniqueIdentifier];
    char v6 = [v5 isEqualToString:self->_uniqueIdentifier];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uniqueIdentifier hash];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SBDodgingItem;
  v3 = [(SBDodgingItem *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" %@", self->_uniqueIdentifier];

  return v4;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  self->_containerSize = a3;
}

- (UICoordinateSpace)containerCoordinateSpace
{
  return self->_containerCoordinateSpace;
}

- (void)setContainerCoordinateSpace:(id)a3
{
}

- (NSArray)otherDodgingIdentifiers
{
  return self->_otherDodgingIdentifiers;
}

- (void)setOtherDodgingIdentifiers:(id)a3
{
}

- (SBDodgingItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDodgingItemDelegate *)WeakRetained;
}

- (UIView)view
{
  return self->_view;
}

- (SBDodgingItemPreference)preference
{
  return self->_preference;
}

- (void)setPreference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherDodgingIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_dodgingResolverViewController, 0);
}

@end