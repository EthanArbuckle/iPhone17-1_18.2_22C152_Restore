@interface _UIStatistics
+ (id)_sharedStatisticWithDomain:(id)a3 statisticsClass:(Class)a4 identifierReporting:(int64_t)a5;
+ (id)alertButtonTapCount;
+ (id)controlInteractionDurationDistributionWithCategory:(id)a3 suffix:(id)a4;
+ (id)controlTapCountWithCategory:(id)a3 suffix:(id)a4;
+ (id)controlValueChangeEmittedCountWithCategory:(id)a3 suffix:(id)a4;
+ (id)coverSheetButtonFirstActivationDurationWithCategory:(id)a3;
+ (id)coverSheetButtonInteractionCountWithActivation:(BOOL)a3 category:(id)a4;
+ (id)coverSheetButtonInteractionDurationWithCategory:(id)a3;
+ (id)coverSheetButtonMaximumForceWithActivation:(BOOL)a3 category:(id)a4;
+ (id)feedbackEngineActivationCountWithSuffix:(id)a3;
+ (id)feedbackEngineActivationDurationWithSuffix:(id)a3;
+ (id)feedbackEngineOutOfChannelsCountWithSuffix:(id)a3;
+ (id)feedbackEnginePrewarmCountWithSuffix:(id)a3;
+ (id)feedbackEnginePrewarmDurationWithSuffix:(id)a3;
+ (id)feedbackGeneratorActivationCountWithSuffix:(id)a3;
+ (id)feedbackGeneratorActivationDurationWithSuffix:(id)a3;
+ (id)feedbackGeneratorActivationTimeOutCountWithSuffix:(id)a3;
+ (id)feedbackGeneratorPlayCountWithSuffix:(id)a3;
+ (id)feedbackGeneratorPreparationCountWithSuffix:(id)a3;
+ (id)maxForce;
+ (id)pinchGestureCount;
+ (id)previewInteractionAlertPresentationCount;
+ (id)previewInteractionPeekCount;
+ (id)previewInteractionPeekDuration;
+ (id)previewInteractionPeekForce;
+ (id)previewInteractionPopCount;
+ (id)previewInteractionPopForce;
+ (id)previewInteractionTapCount;
+ (id)recentsInputViewItemSelectedCount;
+ (id)recentsInputViewNewEntryCount;
+ (id)recentsInputViewNumberOfItems;
+ (id)recentsInputViewPresentationCount;
+ (id)scrollBounceCount;
+ (id)scrubberUsageCount;
+ (id)scrubberUsageTime;
+ (id)zoomGestureCount;
+ (unint64_t)currentTime;
- (BOOL)_shouldSample;
- (_UIStatistics)init;
- (_UIStatistics)initWithDomain:(id)a3;
- (_UIStatistics)initWithDomain:(id)a3 identifierReporting:(int64_t)a4;
- (double)sampleRate;
- (id)_key;
- (id)description;
- (void)_addChildStatistic:(id)a3;
- (void)_incrementValueBy:(int64_t)a3;
- (void)_recordDistributionTime:(unint64_t)a3;
- (void)_recordDistributionValue:(double)a3;
- (void)_removeChildStatistic:(id)a3;
- (void)_resetDistribution;
- (void)_resetDistributionToValue:(double)a3;
- (void)_resetValue;
- (void)_setValue:(int64_t)a3;
- (void)randomizeSampleValue;
- (void)setSampleRate:(double)a3;
@end

@implementation _UIStatistics

+ (id)maxForce
{
  if (qword_1EB264D00 != -1) {
    dispatch_once(&qword_1EB264D00, &__block_literal_global_163_0);
  }
  v2 = (void *)qword_1EB264CF8;
  return v2;
}

- (void)_recordDistributionValue:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatistics *)self _shouldSample])
  {
    v5 = +[_UIStatisticsIntegrator sharedInstance];
    [v5 recordDistributionValue:self->_key forKey:a3];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = self->_children;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_recordDistributionValue:", a3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_incrementValueBy:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatistics *)self _shouldSample])
  {
    v5 = +[_UIStatisticsIntegrator sharedInstance];
    [v5 incrementValueBy:a3 forKey:self->_key];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = self->_children;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_incrementValueBy:", a3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)_shouldSample
{
  double v2 = self->_sampleRate + self->_sampleValue;
  double v3 = trunc(v2);
  if (v2 < 1.0) {
    double v3 = 0.0;
  }
  self->_sampleValue = v2 - v3;
  return v2 >= 1.0;
}

+ (unint64_t)currentTime
{
  return 0;
}

+ (id)feedbackGeneratorActivationCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"behaviorActivationCount", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackGeneratorActivationDurationWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"behaviorActivationDuration", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)_sharedStatisticWithDomain:(id)a3 statisticsClass:(Class)a4 identifierReporting:(int64_t)a5
{
  id v7 = a3;
  if (qword_1EB264D28 != -1) {
    dispatch_once(&qword_1EB264D28, &__block_literal_global_274_2);
  }
  uint64_t v8 = [(id)qword_1EB264D30 valueForKey:v7];
  if (!v8)
  {
    uint64_t v8 = (void *)[[a4 alloc] initWithDomain:v7 identifierReporting:a5];
    [(id)qword_1EB264D30 setObject:v8 forKey:v7];
  }

  return v8;
}

- (_UIStatistics)initWithDomain:(id)a3 identifierReporting:(int64_t)a4
{
  id v7 = a3;
  if (![v7 length])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"_UIStatistics.m" lineNumber:93 description:@"You cannot construct a _UIStatistic instance with an empty or nil string"];
  }
  v17.receiver = self;
  v17.super_class = (Class)_UIStatistics;
  uint64_t v8 = [(_UIStatistics *)&v17 init];
  if (v8)
  {
    uint64_t v9 = _UIStatisticsBundleIdentifier(a4);
    uint64_t v10 = [v9 length];
    id v11 = [NSString alloc];
    if (v10) {
      uint64_t v12 = [v11 initWithFormat:@"com.apple.%@.%@", v7, v9];
    }
    else {
      uint64_t v12 = [v11 initWithFormat:@"com.apple.%@", v7, v16];
    }
    key = v8->_key;
    v8->_key = (NSString *)v12;

    v8->_sampleRate = 1.0;
    v8->_sampleValue = 0.0;
  }
  return v8;
}

- (void)_recordDistributionTime:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatistics *)self _shouldSample])
  {
    v5 = +[_UIStatisticsIntegrator sharedInstance];
    [v5 recordDistributionTime:a3 forKey:self->_key];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = self->_children;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_recordDistributionTime:", a3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

+ (id)feedbackGeneratorPlayCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"behaviorPlayCount", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackGeneratorPreparationCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"behaviorPreparationCount", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackEngineActivationDurationWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"engineActivationDuration", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackEnginePrewarmDurationWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"enginePrewarmDuration", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackEnginePrewarmCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"enginePrewarmCount", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackEngineActivationCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"engineActivationCount", a3);
  v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)previewInteractionTapCount
{
  if (qword_1EB264CC0 != -1) {
    dispatch_once(&qword_1EB264CC0, &__block_literal_global_134_2);
  }
  double v2 = (void *)qword_1EB264CB8;
  return v2;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = fmax(fmin(a3, 1.0), 0.0);
}

- (_UIStatistics)init
{
  double v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s should not be called", "-[_UIStatistics init]");
  v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];
  [v6 raise];

  return 0;
}

- (id)_key
{
  return self->_key;
}

- (_UIStatistics)initWithDomain:(id)a3
{
  return [(_UIStatistics *)self initWithDomain:a3 identifierReporting:0];
}

- (void)_addChildStatistic:(id)a3
{
  children = self->_children;
  if (children)
  {
    [(NSMutableSet *)children addObject:a3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA80] setWithObject:a3];
    v6 = self->_children;
    self->_children = v5;
  }
}

- (void)_removeChildStatistic:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(NSMutableSet *)self->_children count];
  children = self->_children;
  if (v4 > 1)
  {
    [(NSMutableSet *)children removeObject:v6];
  }
  else
  {
    self->_children = 0;
  }
}

- (void)randomizeSampleValue
{
  self->_sampleValue = (double)arc4random_uniform(0x2710u) / 10000.0;
}

- (void)_resetDistribution
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = +[_UIStatisticsIntegrator sharedInstance];
  [v3 resetDistributionForKey:self->_key];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v4 = self->_children;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_resetDistribution", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_resetDistributionToValue:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatistics *)self _shouldSample])
  {
    uint64_t v5 = +[_UIStatisticsIntegrator sharedInstance];
    [v5 resetDistributionToValue:self->_key forKey:a3];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_children;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "_resetDistributionToValue:", a3, (void)v11);
        }
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(_UIStatistics *)self _resetValue];
  }
}

- (void)_resetValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = +[_UIStatisticsIntegrator sharedInstance];
  [v3 resetValueForKey:self->_key];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v4 = self->_children;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_resetValue", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_setValue:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(_UIStatistics *)self _shouldSample])
  {
    uint64_t v5 = +[_UIStatisticsIntegrator sharedInstance];
    [v5 setValue:a3 forKey:self->_key];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_children;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "_setValue:", a3, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatistics;
  double v3 = [(_UIStatistics *)&v7 description];
  unint64_t v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@" key=%@", self->_key];
  double sampleRate = self->_sampleRate;
  if (sampleRate < 1.0) {
    [v4 appendFormat:@" sampled (progress=%f, rate=%f)", *(void *)&self->_sampleValue, *(void *)&sampleRate];
  }
  return v4;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)previewInteractionPeekCount
{
  if (qword_1EB264C90 != -1) {
    dispatch_once(&qword_1EB264C90, &__block_literal_global_108_0);
  }
  double v2 = (void *)qword_1EB264C88;
  return v2;
}

+ (id)previewInteractionPeekDuration
{
  if (qword_1EB264CA0 != -1) {
    dispatch_once(&qword_1EB264CA0, &__block_literal_global_117_5);
  }
  double v2 = (void *)qword_1EB264C98;
  return v2;
}

+ (id)previewInteractionPopCount
{
  if (qword_1EB264CB0 != -1) {
    dispatch_once(&qword_1EB264CB0, &__block_literal_global_126_0);
  }
  double v2 = (void *)qword_1EB264CA8;
  return v2;
}

+ (id)previewInteractionAlertPresentationCount
{
  if (qword_1EB264CD0 != -1) {
    dispatch_once(&qword_1EB264CD0, &__block_literal_global_139_4);
  }
  double v2 = (void *)qword_1EB264CC8;
  return v2;
}

+ (id)previewInteractionPeekForce
{
  if (qword_1EB264CE0 != -1) {
    dispatch_once(&qword_1EB264CE0, &__block_literal_global_147_1);
  }
  double v2 = (void *)qword_1EB264CD8;
  return v2;
}

+ (id)previewInteractionPopForce
{
  if (qword_1EB264CF0 != -1) {
    dispatch_once(&qword_1EB264CF0, &__block_literal_global_155_1);
  }
  double v2 = (void *)qword_1EB264CE8;
  return v2;
}

+ (id)scrubberUsageCount
{
  if (qword_1EB264D10 != -1) {
    dispatch_once(&qword_1EB264D10, &__block_literal_global_171_1);
  }
  double v2 = (void *)qword_1EB264D08;
  return v2;
}

+ (id)scrubberUsageTime
{
  if (qword_1EB264D20 != -1) {
    dispatch_once(&qword_1EB264D20, &__block_literal_global_176);
  }
  double v2 = (void *)qword_1EB264D18;
  return v2;
}

+ (id)controlTapCountWithCategory:(id)a3 suffix:(id)a4
{
  unint64_t v4 = _domainWithCategoryAndSuffix(@"UIKit.eventCount.tap", a3, a4);
  uint64_t v5 = +[_UIStatistics _sharedStatisticWithDomain:v4 statisticsClass:objc_opt_class() identifierReporting:1];

  return v5;
}

+ (id)controlValueChangeEmittedCountWithCategory:(id)a3 suffix:(id)a4
{
  unint64_t v4 = _domainWithCategoryAndSuffix(@"UIKit.eventCount.valueChange", a3, a4);
  uint64_t v5 = +[_UIStatistics _sharedStatisticWithDomain:v4 statisticsClass:objc_opt_class() identifierReporting:1];

  return v5;
}

+ (id)controlInteractionDurationDistributionWithCategory:(id)a3 suffix:(id)a4
{
  unint64_t v4 = _domainWithCategoryAndSuffix(@"UIKit.interactionDistribution", a3, a4);
  uint64_t v5 = +[_UIStatistics _sharedStatisticWithDomain:v4 statisticsClass:objc_opt_class() identifierReporting:1];

  return v5;
}

+ (id)alertButtonTapCount
{
  return (id)[a1 controlTapCountWithCategory:@"button.alert" suffix:0];
}

+ (id)pinchGestureCount
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.eventCount", @"pinch", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:1];

  return v3;
}

+ (id)zoomGestureCount
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.eventCount", @"zoom", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:1];

  return v3;
}

+ (id)scrollBounceCount
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.eventCount", @"scrollBounce", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:1];

  return v3;
}

+ (id)feedbackEngineOutOfChannelsCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"engineOutOfChannelsCount", a3);
  unint64_t v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)feedbackGeneratorActivationTimeOutCountWithSuffix:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.feedback", @"behaviorActivationTimeOutCount", a3);
  unint64_t v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:0];

  return v4;
}

+ (id)recentsInputViewPresentationCount
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.recentsInputView", @"presentationCount", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:0];

  return v3;
}

+ (id)recentsInputViewNumberOfItems
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.recentsInputView", @"numberOfItems", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:0];

  return v3;
}

+ (id)recentsInputViewItemSelectedCount
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.recentsInputView", @"itemSelectedCount", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:0];

  return v3;
}

+ (id)recentsInputViewNewEntryCount
{
  double v2 = _domainWithCategoryAndSuffix(@"UIKit.recentsInputView", @"newEntryCount", 0);
  double v3 = +[_UIStatistics _sharedStatisticWithDomain:v2 statisticsClass:objc_opt_class() identifierReporting:0];

  return v3;
}

+ (id)coverSheetButtonInteractionCountWithActivation:(BOOL)a3 category:(id)a4
{
  if (a3) {
    unint64_t v4 = @"didActivate.count";
  }
  else {
    unint64_t v4 = @"didNotActivate.count";
  }
  uint64_t v5 = _domainWithCategoryAndSuffix(@"UIKit.coverSheetButton", a4, v4);
  uint64_t v6 = +[_UIStatistics _sharedStatisticWithDomain:v5 statisticsClass:objc_opt_class() identifierReporting:1];

  return v6;
}

+ (id)coverSheetButtonInteractionDurationWithCategory:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.coverSheetButton", a3, @"interactionDuration");
  unint64_t v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:1];

  return v4;
}

+ (id)coverSheetButtonFirstActivationDurationWithCategory:(id)a3
{
  double v3 = _domainWithCategoryAndSuffix(@"UIKit.coverSheetButton", a3, @"firstActivationDuration");
  unint64_t v4 = +[_UIStatistics _sharedStatisticWithDomain:v3 statisticsClass:objc_opt_class() identifierReporting:1];

  return v4;
}

+ (id)coverSheetButtonMaximumForceWithActivation:(BOOL)a3 category:(id)a4
{
  if (a3) {
    unint64_t v4 = @"didActivate.maxForce";
  }
  else {
    unint64_t v4 = @"didNotActivate.maxForce";
  }
  uint64_t v5 = _domainWithCategoryAndSuffix(@"UIKit.coverSheetButton", a4, v4);
  uint64_t v6 = +[_UIStatistics _sharedStatisticWithDomain:v5 statisticsClass:objc_opt_class() identifierReporting:1];

  return v6;
}

@end