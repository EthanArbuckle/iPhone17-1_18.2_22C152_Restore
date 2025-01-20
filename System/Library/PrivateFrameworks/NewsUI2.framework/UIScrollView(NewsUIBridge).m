@interface UIScrollView(NewsUIBridge)
- (uint64_t)ts_performScrollTest:()NewsUIBridge iterations:delta:extraResultsBlock:;
- (void)ts_performScrollTest:()NewsUIBridge iterations:length:completion:;
@end

@implementation UIScrollView(NewsUIBridge)

- (uint64_t)ts_performScrollTest:()NewsUIBridge iterations:delta:extraResultsBlock:
{
  return [a1 _performScrollTest:a3 iterations:a4 delta:a5 length:0 scrollAxis:2 extraResultsBlock:a6];
}

- (void)ts_performScrollTest:()NewsUIBridge iterations:length:completion:
{
  id v9 = a6;
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1BD0]);
  [v10 setIterations:a5];
  [v10 setLength:a2];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__UIScrollView_NewsUIBridge__ts_performScrollTest_iterations_length_completion___block_invoke;
  v12[3] = &unk_1E6D33E08;
  id v13 = v9;
  id v11 = v9;
  [a1 _performScrollTestWithParameters:v10 completionBlock:v12];
}

@end