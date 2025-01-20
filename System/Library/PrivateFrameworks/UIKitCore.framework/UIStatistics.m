@interface UIStatistics
@end

@implementation UIStatistics

void __109___UIStatistics_UICommonStatisticsGathering___sharedStatisticWithDomain_statisticsClass_identifierReporting___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)qword_1EB264D30;
  qword_1EB264D30 = v0;
}

uint64_t __72___UIStatistics_UICommonStatisticsGathering__previewInteractionTapCount__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.tap.count" identifierReporting:2];
  v1 = (void *)qword_1EB264CB8;
  qword_1EB264CB8 = (uint64_t)v0;

  v2 = (void *)qword_1EB264CB8;
  return [v2 setSampleRate:0.0];
}

void __73___UIStatistics_UICommonStatisticsGathering__previewInteractionPeekCount__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.peek.count" identifierReporting:2];
  v1 = (void *)qword_1EB264C88;
  qword_1EB264C88 = (uint64_t)v0;

  v2 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.peek.count.all" identifierReporting:1];
  [(id)qword_1EB264C88 _addChildStatistic:v2];
}

void __76___UIStatistics_UICommonStatisticsGathering__previewInteractionPeekDuration__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.peekAndPop.peek.duration" identifierReporting:2];
  v1 = (void *)qword_1EB264C98;
  qword_1EB264C98 = (uint64_t)v0;

  v2 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.peekAndPop.peek.duration.all" identifierReporting:1];
  [(id)qword_1EB264C98 _addChildStatistic:v2];
}

void __72___UIStatistics_UICommonStatisticsGathering__previewInteractionPopCount__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.pop.count" identifierReporting:2];
  v1 = (void *)qword_1EB264CA8;
  qword_1EB264CA8 = (uint64_t)v0;

  v2 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.pop.count.all" identifierReporting:1];
  [(id)qword_1EB264CA8 _addChildStatistic:v2];
}

void __86___UIStatistics_UICommonStatisticsGathering__previewInteractionAlertPresentationCount__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.alert.count" identifierReporting:2];
  v1 = (void *)qword_1EB264CC8;
  qword_1EB264CC8 = (uint64_t)v0;

  v2 = [[_UIStatisticsScalar alloc] initWithDomain:@"UIKit.peekAndPop.alert.count.all" identifierReporting:1];
  [(id)qword_1EB264CC8 _addChildStatistic:v2];
}

void __73___UIStatistics_UICommonStatisticsGathering__previewInteractionPeekForce__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.peekAndPop.peek.force" identifierReporting:0];
  v1 = (void *)qword_1EB264CD8;
  qword_1EB264CD8 = (uint64_t)v0;

  v2 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.peekAndPop.peek.force.all" identifierReporting:1];
  [(id)qword_1EB264CD8 _addChildStatistic:v2];
}

void __72___UIStatistics_UICommonStatisticsGathering__previewInteractionPopForce__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.peekAndPop.pop.force" identifierReporting:0];
  v1 = (void *)qword_1EB264CE8;
  qword_1EB264CE8 = (uint64_t)v0;

  v2 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.peekAndPop.pop.force.all" identifierReporting:1];
  [(id)qword_1EB264CE8 _addChildStatistic:v2];
}

void __54___UIStatistics_UICommonStatisticsGathering__maxForce__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.forceTouch.maxForce" identifierReporting:0];
  v1 = (void *)qword_1EB264CF8;
  qword_1EB264CF8 = (uint64_t)v0;

  v2 = [[_UIStatisticsDistribution alloc] initWithDomain:@"UIKit.forceTouch.maxForce.all" identifierReporting:1];
  [(id)qword_1EB264CF8 _addChildStatistic:v2];
  [(id)qword_1EB264CF8 setSampleRate:0.01];
  [(id)qword_1EB264CF8 randomizeSampleValue];
}

void __64___UIStatistics_UICommonStatisticsGathering__scrubberUsageCount__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsScalar alloc] initWithDomain:@"mediacontroller.UIMovieScrubber.ScrubberInteraction.count" identifierReporting:0];
  v1 = (void *)qword_1EB264D08;
  qword_1EB264D08 = (uint64_t)v0;
}

void __63___UIStatistics_UICommonStatisticsGathering__scrubberUsageTime__block_invoke()
{
  uint64_t v0 = [[_UIStatisticsDistribution alloc] initWithDomain:@"mediacontroller.UIMovieScrubber.ScrubberInteraction.duration" identifierReporting:0];
  v1 = (void *)qword_1EB264D18;
  qword_1EB264D18 = (uint64_t)v0;
}

@end