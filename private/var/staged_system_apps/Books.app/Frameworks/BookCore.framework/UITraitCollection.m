@interface UITraitCollection
+ (id)bc_allAPITraits;
+ (id)bk_traitCollectionWithReadingMode:(unint64_t)a3;
+ (id)currentTraitCollectionLimitedToSizeCategory:(id)a3;
- (BOOL)bc_knownPropertiesEqual:(id)a3;
- (BOOL)bc_userInterfaceStyleDark;
- (id)traitCollectionLimitedToSizeCategory:(id)a3;
@end

@implementation UITraitCollection

+ (id)bc_allAPITraits
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:14];

  return v2;
}

- (BOOL)bc_userInterfaceStyleDark
{
  return (char *)[(UITraitCollection *)self userInterfaceStyle] == (char *)&def_7D91C + 2;
}

- (BOOL)bc_knownPropertiesEqual:(id)a3
{
  v4 = (UITraitCollection *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    v5 = [(UITraitCollection *)self userInterfaceIdiom];
    if (v5 == (void *)[(UITraitCollection *)v4 userInterfaceIdiom]
      && ([(UITraitCollection *)self displayScale],
          double v7 = v6,
          [(UITraitCollection *)v4 displayScale],
          v7 == v8)
      && (v9 = [(UITraitCollection *)self displayGamut],
          v9 == (void *)[(UITraitCollection *)v4 displayGamut])
      && (v10 = [(UITraitCollection *)self userInterfaceStyle],
          v10 == (void *)[(UITraitCollection *)v4 userInterfaceStyle])
      && (v11 = [(UITraitCollection *)self layoutDirection],
          v11 == (void *)[(UITraitCollection *)v4 layoutDirection])
      && (v12 = [(UITraitCollection *)self forceTouchCapability],
          v12 == (void *)[(UITraitCollection *)v4 forceTouchCapability]))
    {
      v13 = [(UITraitCollection *)self preferredContentSizeCategory];
      v14 = [(UITraitCollection *)v4 preferredContentSizeCategory];
      if (v13 == v14
        && (v15 = [(UITraitCollection *)self accessibilityContrast],
            v15 == (void *)[(UITraitCollection *)v4 accessibilityContrast]))
      {
        id v16 = [(UITraitCollection *)self userInterfaceLevel];
        char v17 = v16 == (id)[(UITraitCollection *)v4 userInterfaceLevel];
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (id)traitCollectionLimitedToSizeCategory:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CD128;
  v7[3] = &unk_2C8568;
  id v8 = a3;
  id v4 = v8;
  v5 = [(UITraitCollection *)self traitCollectionByModifyingTraits:v7];

  return v5;
}

+ (id)currentTraitCollectionLimitedToSizeCategory:(id)a3
{
  id v3 = a3;
  id v4 = +[UITraitCollection currentTraitCollection];
  v5 = [v4 traitCollectionLimitedToSizeCategory:v3];

  return v5;
}

+ (id)bk_traitCollectionWithReadingMode:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[UITraitCollection _traitCollectionWithValue:v3 forTraitNamed:@"BKClientTraitReadingModeKey"];

  return v4;
}

@end