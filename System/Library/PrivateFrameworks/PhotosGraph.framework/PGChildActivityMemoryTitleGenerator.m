@interface PGChildActivityMemoryTitleGenerator
- (BOOL)_shouldIncludeChildNameForActivityLabels:(id)a3;
- (PGChildActivityMemoryTitleGenerator)initWithMomentNodes:(id)a3 activityLabels:(id)a4 childName:(id)a5 titleGenerationContext:(id)a6 loggingConnection:(id)a7;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
@end

@implementation PGChildActivityMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_childName, 0);
  objc_storeStrong((id *)&self->_activityLabels, 0);
}

- (BOOL)_shouldIncludeChildNameForActivityLabels:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithObjects:", @"PersonActionJumpingOrLeaping", @"PersonActionRunningOrJogging", 0);
  char v6 = [v5 intersectsSet:v4];

  return v6 ^ 1;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *))a3;
  if ([(NSSet *)self->_activityLabels containsObject:@"PersonActionPlayingOnASwing"]
    && [(NSSet *)self->_activityLabels containsObject:@"PersonActionPlayingOnASlide"])
  {
    v5 = @"PGChildActivityMemoryTitlePersonActionSwingsAndSlide";
    goto LABEL_7;
  }
  if ([(NSSet *)self->_activityLabels containsObject:@"PersonActionHugging"]
    || [(NSSet *)self->_activityLabels containsObject:@"PersonActionKissing"])
  {
    v5 = @"PGChildActivityMemoryTitlePersonActionSweetMoments";
    goto LABEL_7;
  }
  if ([(NSSet *)self->_activityLabels count] == 1)
  {
    v18 = NSString;
    v19 = [(NSSet *)self->_activityLabels anyObject];
    v5 = [v18 stringWithFormat:@"PGChildActivityMemoryTitle%@", v19];

    if (v5)
    {
LABEL_7:
      BOOL v6 = [(PGChildActivityMemoryTitleGenerator *)self _shouldIncludeChildNameForActivityLabels:self->_activityLabels];
      if ([(NSString *)self->_childName length]) {
        BOOL v7 = !v6;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7)
      {
        v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v11 = [v9 localizedStringForKey:v5 value:v5 table:@"Localizable"];
      }
      else
      {
        uint64_t v8 = [(__CFString *)v5 stringByAppendingString:@" %@"];

        v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v10 = [v9 localizedStringForKey:v8 value:v8 table:@"Localizable"];
        v11 = PFStringWithValidatedFormat();

        v5 = (__CFString *)v8;
      }

      v12 = +[PGTitle titleWithString:v11 category:1];
      v13 = objc_alloc_init(PGTimeTitleOptions);
      v14 = [(PGTitleGenerator *)self momentNodes];
      [(PGTimeTitleOptions *)v13 setMomentNodes:v14];

      [(PGTimeTitleOptions *)v13 setAllowedFormats:20];
      v15 = [(PGTitleGenerator *)self featuredYearNodes];
      [(PGTimeTitleOptions *)v13 setFeaturedYearNodes:v15];

      v16 = +[PGTimeTitleUtility timeTitleWithOptions:v13];
      v17 = +[PGTitle titleWithString:v16 category:5];
      v4[2](v4, v12, v17);

      goto LABEL_14;
    }
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
  {
    activityLabels = self->_activityLabels;
    v22 = loggingConnection;
    v23 = [(NSSet *)activityLabels allObjects];
    *(_DWORD *)buf = 138412290;
    v25 = v23;
    _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "[PGChildActivityMemoryTitleGenerator] Invalid Combination:%@", buf, 0xCu);
  }
  v4[2](v4, 0, 0);
LABEL_14:
}

- (PGChildActivityMemoryTitleGenerator)initWithMomentNodes:(id)a3 activityLabels:(id)a4 childName:(id)a5 titleGenerationContext:(id)a6 loggingConnection:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PGChildActivityMemoryTitleGenerator;
  v16 = [(PGTitleGenerator *)&v19 initWithMomentNodes:a3 type:0 titleGenerationContext:a6];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_activityLabels, a4);
    objc_storeStrong((id *)&v17->_childName, a5);
    objc_storeStrong((id *)&v17->_loggingConnection, a7);
  }

  return v17;
}

@end