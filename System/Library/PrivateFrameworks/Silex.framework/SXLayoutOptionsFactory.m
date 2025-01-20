@interface SXLayoutOptionsFactory
- (SXColumnCalculator)columnCalculator;
- (SXDocumentProvider)documentProvider;
- (SXLayoutOptionsFactory)initWithColumnCalculator:(id)a3 documentProvider:(id)a4;
- (id)createLayoutOptionsWithViewportSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5 bundleSubscriptionStatus:(int64_t)a6 channelSubscriptionStatus:(int64_t)a7 contentSizeCategory:(id)a8 testing:(BOOL)a9 viewingLocation:(unint64_t)a10 contentScaleFactor:(double)a11 newsletterSubscriptionStatus:(unint64_t)a12 offerUpsellScenario:(int64_t)a13 subscriptionActivationEligibility:(int64_t)a14 smartInvertColorsEnabled:(BOOL)a15 conditionKeys:(id)a16;
@end

@implementation SXLayoutOptionsFactory

- (SXLayoutOptionsFactory)initWithColumnCalculator:(id)a3 documentProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLayoutOptionsFactory;
  v9 = [(SXLayoutOptionsFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_columnCalculator, a3);
    objc_storeStrong((id *)&v10->_documentProvider, a4);
  }

  return v10;
}

- (id)createLayoutOptionsWithViewportSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5 bundleSubscriptionStatus:(int64_t)a6 channelSubscriptionStatus:(int64_t)a7 contentSizeCategory:(id)a8 testing:(BOOL)a9 viewingLocation:(unint64_t)a10 contentScaleFactor:(double)a11 newsletterSubscriptionStatus:(unint64_t)a12 offerUpsellScenario:(int64_t)a13 subscriptionActivationEligibility:(int64_t)a14 smartInvertColorsEnabled:(BOOL)a15 conditionKeys:(id)a16
{
  BOOL v47 = a9;
  double right = a4.right;
  double left = a4.left;
  double height = a3.height;
  double width = a3.width;
  uint64_t v50 = *MEMORY[0x263EF8340];
  v23 = (NSString *)a5;
  v24 = (NSString *)a8;
  id v25 = a16;
  v26 = [(SXLayoutOptionsFactory *)self documentProvider];
  v27 = [v26 document];
  v28 = [v27 layout];

  if (!v28)
  {
    v35 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = [(SXLayoutOptionsFactory *)self documentProvider];
      v38 = [v37 document];
      *(_DWORD *)buf = 138412290;
      v49 = v38;
      _os_log_impl(&dword_222AC5000, v36, OS_LOG_TYPE_DEFAULT, "Unable to create LayoutOptions, missing document layout for document: %@", buf, 0xCu);
    }
    goto LABEL_19;
  }
  if (!v23
    || ![(NSString *)v23 horizontalSizeClass]
    || ![(NSString *)v23 verticalSizeClass]
    || ![(NSString *)v23 userInterfaceStyle])
  {
    v33 = SXLayoutLog;
    if (!os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    v49 = v23;
    v34 = "Unable to create LayoutOptions, invalid trait collection %@";
LABEL_16:
    _os_log_impl(&dword_222AC5000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
    goto LABEL_19;
  }
  if (!v24 || UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F1D1A0], v24) == NSOrderedSame)
  {
    v33 = SXLayoutLog;
    if (!os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    v49 = v24;
    v34 = "Unable to create LayoutOptions, unspecified content size category %@";
    goto LABEL_16;
  }
  BOOL v29 = *MEMORY[0x263F001B0] == width;
  if (*(double *)(MEMORY[0x263F001B0] + 8) != height) {
    BOOL v29 = 0;
  }
  if (width >= 2.22044605e-16 && !v29 && height >= 2.22044605e-16)
  {
    v30 = [(SXLayoutOptionsFactory *)self columnCalculator];
    v31 = objc_msgSend(v30, "columnLayoutWithViewportSize:constrainedToWidth:documentLayout:contentScaleFactor:", v28, width, height, width - (left + right), a11);

    LOBYTE(v43) = a15;
    v32 = -[SXLayoutOptions initWithColumnLayout:viewportSize:traitCollection:contentSizeCategory:bundleSubscriptionStatus:channelSubscriptionStatus:testing:viewingLocation:contentScaleFactor:newsletterSubscriptionStatus:offerUpsellScenario:subscriptionActivationEligibility:smartInvertColorsEnabled:conditionKeys:]([SXLayoutOptions alloc], "initWithColumnLayout:viewportSize:traitCollection:contentSizeCategory:bundleSubscriptionStatus:channelSubscriptionStatus:testing:viewingLocation:contentScaleFactor:newsletterSubscriptionStatus:offerUpsellScenario:subscriptionActivationEligibility:smartInvertColorsEnabled:conditionKeys:", v31, v23, v24, a6, a7, v47, width, height, a11, a10, a12, a13, a14, v43, v25);

    goto LABEL_20;
  }
  v40 = (void *)SXLayoutLog;
  if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    v52.double width = width;
    v52.double height = height;
    NSStringFromCGSize(v52);
    v42 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v42;
    _os_log_impl(&dword_222AC5000, v41, OS_LOG_TYPE_DEFAULT, "Unable to create LayoutOptions, invalid viewport size: %{public}@", buf, 0xCu);
  }
LABEL_19:
  v32 = 0;
LABEL_20:

  return v32;
}

- (SXColumnCalculator)columnCalculator
{
  return self->_columnCalculator;
}

- (SXDocumentProvider)documentProvider
{
  return self->_documentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
}

@end