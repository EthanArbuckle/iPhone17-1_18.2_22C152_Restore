@interface SXLayoutOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)smartInvertColorsEnabled;
- (BOOL)testing;
- (CGSize)viewportSize;
- (NSSet)conditionKeys;
- (NSString)contentSizeCategory;
- (SXColumnLayout)columnLayout;
- (SXLayoutOptions)initWithColumnLayout:(id)a3 viewportSize:(CGSize)a4 traitCollection:(id)a5 contentSizeCategory:(id)a6 bundleSubscriptionStatus:(int64_t)a7 channelSubscriptionStatus:(int64_t)a8 testing:(BOOL)a9 viewingLocation:(unint64_t)a10 contentScaleFactor:(double)a11 newsletterSubscriptionStatus:(unint64_t)a12 offerUpsellScenario:(int64_t)a13 subscriptionActivationEligibility:(int64_t)a14 smartInvertColorsEnabled:(BOOL)a15 conditionKeys:(id)a16;
- (UITraitCollection)traitCollection;
- (double)contentScaleFactor;
- (id)description;
- (int64_t)bundleSubscriptionStatus;
- (int64_t)channelSubscriptionStatus;
- (int64_t)offerUpsellScenario;
- (int64_t)subscriptionActivationEligibility;
- (unint64_t)diffWithLayoutOptions:(id)a3;
- (unint64_t)hash;
- (unint64_t)newsletterSubscriptionStatus;
- (unint64_t)viewingLocation;
@end

@implementation SXLayoutOptions

- (SXLayoutOptions)initWithColumnLayout:(id)a3 viewportSize:(CGSize)a4 traitCollection:(id)a5 contentSizeCategory:(id)a6 bundleSubscriptionStatus:(int64_t)a7 channelSubscriptionStatus:(int64_t)a8 testing:(BOOL)a9 viewingLocation:(unint64_t)a10 contentScaleFactor:(double)a11 newsletterSubscriptionStatus:(unint64_t)a12 offerUpsellScenario:(int64_t)a13 subscriptionActivationEligibility:(int64_t)a14 smartInvertColorsEnabled:(BOOL)a15 conditionKeys:(id)a16
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v26 = a3;
  id v27 = a5;
  id v32 = a6;
  id v31 = a16;
  v33.receiver = self;
  v33.super_class = (Class)SXLayoutOptions;
  v28 = [(SXLayoutOptions *)&v33 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_columnLayout, a3);
    v29->_viewportSize.CGFloat width = width;
    v29->_viewportSize.CGFloat height = height;
    objc_storeStrong((id *)&v29->_traitCollection, a5);
    objc_storeStrong((id *)&v29->_contentSizeCategory, a6);
    v29->_bundleSubscriptionStatus = a7;
    v29->_channelSubscriptionStatus = a8;
    v29->_testing = a9;
    v29->_viewingLocation = a10;
    v29->_contentScaleFactor = a11;
    v29->_newsletterSubscriptionStatus = a12;
    v29->_offerUpsellScenario = a13;
    v29->_subscriptionActivationEligibility = a14;
    v29->_smartInvertColorsEnabled = a15;
    objc_storeStrong((id *)&v29->_conditionKeys, a16);
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  return [(SXLayoutOptions *)self diffWithLayoutOptions:a3] == 0;
}

- (unint64_t)diffWithLayoutOptions:(id)a3
{
  v4 = (SXLayoutOptions *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      unint64_t v17 = 0;
    }
    else
    {
      if ([(SXColumnLayout *)self->_columnLayout isEqual:v4->_columnLayout]) {
        uint64_t v5 = 65534;
      }
      else {
        uint64_t v5 = 0xFFFFLL;
      }
      UIUserInterfaceSizeClass v6 = [(UITraitCollection *)self->_traitCollection horizontalSizeClass];
      if (v6 == [(UITraitCollection *)v4->_traitCollection horizontalSizeClass]) {
        uint64_t v5 = (unsigned __int16)v5 & 0xFDFF;
      }
      UIUserInterfaceSizeClass v7 = [(UITraitCollection *)self->_traitCollection verticalSizeClass];
      if (v7 == [(UITraitCollection *)v4->_traitCollection verticalSizeClass]) {
        uint64_t v5 = (unsigned __int16)v5 & 0xFBFF;
      }
      UIUserInterfaceStyle v8 = [(UITraitCollection *)self->_traitCollection userInterfaceStyle];
      uint64_t v9 = [(UITraitCollection *)v4->_traitCollection userInterfaceStyle];
      uint64_t v10 = (unsigned __int16)v5 & 0xFEFF;
      if (v8 != v9) {
        uint64_t v10 = v5;
      }
      double width = self->_viewportSize.width;
      if (self->_viewportSize.height == v4->_viewportSize.height && width == v4->_viewportSize.width) {
        unint64_t v13 = (unsigned __int16)v10 & 0xFFFD;
      }
      else {
        unint64_t v13 = v10;
      }
      int v14 = -[NSString isEqual:](self->_contentSizeCategory, "isEqual:", v4->_contentSizeCategory, width);
      unint64_t v15 = (unsigned __int16)v13 & 0xFFFB;
      if (!v14) {
        unint64_t v15 = v13;
      }
      if (self->_bundleSubscriptionStatus == v4->_bundleSubscriptionStatus) {
        unint64_t v15 = (unsigned __int16)v15 & 0xFFF7;
      }
      if (self->_channelSubscriptionStatus == v4->_channelSubscriptionStatus) {
        v15 &= ~0x10uLL;
      }
      if (self->_viewingLocation == v4->_viewingLocation) {
        v15 &= ~0x20uLL;
      }
      if (self->_testing == v4->_testing) {
        v15 &= ~0x40uLL;
      }
      double v16 = self->_contentScaleFactor - v4->_contentScaleFactor;
      if (v16 < 0.0) {
        double v16 = -v16;
      }
      if (v16 < 2.22044605e-16) {
        v15 &= ~0x80uLL;
      }
      if (self->_newsletterSubscriptionStatus == v4->_newsletterSubscriptionStatus) {
        v15 &= ~0x800uLL;
      }
      if (self->_offerUpsellScenario == v4->_offerUpsellScenario) {
        v15 &= ~0x1000uLL;
      }
      if (self->_subscriptionActivationEligibility == v4->_subscriptionActivationEligibility) {
        v15 &= ~0x2000uLL;
      }
      if (self->_smartInvertColorsEnabled == v4->_smartInvertColorsEnabled) {
        unint64_t v17 = v15 & 0xFFFFFFFFFFFFBFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      conditionKeys = self->_conditionKeys;
      if (conditionKeys == v4->_conditionKeys || -[NSSet isEqual:](conditionKeys, "isEqual:")) {
        v17 &= ~0x8000uLL;
      }
    }
  }
  else
  {
    unint64_t v17 = 0xFFFFLL;
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SXColumnLayout *)self->_columnLayout hash] ^ (unint64_t)self->_viewportSize.width;
  unint64_t height = (unint64_t)self->_viewportSize.height;
  uint64_t v5 = v3 ^ height ^ [(UITraitCollection *)self->_traitCollection hash];
  return v5 ^ [(NSString *)self->_contentSizeCategory hash] ^ self->_testing ^ self->_viewingLocation ^ (unint64_t)self->_contentScaleFactor;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"<%@: %p; options: \n", objc_opt_class(), self];
  [(SXLayoutOptions *)self viewportSize];
  v4 = NSStringFromCGSize(v26);
  [v3 appendFormat:@"  viewportSize: %@; \n", v4];

  uint64_t v5 = [(SXLayoutOptions *)self contentSizeCategory];
  [v3 appendFormat:@"  contentSizeCategory: %@; \n", v5];

  unint64_t v6 = [(SXLayoutOptions *)self bundleSubscriptionStatus];
  if (v6 <= 2) {
    [v3 appendFormat:off_264652888[v6]];
  }
  unint64_t v7 = [(SXLayoutOptions *)self channelSubscriptionStatus];
  if (v7 <= 2) {
    [v3 appendFormat:off_2646528A0[v7]];
  }
  unint64_t v8 = [(SXLayoutOptions *)self offerUpsellScenario];
  if (v8 <= 9 && ((0x3FDu >> v8) & 1) != 0) {
    [v3 appendFormat:off_2646528B8[v8]];
  }
  uint64_t v9 = [(SXLayoutOptions *)self columnLayout];
  uint64_t v10 = [v9 numberOfColumns];
  v11 = [(SXLayoutOptions *)self columnLayout];
  [v11 constrainedViewportSize];
  v12 = NSStringFromCGSize(v27);
  objc_msgSend(v3, "appendFormat:", @"  columnLayout: (numberOfColumns: %d, constrainedViewportSize: %@); \n",
    v10,
    v12);

  unint64_t v13 = [(SXLayoutOptions *)self traitCollection];
  int v14 = [v13 description];
  [v3 appendFormat:@"  traitCollection: %@; \n", v14];

  if ([(SXLayoutOptions *)self testing]) {
    unint64_t v15 = @"YES";
  }
  else {
    unint64_t v15 = @"NO";
  }
  [v3 appendFormat:@"  testing: %@; \n", v15];
  unint64_t v16 = [(SXLayoutOptions *)self viewingLocation];
  if (v16 <= 3) {
    [v3 appendFormat:off_264652908[v16]];
  }
  [(SXLayoutOptions *)self contentScaleFactor];
  objc_msgSend(v3, "appendFormat:", @"  contentScaleFactor: %f; \n", v17);
  unint64_t v18 = [(SXLayoutOptions *)self newsletterSubscriptionStatus];
  if (v18 - 1 > 4) {
    v19 = @"unspecified";
  }
  else {
    v19 = off_264652928[v18 - 1];
  }
  [v3 appendFormat:@"  newsletter status: %@; \n", v19];
  int64_t v20 = [(SXLayoutOptions *)self subscriptionActivationEligibility];
  if ((unint64_t)(v20 - 1) > 3) {
    v21 = @"unknown";
  }
  else {
    v21 = off_264652950[v20 - 1];
  }
  [v3 appendFormat:@"  subscriptionActivationEligibility: %@; \n", v21];
  v22 = [(SXLayoutOptions *)self conditionKeys];
  [v3 appendFormat:@"  conditionKeys: %@; \n", v22];

  if ([(SXLayoutOptions *)self smartInvertColorsEnabled]) {
    v23 = @"YES";
  }
  else {
    v23 = @"NO";
  }
  [v3 appendFormat:@"  _smartInvertColorsEnabled: %@; \n", v23];
  [v3 appendFormat:@">"];
  return v3;
}

- (SXColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int64_t)bundleSubscriptionStatus
{
  return self->_bundleSubscriptionStatus;
}

- (int64_t)channelSubscriptionStatus
{
  return self->_channelSubscriptionStatus;
}

- (int64_t)offerUpsellScenario
{
  return self->_offerUpsellScenario;
}

- (int64_t)subscriptionActivationEligibility
{
  return self->_subscriptionActivationEligibility;
}

- (BOOL)testing
{
  return self->_testing;
}

- (unint64_t)viewingLocation
{
  return self->_viewingLocation;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (unint64_t)newsletterSubscriptionStatus
{
  return self->_newsletterSubscriptionStatus;
}

- (BOOL)smartInvertColorsEnabled
{
  return self->_smartInvertColorsEnabled;
}

- (NSSet)conditionKeys
{
  return self->_conditionKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionKeys, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
}

@end