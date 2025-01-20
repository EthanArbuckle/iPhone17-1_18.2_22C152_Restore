@interface FRDynamicTypeValueScaler
+ (id)valueSpecifierWithXS:(double)a3 L:(double)a4 XXXL:(double)a5 AXXXL:(double)a6;
+ (id)valueSpecifierWithXSFactor:(double)a3 largeSize:(double)a4 XXXLFactor:(double)a5 AXXXLFactor:(double)a6;
- (FRDynamicTypeValueScaler)init;
- (FRDynamicTypeValueScaler)initWithWithXS:(double)a3 S:(double)a4 M:(double)a5 L:(double)a6 XL:(double)a7 XXL:(double)a8 XXXL:(double)a9 AM:(double)a10 AL:(double)a11 AXL:(double)a12 AXXL:(double)a13 AXXXL:(double)a14;
- (NSArray)orderedSizeCategories;
- (double)AL;
- (double)AM;
- (double)AXL;
- (double)AXXL;
- (double)AXXXL;
- (double)L;
- (double)M;
- (double)S;
- (double)XL;
- (double)XS;
- (double)XXL;
- (double)XXXL;
- (double)scaledValueForCurrentPreferredSizeCategory;
- (double)scaledValueForSizeCategory:(id)a3;
- (double)specifiedValueForContentSizeCategory:(id)a3;
- (void)_nextSpecifiedCategoryStartingAtCategory:(id)a3 outValue:(double *)a4 outIndex:(unint64_t *)a5;
- (void)_previousSpecifiedCategoryStartingAtCategory:(id)a3 outValue:(double *)a4 outIndex:(unint64_t *)a5;
- (void)setAL:(double)a3;
- (void)setAM:(double)a3;
- (void)setAXL:(double)a3;
- (void)setAXXL:(double)a3;
- (void)setAXXXL:(double)a3;
- (void)setL:(double)a3;
- (void)setM:(double)a3;
- (void)setS:(double)a3;
- (void)setXL:(double)a3;
- (void)setXS:(double)a3;
- (void)setXXL:(double)a3;
- (void)setXXXL:(double)a3;
@end

@implementation FRDynamicTypeValueScaler

- (FRDynamicTypeValueScaler)init
{
  return [(FRDynamicTypeValueScaler *)self initWithWithXS:1.79769313e308 S:1.79769313e308 M:1.79769313e308 L:1.79769313e308 XL:1.79769313e308 XXL:1.79769313e308 XXXL:1.79769313e308 AM:1.79769313e308 AL:0x7FEFFFFFFFFFFFFFLL AXL:0x7FEFFFFFFFFFFFFFLL AXXL:0x7FEFFFFFFFFFFFFFLL AXXXL:0x7FEFFFFFFFFFFFFFLL];
}

- (FRDynamicTypeValueScaler)initWithWithXS:(double)a3 S:(double)a4 M:(double)a5 L:(double)a6 XL:(double)a7 XXL:(double)a8 XXXL:(double)a9 AM:(double)a10 AL:(double)a11 AXL:(double)a12 AXXL:(double)a13 AXXXL:(double)a14
{
  v23.receiver = self;
  v23.super_class = (Class)FRDynamicTypeValueScaler;
  result = [(FRDynamicTypeValueScaler *)&v23 init];
  if (result)
  {
    result->_XS = a3;
    result->_S = a4;
    result->_M = a5;
    result->_L = a6;
    result->_XL = a7;
    result->_XXL = a8;
    result->_XXXL = a9;
    result->_AM = a10;
    result->_AL = a11;
    result->_AXL = a12;
    result->_AXXL = a13;
    result->_AXXXL = a14;
  }
  return result;
}

+ (id)valueSpecifierWithXS:(double)a3 L:(double)a4 XXXL:(double)a5 AXXXL:(double)a6
{
  v10 = objc_alloc_init(FRDynamicTypeValueScaler);
  [(FRDynamicTypeValueScaler *)v10 setXS:a3];
  [(FRDynamicTypeValueScaler *)v10 setL:a4];
  [(FRDynamicTypeValueScaler *)v10 setXXXL:a5];
  [(FRDynamicTypeValueScaler *)v10 setAXXXL:a6];

  return v10;
}

+ (id)valueSpecifierWithXSFactor:(double)a3 largeSize:(double)a4 XXXLFactor:(double)a5 AXXXLFactor:(double)a6
{
  return [a1 valueSpecifierWithXS:a3 * a4 L:a4 XXXL:a4 * a5 AXXXL:a4 * a6];
}

- (double)scaledValueForCurrentPreferredSizeCategory
{
  v3 = +[UIApplication sharedApplication];
  v4 = [v3 preferredContentSizeCategory];

  [(FRDynamicTypeValueScaler *)self scaledValueForSizeCategory:v4];
  double v6 = v5;

  return v6;
}

- (double)scaledValueForSizeCategory:(id)a3
{
  id v4 = a3;
  if (![v4 length] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100072A70();
  }
  [(FRDynamicTypeValueScaler *)self specifiedValueForContentSizeCategory:v4];
  double v6 = v5;
  if (v5 == 1.79769313e308)
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    double v17 = 1.79769313e308;
    [(FRDynamicTypeValueScaler *)self _previousSpecifiedCategoryStartingAtCategory:v4 outValue:&v17 outIndex:&v16];
    double v15 = 1.79769313e308;
    [(FRDynamicTypeValueScaler *)self _nextSpecifiedCategoryStartingAtCategory:v4 outValue:&v15 outIndex:&v14];
    if (v17 == 1.79769313e308 || v16 == 0x7FFFFFFFFFFFFFFFLL || v15 == 1.79769313e308 || v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [(FRDynamicTypeValueScaler *)self L];
      double v6 = v10;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100072990();
      }
    }
    else
    {
      v11 = [(FRDynamicTypeValueScaler *)self orderedSizeCategories];
      id v12 = [v11 indexOfObject:v4];

      double v6 = v17 + (v15 - v17) / (double)(unint64_t)(v14 - v16) * (double)((unint64_t)v12 - v16);
    }
  }

  return v6;
}

- (double)specifiedValueForContentSizeCategory:(id)a3
{
  id v4 = a3;
  [(FRDynamicTypeValueScaler *)self L];
  double v6 = v5;
  if ([v4 isEqualToString:UIContentSizeCategoryExtraSmall])
  {
    [(FRDynamicTypeValueScaler *)self XS];
LABEL_25:
    double v6 = v7;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:UIContentSizeCategorySmall])
  {
    [(FRDynamicTypeValueScaler *)self S];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryMedium])
  {
    [(FRDynamicTypeValueScaler *)self M];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryLarge])
  {
    [(FRDynamicTypeValueScaler *)self L];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryExtraLarge])
  {
    [(FRDynamicTypeValueScaler *)self XL];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryExtraExtraLarge])
  {
    [(FRDynamicTypeValueScaler *)self XXL];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge])
  {
    [(FRDynamicTypeValueScaler *)self XXXL];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryAccessibilityMedium])
  {
    [(FRDynamicTypeValueScaler *)self AM];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryAccessibilityLarge])
  {
    [(FRDynamicTypeValueScaler *)self AL];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge])
  {
    [(FRDynamicTypeValueScaler *)self AXL];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge])
  {
    [(FRDynamicTypeValueScaler *)self AXXL];
    goto LABEL_25;
  }
  if ([v4 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge])
  {
    [(FRDynamicTypeValueScaler *)self AXXXL];
    goto LABEL_25;
  }
LABEL_26:

  return v6;
}

- (NSArray)orderedSizeCategories
{
  v2 = (void *)qword_1000EDFA0;
  if (!qword_1000EDFA0)
  {
    v6[0] = UIContentSizeCategoryExtraSmall;
    v6[1] = UIContentSizeCategorySmall;
    v6[2] = UIContentSizeCategoryMedium;
    v6[3] = UIContentSizeCategoryLarge;
    v6[4] = UIContentSizeCategoryExtraLarge;
    v6[5] = UIContentSizeCategoryExtraExtraLarge;
    v6[6] = UIContentSizeCategoryExtraExtraExtraLarge;
    v6[7] = UIContentSizeCategoryAccessibilityMedium;
    v6[8] = UIContentSizeCategoryAccessibilityLarge;
    v6[9] = UIContentSizeCategoryAccessibilityExtraLarge;
    v6[10] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
    v6[11] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
    uint64_t v3 = +[NSArray arrayWithObjects:v6 count:12];
    id v4 = (void *)qword_1000EDFA0;
    qword_1000EDFA0 = v3;

    v2 = (void *)qword_1000EDFA0;
  }

  return (NSArray *)v2;
}

- (void)_previousSpecifiedCategoryStartingAtCategory:(id)a3 outValue:(double *)a4 outIndex:(unint64_t *)a5
{
  id v14 = a3;
  *a4 = 1.79769313e308;
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = [(FRDynamicTypeValueScaler *)self orderedSizeCategories];
  int64_t v9 = (int64_t)[v8 indexOfObject:v14];

  if ((v9 & 0x8000000000000000) == 0)
  {
    do
    {
      if (*a4 != 1.79769313e308) {
        break;
      }
      double v10 = [(FRDynamicTypeValueScaler *)self orderedSizeCategories];
      v11 = [v10 objectAtIndexedSubscript:v9];
      [(FRDynamicTypeValueScaler *)self specifiedValueForContentSizeCategory:v11];
      *(void *)a4 = v12;

      *a5 = v9;
    }
    while (v9-- > 0);
  }
}

- (void)_nextSpecifiedCategoryStartingAtCategory:(id)a3 outValue:(double *)a4 outIndex:(unint64_t *)a5
{
  id v15 = a3;
  *a4 = 1.79769313e308;
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = [(FRDynamicTypeValueScaler *)self orderedSizeCategories];
  int64_t v9 = (char *)[v8 indexOfObject:v15];

  double v10 = [(FRDynamicTypeValueScaler *)self orderedSizeCategories];
  v11 = (char *)[v10 count] - 1;

  for (; v9 <= v11; *a5 = (unint64_t)v9++)
  {
    if (*a4 != 1.79769313e308) {
      break;
    }
    uint64_t v12 = [(FRDynamicTypeValueScaler *)self orderedSizeCategories];
    v13 = [v12 objectAtIndexedSubscript:v9];
    [(FRDynamicTypeValueScaler *)self specifiedValueForContentSizeCategory:v13];
    *(void *)a4 = v14;
  }
}

- (double)XS
{
  return self->_XS;
}

- (void)setXS:(double)a3
{
  self->_XS = a3;
}

- (double)S
{
  return self->_S;
}

- (void)setS:(double)a3
{
  self->_S = a3;
}

- (double)M
{
  return self->_M;
}

- (void)setM:(double)a3
{
  self->_M = a3;
}

- (double)L
{
  return self->_L;
}

- (void)setL:(double)a3
{
  self->_L = a3;
}

- (double)XL
{
  return self->_XL;
}

- (void)setXL:(double)a3
{
  self->_XL = a3;
}

- (double)XXL
{
  return self->_XXL;
}

- (void)setXXL:(double)a3
{
  self->_XXL = a3;
}

- (double)XXXL
{
  return self->_XXXL;
}

- (void)setXXXL:(double)a3
{
  self->_XXXL = a3;
}

- (double)AM
{
  return self->_AM;
}

- (void)setAM:(double)a3
{
  self->_AM = a3;
}

- (double)AL
{
  return self->_AL;
}

- (void)setAL:(double)a3
{
  self->_AL = a3;
}

- (double)AXL
{
  return self->_AXL;
}

- (void)setAXL:(double)a3
{
  self->_AXL = a3;
}

- (double)AXXL
{
  return self->_AXXL;
}

- (void)setAXXL:(double)a3
{
  self->_AXXL = a3;
}

- (double)AXXXL
{
  return self->_AXXXL;
}

- (void)setAXXXL:(double)a3
{
  self->_AXXXL = a3;
}

@end