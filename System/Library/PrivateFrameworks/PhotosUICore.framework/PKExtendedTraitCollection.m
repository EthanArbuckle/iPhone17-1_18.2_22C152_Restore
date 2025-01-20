@interface PKExtendedTraitCollection
- (UITraitCollection)traitCollectionForMapKit;
- (double)displayScale;
- (id)description;
- (int64_t)layoutSizeClass;
- (int64_t)layoutSizeSubclass;
- (int64_t)userInterfaceIdiom;
- (int64_t)userInterfaceStyle;
- (void)setDisplayScale:(double)a3;
- (void)setLayoutSizeClass:(int64_t)a3;
- (void)setLayoutSizeSubclass:(int64_t)a3;
- (void)setTraitCollectionForMapKit:(id)a3;
- (void)setUserInterfaceIdiom:(int64_t)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation PKExtendedTraitCollection

- (void).cxx_destruct
{
}

- (void)setTraitCollectionForMapKit:(id)a3
{
}

- (UITraitCollection)traitCollectionForMapKit
{
  return self->_traitCollectionForMapKit;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  self->_userInterfaceIdiom = a3;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (void)setLayoutSizeSubclass:(int64_t)a3
{
  self->_layoutSizeSubclass = a3;
}

- (int64_t)layoutSizeSubclass
{
  return self->_layoutSizeSubclass;
}

- (void)setLayoutSizeClass:(int64_t)a3
{
  self->_layoutSizeClass = a3;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(PKExtendedTraitCollection *)self userInterfaceIdiom];
  int64_t v5 = [(PKExtendedTraitCollection *)self layoutSizeClass];
  int64_t v6 = [(PKExtendedTraitCollection *)self layoutSizeSubclass];
  [(PKExtendedTraitCollection *)self displayScale];
  v8 = objc_msgSend(v3, "stringWithFormat:", @"userInterfaceIdiom %ld layoutSizeClass %ld layoutSizeSubclass %ld displayScale %f userInterfaceStyle %ld", v4, v5, v6, v7, -[PKExtendedTraitCollection userInterfaceStyle](self, "userInterfaceStyle"));
  v9 = (void *)[v8 mutableCopy];

  v10 = NSString;
  v11 = [(PKExtendedTraitCollection *)self traitCollectionForMapKit];
  v12 = [v10 stringWithFormat:@" traitCollectionForMapKit: %@", v11];
  [v9 appendString:v12];

  return v9;
}

@end