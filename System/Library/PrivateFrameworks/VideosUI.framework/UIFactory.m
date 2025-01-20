@interface UIFactory
- (BOOL)isDocumentViewController:(id)a3 equalToViewController:(id)a4;
- (_TtC8VideosUI9UIFactory)init;
- (id)URLForResource:(id)a3;
- (id)_imageProxyForIKElement:(id)a3 withLayout:(id)a4;
- (id)_viewControllerForIKElement:(id)a3 existingViewController:(id)a4;
- (id)_viewForIKElement:(id)a3 existingView:(id)a4;
- (id)catchUpToLiveViewControllerWithIndex:(unint64_t)a3 mediaInfo:(id)a4 segments:(id)a5 metadataViewModels:(id)a6 nextToken:(id)a7;
- (id)catchUpToLiveViewControllerWithIndex:(unint64_t)a3 playable:(id)a4 segments:(id)a5 metadataViewModels:(id)a6 nextToken:(id)a7;
- (id)clipsViewControllerWithIndex:(unint64_t)a3 collectionData:(id)a4 maxMovieContentRating:(id)a5 maxTVContentRating:(id)a6;
- (id)clipsViewControllerWithIndex:(unint64_t)a3 trailerEndpoint:(id)a4 maxMovieContentRating:(id)a5 maxTVContentRating:(id)a6;
- (id)createMultiPlayerViewControllerWithPlayerViewControllers:(id)a3 showingDetails:(BOOL)a4;
- (id)imageForResource:(id)a3;
- (id)initializeLivePostPlayControllerWithPlayer:(id)a3 playerViewController:(id)a4 presentationView:(id)a5;
- (id)performanceDebuggerViewController;
- (id)playbackContainerViewController;
- (id)rootSplitViewController;
- (id)timedMetadataDebuggerViewController;
- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4 documentOptions:(id)a5;
- (void)recordImpressionsForViewController:(id)a3;
- (void)scrollViewControllerToTop:(id)a3 animated:(BOOL)a4 needsFocusUpdate:(BOOL)a5;
@end

@implementation UIFactory

- (id)viewControllerWithDocumentDataSource:(id)a3 appContext:(id)a4 documentOptions:(id)a5
{
  if (a5) {
    sub_1E387C678();
  }
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1E2C67B00();
  v12 = v11;

  swift_bridgeObjectRelease();
  return v12;
}

- (_TtC8VideosUI9UIFactory)init
{
  sub_1E2CAF2B8();
  return result;
}

- (void)recordImpressionsForViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E3445028(a3);
}

- (id)playbackContainerViewController
{
  v2 = self;
  id v3 = sub_1E3445148();

  return v3;
}

- (id)clipsViewControllerWithIndex:(unint64_t)a3 trailerEndpoint:(id)a4 maxMovieContentRating:(id)a5 maxTVContentRating:(id)a6
{
  OUTLINED_FUNCTION_44_7();
  id v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_21_84();
  sub_1E387C928();
  id v12 = v11;
  id v13 = v9;
  id v14 = v7;
  sub_1E34451B8(v6);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69();
  return v15;
}

- (id)clipsViewControllerWithIndex:(unint64_t)a3 collectionData:(id)a4 maxMovieContentRating:(id)a5 maxTVContentRating:(id)a6
{
  OUTLINED_FUNCTION_44_7();
  id v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_21_84();
  sub_1E387C678();
  id v11 = v10;
  id v12 = v8;
  id v13 = v6;
  uint64_t v14 = OUTLINED_FUNCTION_15_105();
  sub_1E3445320(v14, v15, v16, v8);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69();
  return v17;
}

- (id)catchUpToLiveViewControllerWithIndex:(unint64_t)a3 playable:(id)a4 segments:(id)a5 metadataViewModels:(id)a6 nextToken:(id)a7
{
  return sub_1E3445784();
}

- (id)catchUpToLiveViewControllerWithIndex:(unint64_t)a3 mediaInfo:(id)a4 segments:(id)a5 metadataViewModels:(id)a6 nextToken:(id)a7
{
  return sub_1E3445784();
}

- (BOOL)isDocumentViewController:(id)a3 equalToViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = OUTLINED_FUNCTION_54();
  LOBYTE(a4) = sub_1E3445880(v9);

  return a4 & 1;
}

- (id)createMultiPlayerViewControllerWithPlayerViewControllers:(id)a3 showingDetails:(BOOL)a4
{
  BOOL v4 = a4;
  sub_1E3446498();
  uint64_t v6 = sub_1E387CC98();
  id v7 = self;
  id v8 = (void *)sub_1E34459DC(v6, v4);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)timedMetadataDebuggerViewController
{
  v2 = self;
  id v3 = sub_1E3445B24();

  return v3;
}

- (id)performanceDebuggerViewController
{
  v2 = self;
  id v3 = sub_1E3445B94();

  return v3;
}

- (void)scrollViewControllerToTop:(id)a3 animated:(BOOL)a4 needsFocusUpdate:(BOOL)a5
{
  OUTLINED_FUNCTION_21_84();
  id v9 = v5;
  id v10 = v6;
  sub_1E3445C04(v5, a4, a5);
}

- (id)rootSplitViewController
{
  v2 = self;
  id v3 = sub_1E3445D58();

  return v3;
}

- (id)initializeLivePostPlayControllerWithPlayer:(id)a3 playerViewController:(id)a4 presentationView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  OUTLINED_FUNCTION_17_96();
  id v12 = sub_1E3445DE4();

  return v12;
}

- (id)URLForResource:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  MEMORY[0x1F4188790](v5 - 8);
  OUTLINED_FUNCTION_18_2();
  sub_1E387C928();
  uint64_t v6 = self;
  sub_1E3445EC4(v3);

  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1E38760D8();
  id v8 = 0;
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) != 1)
  {
    id v8 = (void *)sub_1E3876028();
    uint64_t v9 = OUTLINED_FUNCTION_54();
    v10(v9);
  }
  return v8;
}

- (id)imageForResource:(id)a3
{
  sub_1E387C928();
  BOOL v4 = self;
  id v5 = sub_1E34460A4();

  swift_bridgeObjectRelease();
  return v5;
}

- (id)_viewForIKElement:(id)a3 existingView:(id)a4
{
  return sub_1E3446358(self, (uint64_t)a2, a3, a4);
}

- (id)_imageProxyForIKElement:(id)a3 withLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1E34461F4();

  return v9;
}

- (id)_viewControllerForIKElement:(id)a3 existingViewController:(id)a4
{
  return sub_1E3446358(self, (uint64_t)a2, a3, a4);
}

@end