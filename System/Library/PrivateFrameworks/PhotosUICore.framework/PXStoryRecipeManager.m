@interface PXStoryRecipeManager
- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo;
- (BOOL)hasFinalChapterCollectionBeenProduced;
- (BOOL)hasFinalDetailedSaliencyBeenProduced;
- (BOOL)hasInitialPersistableRecipeBeenProduced;
- (BOOL)hasInitialStyleBeenProduced;
- (BOOL)haveFinalMovieHighlightsBeenProduced;
- (BOOL)isAssetCollectionFinal;
- (BOOL)isRecipeFinal;
- (BOOL)requiresAssetsSynchronously;
- (BOOL)requiresAutoEditDecisionListsSynchronously;
- (BOOL)requiresAutoEditStylesSynchronously;
- (BOOL)requiresChapterCollectionSynchronously;
- (BOOL)requiresDetailedSaliencySynchronously;
- (BOOL)requiresInitialStyleSynchronously;
- (BOOL)requiresMovieHighlightsSynchronously;
- (BOOL)requiresPersistableRecipeSynchronously;
- (BOOL)requiresSongsSynchronously;
- (BOOL)shouldAvoidSynchronousProductions;
- (BOOL)wantsAutoEditResults;
- (NSDate)loadingFinalDate;
- (NSDate)loadingReadyForPlaybackDate;
- (NSDate)loadingStartDate;
- (NSDictionary)additionalAutoEditDecisionListsBySong;
- (NSDictionary)resultsByComponent;
- (NSProgress)assetsAutoCurationProgress;
- (NSProgress)assetsProgress;
- (NSProgress)autoEditDecisionListsProgress;
- (NSProgress)autoEditStylesProgress;
- (NSProgress)chapterCollectionProgress;
- (NSProgress)curatedSongsProgress;
- (NSProgress)curationLengthsProgress;
- (NSProgress)detailedSaliencyProgress;
- (NSProgress)initialAutoEditDecisionListProgress;
- (NSProgress)initialStyleProgress;
- (NSProgress)movieHighlightsProgress;
- (NSProgress)persistableRecipeProgress;
- (NSProgress)persistedSongProgress;
- (NSSet)additionalSongs;
- (NSString)cachedAssetsCountHUDDescription;
- (NSString)description;
- (OS_dispatch_queue)storyQueue;
- (PXAssetsDataSource)assetsDataSource;
- (PXAssetsDataSourceManager)assetsDataSourceManager;
- (PXAudioAssetFetchResult)curatedSongs;
- (PXDisplayAsset)keyAsset;
- (PXDisplayAssetCollection)assetCollection;
- (PXDisplayAssetFetchResult)allAssets;
- (PXDisplayAssetFetchResult)curatedAssets;
- (PXDisplayAssetFetchResult)manuallyCuratedAssets;
- (PXDisplayAssetFetchResult)untruncatedCuratedAssets;
- (PXStoryAssetsProducer)assetsProducer;
- (PXStoryAssetsProducerFactory)assetsProducerFactory;
- (PXStoryAutoCurationProducer)autoCurationProducer;
- (PXStoryAutoCurationProducerFactory)autoCurationProducerFactory;
- (PXStoryAutoEditDecisionListsProducer)autoEditDecisionListsProducer;
- (PXStoryAutoEditDecisionListsProducerFactory)autoEditDecisionListsProducerFactory;
- (PXStoryAutoEditMomentsProvider)diagnosticsMomentsProvider;
- (PXStoryChapterCollection)chapterCollection;
- (PXStoryChapterCollectionManager)chapterCollectionManager;
- (PXStoryChapterCollectionProducer)chapterCollectionProducer;
- (PXStoryChapterCollectionProducerFactory)chapterCollectionProducerFactory;
- (PXStoryConfiguration)configuration;
- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer;
- (PXStoryDetailedSaliencyProducerFactory)detailedSaliencyProducerFactory;
- (PXStoryErrorReporter)errorReporter;
- (PXStoryMovieHighlightsProducer)movieHighlightsProducer;
- (PXStoryMovieHighlightsProducerFactory)movieHighlightsProducerFactory;
- (PXStoryPersistableRecipeProducer)persistableRecipeProducer;
- (PXStoryPersistableRecipeProducerFactory)persistableRecipeProducerFactory;
- (PXStoryProducerMonitor)detailedSaliencyProducerMonitor;
- (PXStoryProducerResult)assetsResult;
- (PXStoryProducerResult)autoEditDecisionListsResult;
- (PXStoryProducerResult)autoEditStylesResult;
- (PXStoryProducerResult)chapterCollectionResult;
- (PXStoryProducerResult)curatedSongsResult;
- (PXStoryProducerResult)curationLengthsResult;
- (PXStoryProducerResult)detailedSaliencyResult;
- (PXStoryProducerResult)initialAutoEditDecisionListResult;
- (PXStoryProducerResult)initialStyleResult;
- (PXStoryProducerResult)movieHighlightsResult;
- (PXStoryProducerResult)persistableRecipeResult;
- (PXStoryProducerResult)persistedSongResult;
- (PXStoryRecipe)recipe;
- (PXStoryRecipeAssetEdits)persistedRecipeAssetEdits;
- (PXStoryRecipeAssetEdits)recipeAssetEdits;
- (PXStoryRecipeManager)init;
- (PXStoryRecipeManager)initWithConfiguration:(id)a3;
- (PXStoryRecipeManager)initWithConfiguration:(id)a3 assetsProducerFactory:(id)a4 persistableRecipeProducerFactory:(id)a5 songsProducerFactory:(id)a6 movieHighlightsProducerFactory:(id)a7 detailedSaliencyProducerFactory:(id)a8 chapterCollectionProducerFactory:(id)a9 stylesProducerFactory:(id)a10 autoEditDecisionListsProducerFactory:(id)a11 autoCurationProducerFactory:(id)a12;
- (PXStorySongResource)initialSongResource;
- (PXStorySongResourceProducer)persistedSongProducer;
- (PXStorySongResourceProducerFactory)songResourceProducerFactory;
- (PXStorySongsProducer)curatedSongsProducer;
- (PXStorySongsProducerFactory)songsProducerFactory;
- (PXStoryStylesProducer)autoEditStylesProducer;
- (PXStoryStylesProducer)initialStyleProducer;
- (PXStoryStylesProducerFactory)stylesProducerFactory;
- (PXUpdater)updater;
- (id)_collectAutoEditDecisionListsBySong;
- (id)_diagnosticTextForGenericHUDAtDisplaySize:(CGSize)a3;
- (id)_monitorForProducer:(unint64_t)a3;
- (id)_resultForProducer:(unint64_t)a3;
- (id)_shortDescriptionOfPersistableRecipe:(id)a3;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)fallbackSongResource;
- (unint64_t)availableCurationLengths;
- (unint64_t)defaultCurationLength;
- (unint64_t)defaultRequestOptions;
- (unint64_t)finalizedProducers;
- (unint64_t)optionalProducers;
- (unint64_t)producersLikelyToKeepUp;
- (unint64_t)producersRequiredForPlayback;
- (unint64_t)producersToMonitor;
- (unint64_t)producersWithInitialResults;
- (unint64_t)recipeAttributes;
- (unint64_t)remainingProducers;
- (void)_applyManuallyCuratedAssets:(id)a3 setAsCustomUserAssets:(BOOL)a4;
- (void)_handleAdditionalAutoEditDecisionListsResult:(id)a3;
- (void)_handleAssetsResult:(id)a3;
- (void)_handleAutoEditDecisionListsResult:(id)a3;
- (void)_handleAutoEditStylesResult:(id)a3;
- (void)_handleChapterCollectionResult:(id)a3;
- (void)_handleCuratedAssetsResult:(id)a3 targetOverallDurationInfo:(id *)a4;
- (void)_handleCurationLengthsResult:(id)a3;
- (void)_handleDetailedSaliencyResult:(id)a3;
- (void)_handleInitialAutoEditDecisionListResult:(id)a3;
- (void)_handleInitialStyleResult:(id)a3;
- (void)_handleMovieHighlightsResult:(id)a3;
- (void)_handlePersistableRecipeResult:(id)a3;
- (void)_handlePersistedSongResourceResult:(id)a3;
- (void)_handleResult:(id)a3 forProducer:(unint64_t)a4;
- (void)_handleSongsResult:(id)a3;
- (void)_invalidateAdditionalAutoEditDecisionLists;
- (void)_invalidateAllAssets;
- (void)_invalidateAssetCollection;
- (void)_invalidateAssets;
- (void)_invalidateAssetsProducer;
- (void)_invalidateAutoCurationProducer;
- (void)_invalidateAutoEditDecisionLists;
- (void)_invalidateAutoEditDecisionListsProducer;
- (void)_invalidateAutoEditStyles;
- (void)_invalidateAutoEditStylesProducer;
- (void)_invalidateChapterCollection;
- (void)_invalidateChapterCollectionProducer;
- (void)_invalidateChapterCollectionResult;
- (void)_invalidateCuratedAssets;
- (void)_invalidateCuratedSongs;
- (void)_invalidateCuratedSongsProducer;
- (void)_invalidateCurationLengths;
- (void)_invalidateDetailedSaliency;
- (void)_invalidateDetailedSaliencyProducer;
- (void)_invalidateInitialAutoEditDecisionList;
- (void)_invalidateInitialStyle;
- (void)_invalidateInitialStyleProducer;
- (void)_invalidateKeyAsset;
- (void)_invalidateManuallyCuratedAssets;
- (void)_invalidateMovieHighlights;
- (void)_invalidateMovieHighlightsProducer;
- (void)_invalidateOverallDurationInfo;
- (void)_invalidatePersistableRecipe;
- (void)_invalidatePersistableRecipeProducer;
- (void)_invalidatePersistedSong;
- (void)_invalidatePersistedSongProducer;
- (void)_invalidateProducerMonitors;
- (void)_invalidateProducersLikelyToKeepUp;
- (void)_invalidateRecipe;
- (void)_invalidateRecipeAttributes;
- (void)_setNeedsUpdate;
- (void)_storyQueue_handleChangedAssetsDataSource:(id)a3;
- (void)_updateAdditionalAutoEditDecisionLists;
- (void)_updateAllAssets;
- (void)_updateAssetCollection;
- (void)_updateAssets;
- (void)_updateAssetsProducer;
- (void)_updateAutoCurationProducer;
- (void)_updateAutoEditDecisionLists;
- (void)_updateAutoEditDecisionListsProducer;
- (void)_updateAutoEditStyles;
- (void)_updateAutoEditStylesProducer;
- (void)_updateChapterCollection;
- (void)_updateChapterCollectionProducer;
- (void)_updateChapterCollectionResult;
- (void)_updateCuratedAssets;
- (void)_updateCuratedSongs;
- (void)_updateCuratedSongsProducer;
- (void)_updateCurationLengths;
- (void)_updateDetailedSaliency;
- (void)_updateDetailedSaliencyProducer;
- (void)_updateInitialAutoEditDecisionList;
- (void)_updateInitialStyle;
- (void)_updateInitialStyleProducer;
- (void)_updateKeyAsset;
- (void)_updateManuallyCuratedAssets;
- (void)_updateMovieHighlights;
- (void)_updateMovieHighlightsProducer;
- (void)_updateOverallDurationInfo;
- (void)_updatePersistableRecipe;
- (void)_updatePersistableRecipeProducer;
- (void)_updatePersistedSong;
- (void)_updatePersistedSongProducer;
- (void)_updateProducerMonitors;
- (void)_updateProducersLikelyToKeepUp;
- (void)_updateRecipe;
- (void)_updateRecipeAttributes;
- (void)applyCustomUserAssets:(id)a3;
- (void)applyKeyAsset:(id)a3;
- (void)applyManuallyCuratedAssets:(id)a3;
- (void)applyManuallyRemovedAssets:(id)a3;
- (void)applyTargetOverallDurationInfo:(id *)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)dealloc;
- (void)didPerformChanges;
- (void)ensureAutoEditDecisionListForSong:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setAdditionalAutoEditDecisionListsBySong:(id)a3;
- (void)setAdditionalSongs:(id)a3;
- (void)setAllAssets:(id)a3;
- (void)setAssetCollection:(id)a3;
- (void)setAssetsAutoCurationProgress:(id)a3;
- (void)setAssetsDataSource:(id)a3;
- (void)setAssetsDataSourceManager:(id)a3;
- (void)setAssetsProducer:(id)a3;
- (void)setAssetsProgress:(id)a3;
- (void)setAssetsResult:(id)a3;
- (void)setAutoCurationProducer:(id)a3;
- (void)setAutoEditDecisionListsProducer:(id)a3;
- (void)setAutoEditDecisionListsProgress:(id)a3;
- (void)setAutoEditDecisionListsResult:(id)a3;
- (void)setAutoEditStylesProducer:(id)a3;
- (void)setAutoEditStylesProgress:(id)a3;
- (void)setAutoEditStylesResult:(id)a3;
- (void)setAvailableCurationLengths:(unint64_t)a3;
- (void)setCachedAssetsCountHUDDescription:(id)a3;
- (void)setChapterCollection:(id)a3;
- (void)setChapterCollectionManager:(id)a3;
- (void)setChapterCollectionProducer:(id)a3;
- (void)setChapterCollectionProgress:(id)a3;
- (void)setChapterCollectionResult:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCuratedAssets:(id)a3;
- (void)setCuratedSongsProducer:(id)a3;
- (void)setCuratedSongsProgress:(id)a3;
- (void)setCuratedSongsResult:(id)a3;
- (void)setCurationLengthsProgress:(id)a3;
- (void)setCurationLengthsResult:(id)a3;
- (void)setDefaultCurationLength:(unint64_t)a3;
- (void)setDetailedSaliencyProducer:(id)a3;
- (void)setDetailedSaliencyProgress:(id)a3;
- (void)setDetailedSaliencyResult:(id)a3;
- (void)setFinalizedProducers:(unint64_t)a3;
- (void)setHasFinalChapterCollectionBeenProduced:(BOOL)a3;
- (void)setHasFinalDetailedSaliencyBeenProduced:(BOOL)a3;
- (void)setHasInitialPersistableRecipeBeenProduced:(BOOL)a3;
- (void)setHasInitialStyleBeenProduced:(BOOL)a3;
- (void)setHaveFinalMovieHighlightsBeenProduced:(BOOL)a3;
- (void)setInitialAutoEditDecisionListProgress:(id)a3;
- (void)setInitialAutoEditDecisionListResult:(id)a3;
- (void)setInitialSongResource:(id)a3;
- (void)setInitialStyleProducer:(id)a3;
- (void)setInitialStyleProgress:(id)a3;
- (void)setInitialStyleResult:(id)a3;
- (void)setIsAssetCollectionFinal:(BOOL)a3;
- (void)setIsRecipeFinal:(BOOL)a3;
- (void)setKeyAsset:(id)a3;
- (void)setLoadingFinalDate:(id)a3;
- (void)setLoadingReadyForPlaybackDate:(id)a3;
- (void)setLoadingStartDate:(id)a3;
- (void)setMovieHighlightsProducer:(id)a3;
- (void)setMovieHighlightsProgress:(id)a3;
- (void)setMovieHighlightsResult:(id)a3;
- (void)setOverallDurationInfo:(id *)a3;
- (void)setPersistableRecipeProducer:(id)a3;
- (void)setPersistableRecipeProgress:(id)a3;
- (void)setPersistableRecipeResult:(id)a3;
- (void)setPersistedRecipeAssetEdits:(id)a3;
- (void)setPersistedSongProducer:(id)a3;
- (void)setPersistedSongProgress:(id)a3;
- (void)setPersistedSongResult:(id)a3;
- (void)setProducersLikelyToKeepUp:(unint64_t)a3;
- (void)setProducersWithInitialResults:(unint64_t)a3;
- (void)setRecipe:(id)a3;
- (void)setRecipeAssetEdits:(id)a3;
- (void)setRecipeAttributes:(unint64_t)a3;
- (void)setRemainingProducers:(unint64_t)a3;
- (void)setUntruncatedCuratedAssets:(id)a3;
@end

@implementation PXStoryRecipeManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songResourceProducerFactory, 0);
  objc_storeStrong((id *)&self->_autoCurationProducerFactory, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsProducerFactory, 0);
  objc_storeStrong((id *)&self->_stylesProducerFactory, 0);
  objc_storeStrong((id *)&self->_chapterCollectionProducerFactory, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducerFactory, 0);
  objc_storeStrong((id *)&self->_movieHighlightsProducerFactory, 0);
  objc_storeStrong((id *)&self->_songsProducerFactory, 0);
  objc_storeStrong((id *)&self->_persistableRecipeProducerFactory, 0);
  objc_storeStrong((id *)&self->_assetsProducerFactory, 0);
  objc_storeStrong((id *)&self->_additionalAutoEditDecisionListsBySong, 0);
  objc_storeStrong((id *)&self->_additionalSongs, 0);
  objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_loadingFinalDate, 0);
  objc_storeStrong((id *)&self->_loadingReadyForPlaybackDate, 0);
  objc_storeStrong((id *)&self->_loadingStartDate, 0);
  objc_storeStrong((id *)&self->_initialAutoEditDecisionListResult, 0);
  objc_storeStrong((id *)&self->_initialAutoEditDecisionListProgress, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsResult, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsProgress, 0);
  objc_storeStrong((id *)&self->_autoEditDecisionListsProducer, 0);
  objc_storeStrong((id *)&self->_autoEditStylesResult, 0);
  objc_storeStrong((id *)&self->_autoEditStylesProgress, 0);
  objc_storeStrong((id *)&self->_autoEditStylesProducer, 0);
  objc_storeStrong((id *)&self->_initialStyleResult, 0);
  objc_storeStrong((id *)&self->_initialStyleProgress, 0);
  objc_storeStrong((id *)&self->_initialStyleProducer, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_untruncatedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_curationLengthsResult, 0);
  objc_storeStrong((id *)&self->_assetsAutoCurationProgress, 0);
  objc_storeStrong((id *)&self->_curationLengthsProgress, 0);
  objc_storeStrong((id *)&self->_autoCurationProducer, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_chapterCollectionResult, 0);
  objc_storeStrong((id *)&self->_chapterCollectionProgress, 0);
  objc_storeStrong((id *)&self->_chapterCollectionProducer, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyResult, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProgress, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducer, 0);
  objc_storeStrong((id *)&self->_detailedSaliencyProducerMonitor, 0);
  objc_storeStrong((id *)&self->_movieHighlightsResult, 0);
  objc_storeStrong((id *)&self->_movieHighlightsProgress, 0);
  objc_storeStrong((id *)&self->_movieHighlightsProducer, 0);
  objc_storeStrong((id *)&self->_initialSongResource, 0);
  objc_storeStrong((id *)&self->_persistedSongResult, 0);
  objc_storeStrong((id *)&self->_persistedSongProgress, 0);
  objc_storeStrong((id *)&self->_persistedSongProducer, 0);
  objc_storeStrong((id *)&self->_curatedSongsResult, 0);
  objc_storeStrong((id *)&self->_curatedSongsProgress, 0);
  objc_storeStrong((id *)&self->_curatedSongsProducer, 0);
  objc_storeStrong((id *)&self->_persistableRecipeResult, 0);
  objc_storeStrong((id *)&self->_persistableRecipeProgress, 0);
  objc_storeStrong((id *)&self->_persistableRecipeProducer, 0);
  objc_storeStrong((id *)&self->_cachedAssetsCountHUDDescription, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetsResult, 0);
  objc_storeStrong((id *)&self->_assetsProgress, 0);
  objc_storeStrong((id *)&self->_assetsProducer, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_errorReporter, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_chapterCollectionManager, 0);
  objc_storeStrong((id *)&self->_manuallyCuratedAssets, 0);
  objc_storeStrong((id *)&self->_recipeAssetEdits, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

- (PXStorySongResourceProducerFactory)songResourceProducerFactory
{
  return self->_songResourceProducerFactory;
}

- (PXStoryAutoCurationProducerFactory)autoCurationProducerFactory
{
  return self->_autoCurationProducerFactory;
}

- (PXStoryAutoEditDecisionListsProducerFactory)autoEditDecisionListsProducerFactory
{
  return self->_autoEditDecisionListsProducerFactory;
}

- (PXStoryStylesProducerFactory)stylesProducerFactory
{
  return self->_stylesProducerFactory;
}

- (PXStoryChapterCollectionProducerFactory)chapterCollectionProducerFactory
{
  return self->_chapterCollectionProducerFactory;
}

- (PXStoryDetailedSaliencyProducerFactory)detailedSaliencyProducerFactory
{
  return self->_detailedSaliencyProducerFactory;
}

- (PXStoryMovieHighlightsProducerFactory)movieHighlightsProducerFactory
{
  return self->_movieHighlightsProducerFactory;
}

- (PXStorySongsProducerFactory)songsProducerFactory
{
  return self->_songsProducerFactory;
}

- (PXStoryPersistableRecipeProducerFactory)persistableRecipeProducerFactory
{
  return self->_persistableRecipeProducerFactory;
}

- (PXStoryAssetsProducerFactory)assetsProducerFactory
{
  return self->_assetsProducerFactory;
}

- (NSDictionary)additionalAutoEditDecisionListsBySong
{
  return self->_additionalAutoEditDecisionListsBySong;
}

- (void)setAdditionalSongs:(id)a3
{
}

- (NSSet)additionalSongs
{
  return self->_additionalSongs;
}

- (PXStoryRecipeAssetEdits)persistedRecipeAssetEdits
{
  return self->_persistedRecipeAssetEdits;
}

- (void)setLoadingFinalDate:(id)a3
{
}

- (NSDate)loadingFinalDate
{
  return self->_loadingFinalDate;
}

- (void)setLoadingReadyForPlaybackDate:(id)a3
{
}

- (NSDate)loadingReadyForPlaybackDate
{
  return self->_loadingReadyForPlaybackDate;
}

- (void)setLoadingStartDate:(id)a3
{
}

- (NSDate)loadingStartDate
{
  return self->_loadingStartDate;
}

- (PXStoryProducerResult)initialAutoEditDecisionListResult
{
  return self->_initialAutoEditDecisionListResult;
}

- (void)setInitialAutoEditDecisionListProgress:(id)a3
{
}

- (NSProgress)initialAutoEditDecisionListProgress
{
  return self->_initialAutoEditDecisionListProgress;
}

- (PXStoryProducerResult)autoEditDecisionListsResult
{
  return self->_autoEditDecisionListsResult;
}

- (NSProgress)autoEditDecisionListsProgress
{
  return self->_autoEditDecisionListsProgress;
}

- (PXStoryAutoEditDecisionListsProducer)autoEditDecisionListsProducer
{
  return self->_autoEditDecisionListsProducer;
}

- (PXStoryProducerResult)autoEditStylesResult
{
  return self->_autoEditStylesResult;
}

- (NSProgress)autoEditStylesProgress
{
  return self->_autoEditStylesProgress;
}

- (BOOL)requiresAutoEditStylesSynchronously
{
  return self->_requiresAutoEditStylesSynchronously;
}

- (PXStoryStylesProducer)autoEditStylesProducer
{
  return self->_autoEditStylesProducer;
}

- (void)setHasInitialStyleBeenProduced:(BOOL)a3
{
  self->_hasInitialStyleBeenProduced = a3;
}

- (BOOL)hasInitialStyleBeenProduced
{
  return self->_hasInitialStyleBeenProduced;
}

- (PXStoryProducerResult)initialStyleResult
{
  return self->_initialStyleResult;
}

- (NSProgress)initialStyleProgress
{
  return self->_initialStyleProgress;
}

- (PXStoryStylesProducer)initialStyleProducer
{
  return self->_initialStyleProducer;
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (PXDisplayAssetFetchResult)allAssets
{
  return self->_allAssets;
}

- (PXDisplayAssetFetchResult)untruncatedCuratedAssets
{
  return self->_untruncatedCuratedAssets;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (unint64_t)defaultCurationLength
{
  return self->_defaultCurationLength;
}

- ($5EF5D5D6B68C46A6CC4A689629511B76)overallDurationInfo
{
  long long v3 = *(_OWORD *)&self[9].var1.var2.var1;
  *(_OWORD *)&retstr->var1.var1.var0 = *(_OWORD *)&self[9].var1.var1.var3;
  *(_OWORD *)&retstr->var1.var1.var3 = v3;
  *(_OWORD *)&retstr->var1.var2.var1 = *(_OWORD *)&self[10].var0;
  long long v4 = *(_OWORD *)&self[9].var1.var1.var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[9].var1.var0.var1;
  *(_OWORD *)&retstr->var1.var0.var1 = v4;
  return self;
}

- (PXStoryProducerResult)curationLengthsResult
{
  return self->_curationLengthsResult;
}

- (NSProgress)assetsAutoCurationProgress
{
  return self->_assetsAutoCurationProgress;
}

- (NSProgress)curationLengthsProgress
{
  return self->_curationLengthsProgress;
}

- (PXStoryAutoCurationProducer)autoCurationProducer
{
  return self->_autoCurationProducer;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (BOOL)hasFinalChapterCollectionBeenProduced
{
  return self->_hasFinalChapterCollectionBeenProduced;
}

- (PXStoryProducerResult)chapterCollectionResult
{
  return self->_chapterCollectionResult;
}

- (NSProgress)chapterCollectionProgress
{
  return self->_chapterCollectionProgress;
}

- (PXStoryChapterCollectionProducer)chapterCollectionProducer
{
  return self->_chapterCollectionProducer;
}

- (BOOL)hasFinalDetailedSaliencyBeenProduced
{
  return self->_hasFinalDetailedSaliencyBeenProduced;
}

- (PXStoryProducerResult)detailedSaliencyResult
{
  return self->_detailedSaliencyResult;
}

- (NSProgress)detailedSaliencyProgress
{
  return self->_detailedSaliencyProgress;
}

- (PXStoryDetailedSaliencyProducer)detailedSaliencyProducer
{
  return self->_detailedSaliencyProducer;
}

- (PXStoryProducerMonitor)detailedSaliencyProducerMonitor
{
  return self->_detailedSaliencyProducerMonitor;
}

- (BOOL)haveFinalMovieHighlightsBeenProduced
{
  return self->_haveFinalMovieHighlightsBeenProduced;
}

- (PXStoryProducerResult)movieHighlightsResult
{
  return self->_movieHighlightsResult;
}

- (NSProgress)movieHighlightsProgress
{
  return self->_movieHighlightsProgress;
}

- (PXStoryMovieHighlightsProducer)movieHighlightsProducer
{
  return self->_movieHighlightsProducer;
}

- (void)setInitialSongResource:(id)a3
{
}

- (PXStoryProducerResult)persistedSongResult
{
  return self->_persistedSongResult;
}

- (NSProgress)persistedSongProgress
{
  return self->_persistedSongProgress;
}

- (PXStorySongResourceProducer)persistedSongProducer
{
  return self->_persistedSongProducer;
}

- (PXStoryProducerResult)curatedSongsResult
{
  return self->_curatedSongsResult;
}

- (NSProgress)curatedSongsProgress
{
  return self->_curatedSongsProgress;
}

- (PXStorySongsProducer)curatedSongsProducer
{
  return self->_curatedSongsProducer;
}

- (BOOL)hasInitialPersistableRecipeBeenProduced
{
  return self->_hasInitialPersistableRecipeBeenProduced;
}

- (PXStoryProducerResult)persistableRecipeResult
{
  return self->_persistableRecipeResult;
}

- (NSProgress)persistableRecipeProgress
{
  return self->_persistableRecipeProgress;
}

- (PXStoryPersistableRecipeProducer)persistableRecipeProducer
{
  return self->_persistableRecipeProducer;
}

- (void)setCachedAssetsCountHUDDescription:(id)a3
{
}

- (NSString)cachedAssetsCountHUDDescription
{
  return self->_cachedAssetsCountHUDDescription;
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (PXStoryProducerResult)assetsResult
{
  return self->_assetsResult;
}

- (NSProgress)assetsProgress
{
  return self->_assetsProgress;
}

- (PXStoryAssetsProducer)assetsProducer
{
  return self->_assetsProducer;
}

- (unint64_t)producersLikelyToKeepUp
{
  return self->_producersLikelyToKeepUp;
}

- (unint64_t)remainingProducers
{
  return self->_remainingProducers;
}

- (unint64_t)finalizedProducers
{
  return self->_finalizedProducers;
}

- (unint64_t)producersWithInitialResults
{
  return self->_producersWithInitialResults;
}

- (void)setIsAssetCollectionFinal:(BOOL)a3
{
  self->_isAssetCollectionFinal = a3;
}

- (BOOL)isAssetCollectionFinal
{
  return self->_isAssetCollectionFinal;
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (unint64_t)defaultRequestOptions
{
  return self->_defaultRequestOptions;
}

- (PXStoryErrorReporter)errorReporter
{
  return self->_errorReporter;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  return self->_chapterCollectionManager;
}

- (PXDisplayAssetFetchResult)manuallyCuratedAssets
{
  return self->_manuallyCuratedAssets;
}

- (PXStoryRecipeAssetEdits)recipeAssetEdits
{
  return self->_recipeAssetEdits;
}

- (unint64_t)availableCurationLengths
{
  return self->_availableCurationLengths;
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (BOOL)isRecipeFinal
{
  return self->_isRecipeFinal;
}

- (unint64_t)recipeAttributes
{
  return self->_recipeAttributes;
}

- (PXStoryRecipe)recipe
{
  return self->_recipe;
}

- (PXStoryConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)_storyQueue_handleChangedAssetsDataSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PXStoryRecipeManager__storyQueue_handleChangedAssetsDataSource___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __66__PXStoryRecipeManager__storyQueue_handleChangedAssetsDataSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetsDataSource:*(void *)(a1 + 40)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)AssetsDataSourceManagerObservationContext == a5)
  {
    if (v6)
    {
      v11 = [(PXStoryRecipeManager *)self assetsDataSourceManager];
      v12 = [v11 dataSource];

      v13 = [(PXStoryRecipeManager *)self storyQueue];
      v14 = (void *)MEMORY[0x1E4F14428];

      if (v13 == v14)
      {
        [(PXStoryRecipeManager *)self _storyQueue_handleChangedAssetsDataSource:v12];
      }
      else
      {
        v15 = [(PXStoryRecipeManager *)self storyQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__PXStoryRecipeManager_observable_didChange_context___block_invoke;
        block[3] = &unk_1E5DD32A8;
        block[4] = self;
        id v28 = v12;
        dispatch_async(v15, block);
      }
    }
  }
  else if ((void *)ChapterCollectionManagerObservationContext == a5)
  {
    if (v6)
    {
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_2;
      v25 = &unk_1E5DC1548;
      v26 = self;
      v10 = &v22;
      goto LABEL_11;
    }
  }
  else
  {
    if ((void *)ProducerMonitorObservationContext != a5)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"PXStoryRecipeManager.m" lineNumber:2541 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (v6)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_3;
      v20 = &unk_1E5DC1548;
      v21 = self;
      v10 = &v17;
LABEL_11:
      -[PXStoryRecipeManager performChanges:](self, "performChanges:", v10, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

uint64_t __53__PXStoryRecipeManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storyQueue_handleChangedAssetsDataSource:", *(void *)(a1 + 40));
}

uint64_t __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateChapterCollection];
}

uint64_t __53__PXStoryRecipeManager_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateProducersLikelyToKeepUp];
}

- (id)_collectAutoEditDecisionListsBySong
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
  id v5 = [v4 object];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
    v8 = [v7 object];
    id v9 = [v8 firstObject];

    v10 = [v9 song];
    if (v10) {
      [v3 setObject:v9 forKeyedSubscript:v10];
    }
  }
  v11 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
  v12 = [v11 object];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v14 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
    v15 = [v14 object];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v21 = [v20 song];
          if (v21) {
            [v3 setObject:v20 forKeyedSubscript:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }
  }
  uint64_t v22 = [(PXStoryRecipeManager *)self additionalAutoEditDecisionListsBySong];
  if ([v22 count])
  {
    uint64_t v23 = (void *)[v3 mutableCopy];
    [v23 addEntriesFromDictionary:v22];
    uint64_t v24 = [v23 copy];

    id v3 = (id)v24;
  }

  return v3;
}

- (NSDictionary)resultsByComponent
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v9 = __42__PXStoryRecipeManager_resultsByComponent__block_invoke;
  v10 = &unk_1E5DD1558;
  id v4 = v3;
  id v11 = v4;
  v12 = self;
  char v13 = 0;
  unint64_t v5 = 1;
  do
  {
    ((void (*)(void *, unint64_t, char *))v9)(v8, v5, &v13);
    if (v5 > 0xFFF) {
      break;
    }
    v5 *= 2;
  }
  while (!v13);
  uint64_t v6 = (void *)[v4 copy];

  return (NSDictionary *)v6;
}

void __42__PXStoryRecipeManager_resultsByComponent__block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 40) _resultForProducer:a2];
  id v4 = *(void **)(a1 + 32);
  unint64_t v5 = PXStoryProducerName(a2);
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (id)_resultForProducer:(unint64_t)a3
{
  id v3 = 0;
  if ((uint64_t)a3 <= 127)
  {
    if ((uint64_t)a3 <= 15)
    {
      switch(a3)
      {
        case 1uLL:
          uint64_t v4 = [(PXStoryRecipeManager *)self assetsResult];
          goto LABEL_25;
        case 2uLL:
          goto LABEL_26;
        case 4uLL:
          uint64_t v4 = [(PXStoryRecipeManager *)self persistableRecipeResult];
          goto LABEL_25;
        case 8uLL:
          uint64_t v4 = [(PXStoryRecipeManager *)self persistedSongResult];
          goto LABEL_25;
        default:
          goto LABEL_29;
      }
    }
    switch(a3)
    {
      case 0x10uLL:
        uint64_t v4 = [(PXStoryRecipeManager *)self curatedSongsResult];
        goto LABEL_25;
      case 0x20uLL:
        uint64_t v4 = [(PXStoryRecipeManager *)self movieHighlightsResult];
        goto LABEL_25;
      case 0x40uLL:
        uint64_t v4 = [(PXStoryRecipeManager *)self initialStyleResult];
        goto LABEL_25;
    }
LABEL_29:
    PXAssertGetLog();
  }
  if ((uint64_t)a3 > 1023)
  {
    switch(a3)
    {
      case 0x400uLL:
        goto LABEL_26;
      case 0x800uLL:
        uint64_t v4 = [(PXStoryRecipeManager *)self chapterCollectionResult];
        goto LABEL_25;
      case 0x1000uLL:
        uint64_t v4 = [(PXStoryRecipeManager *)self detailedSaliencyResult];
        goto LABEL_25;
    }
    goto LABEL_29;
  }
  if (a3 == 128)
  {
    uint64_t v4 = [(PXStoryRecipeManager *)self autoEditStylesResult];
    goto LABEL_25;
  }
  if (a3 == 256)
  {
    uint64_t v4 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
    goto LABEL_25;
  }
  if (a3 != 512) {
    goto LABEL_29;
  }
  uint64_t v4 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
LABEL_25:
  id v3 = (void *)v4;
LABEL_26:
  return v3;
}

- (id)_monitorForProducer:(unint64_t)a3
{
  if (a3 == 4096)
  {
    unint64_t v5 = [(PXStoryRecipeManager *)self detailedSaliencyProducerMonitor];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)_updateRecipeAttributes
{
  char v3 = [(PXStoryRecipeManager *)self recipeAttributes];
  unint64_t v4 = [(PXStoryRecipeManager *)self producersWithInitialResults];
  unint64_t v5 = [(PXStoryRecipeManager *)self producersRequiredForPlayback] & ~v4;
  unint64_t v6 = [(PXStoryRecipeManager *)self producersLikelyToKeepUp];
  unint64_t v7 = [(PXStoryRecipeManager *)self producersToMonitor];
  uint64_t v8 = 0;
  if (!v5 && v6 == v7)
  {
    id v9 = [(PXStoryRecipeManager *)self loadingReadyForPlaybackDate];

    if (!v9)
    {
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [(PXStoryRecipeManager *)self setLoadingReadyForPlaybackDate:v10];
    }
    uint64_t v8 = 1;
  }
  int v11 = [(PXStoryRecipeManager *)self finalizedProducers];
  if ((~[(PXStoryRecipeManager *)self optionalProducers] & ~v11 & 0x1FFFLL) == 0
    || (v3 & 2) != 0)
  {
    v8 |= 2uLL;
    v12 = [(PXStoryRecipeManager *)self loadingFinalDate];

    if (!v12)
    {
      char v13 = [MEMORY[0x1E4F1C9C8] date];
      [(PXStoryRecipeManager *)self setLoadingFinalDate:v13];
    }
  }
  [(PXStoryRecipeManager *)self setRecipeAttributes:v8];
}

- (void)_invalidateRecipeAttributes
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRecipeAttributes];
}

- (void)_updateRecipe
{
  char v3 = [(PXStoryRecipeManager *)self initialStyleResult];
  unint64_t v4 = [v3 object];
  unint64_t v5 = [v4 firstObject];

  unint64_t v6 = [(PXStoryRecipeManager *)self autoEditStylesResult];
  uint64_t v7 = [v6 object];

  v25 = (void *)v7;
  if (v5) {
    long long v27 = [[PXStoryStyleConfigurationList alloc] initWithAutoEditStyleConfigurations:v7 initialStyleConfiguration:v5];
  }
  else {
    long long v27 = 0;
  }
  uint64_t v22 = [(PXStoryRecipeManager *)self _collectAutoEditDecisionListsBySong];
  uint64_t v8 = [PXStoryRecipe alloc];
  v20 = [(PXStoryRecipeManager *)self assetCollection];
  long long v26 = [(PXStoryRecipeManager *)self keyAsset];
  v21 = [(PXStoryRecipeManager *)self curatedAssets];
  v19 = [(PXStoryRecipeManager *)self untruncatedCuratedAssets];
  uint64_t v18 = [(PXStoryRecipeManager *)self allAssets];
  uint64_t v24 = [(PXStoryRecipeManager *)self movieHighlightsResult];
  uint64_t v16 = [v24 object];
  uint64_t v23 = [(PXStoryRecipeManager *)self detailedSaliencyResult];
  v15 = [v23 object];
  v14 = [(PXStoryRecipeManager *)self chapterCollection];
  [(PXStoryRecipeManager *)self overallDurationInfo];
  uint64_t v17 = [(PXStoryRecipeManager *)self persistableRecipeResult];
  id v9 = [v17 object];
  v10 = [v9 recipe];
  int v11 = [(PXStoryRecipeManager *)self initialSongResource];
  v12 = [(PXStoryRecipeManager *)self fallbackSongResource];
  char v13 = [(PXStoryRecipe *)v8 initWithAssetCollection:v20 keyAsset:v26 curatedAssets:v21 untruncatedCuratedAssets:v19 allAssets:v18 movieHighlights:v16 detailedSaliency:v15 chapterCollection:v14 overallDurationInfo:v28 styleConfigurationList:v27 sourcePersistableRecipe:v10 initialSongResource:v11 fallbackSongResource:v12 autoEditDecisionListsBySong:v22];
  [(PXStoryRecipeManager *)self setRecipe:v13];

  [(PXStoryRecipeManager *)self _invalidateRecipeAttributes];
}

- (void)_invalidateRecipe
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateRecipe];
}

- (void)_updateProducersLikelyToKeepUp
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  unint64_t v4 = [(PXStoryRecipeManager *)self producersToMonitor];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  uint64_t v7 = __54__PXStoryRecipeManager__updateProducersLikelyToKeepUp__block_invoke;
  uint64_t v8 = &unk_1E5DCD888;
  unint64_t v11 = v4;
  SEL v12 = a2;
  id v9 = self;
  v10 = &v13;
  char v17 = 0;
  unint64_t v5 = 1;
  do
  {
    ((void (*)(void *, unint64_t, char *))v7)(v6, v5, &v17);
    if (v5 > 0xFFF) {
      break;
    }
    v5 *= 2;
  }
  while (!v17);
  [(PXStoryRecipeManager *)self setProducersLikelyToKeepUp:v14[3]];
  _Block_object_dispose(&v13, 8);
}

void __54__PXStoryRecipeManager__updateProducersLikelyToKeepUp__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((a2 & ~*(void *)(a1 + 48)) == 0)
  {
    unint64_t v4 = [*(id *)(a1 + 32) _monitorForProducer:a2];
    id v9 = v4;
    if (!v4)
    {
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = PXStoryProducerName(a2);
      [v5 handleFailureInMethod:v6, v7, @"PXStoryRecipeManager.m", 2367, @"no monitor for producer %@", v8 object file lineNumber description];

      unint64_t v4 = 0;
    }
    if ([v4 isLikelyToKeepUp]) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= a2;
    }
  }
}

- (void)_invalidateProducersLikelyToKeepUp
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateProducersLikelyToKeepUp];
}

- (void)_updateProducerMonitors
{
  char v3 = [(PXStoryRecipeManager *)self curatedAssets];
  uint64_t v4 = [v3 count];

  unint64_t v5 = +[PXStorySettings sharedInstance];
  [v5 estimatedMinimumDurationPerCuratedAsset];
  double v7 = v6;

  if (v4 < 1) {
    float v8 = 0.0;
  }
  else {
    float v8 = 1.0 / (v7 * (double)v4);
  }
  id v9 = [(PXStoryRecipeManager *)self detailedSaliencyProducerMonitor];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__PXStoryRecipeManager__updateProducerMonitors__block_invoke_2;
  v10[3] = &__block_descriptor_36_e41_v16__0___PXStoryMutableProducerMonitor__8l;
  float v11 = v8;
  [v9 performChanges:v10];
}

uint64_t __47__PXStoryRecipeManager__updateProducerMonitors__block_invoke_2(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setEstimatedFractionCompletedPlaybackSpeed:a3];
}

- (void)_invalidateProducerMonitors
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateProducerMonitors];
}

- (void)_handleAutoEditDecisionListsResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__PXStoryRecipeManager__handleAutoEditDecisionListsResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __59__PXStoryRecipeManager__handleAutoEditDecisionListsResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAutoEditDecisionListsResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 setAutoEditDecisionListsProgress:0];
  }
  return result;
}

- (void)_updateAutoEditDecisionLists
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__164009;
  v7[4] = __Block_byref_object_dispose__164010;
  id v8 = 0;
  char v3 = [(PXStoryRecipeManager *)self curatedSongs];
  if (v3)
  {
    id v4 = [(PXStoryRecipeManager *)self persistedSongResult];
    char v5 = [v4 isDegraded];

    if ((v5 & 1) == 0)
    {
      [(PXStoryRecipeManager *)self defaultRequestOptions];
      [(PXStoryRecipeManager *)self requiresAutoEditDecisionListsSynchronously];
      objc_initWeak(&location, self);
      [(PXStoryRecipeManager *)self storyQueue];
      objc_claimAutoreleasedReturnValue();
      PXSyncCallbackBegin();
    }
  }

  _Block_object_dispose(v7, 8);
}

void __52__PXStoryRecipeManager__updateAutoEditDecisionLists__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __52__PXStoryRecipeManager__updateAutoEditDecisionLists__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    SEL v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeAutoEditDecisionLists", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleAutoEditDecisionListsResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateAutoEditDecisionLists
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAutoEditDecisionLists];
}

- (void)_handleInitialAutoEditDecisionListResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __65__PXStoryRecipeManager__handleInitialAutoEditDecisionListResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __65__PXStoryRecipeManager__handleInitialAutoEditDecisionListResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialAutoEditDecisionListResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setInitialAutoEditDecisionListProgress:0];
  }
  return result;
}

- (void)_updateInitialAutoEditDecisionList
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryRecipeManager *)self initialSongResource];
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "px_storyResourceSongAsset");
    char v6 = [v5 flags];

    if ((v6 & 4) == 0)
    {
      [(PXStoryRecipeManager *)self defaultRequestOptions];
      [(PXStoryRecipeManager *)self requiresAutoEditDecisionListsSynchronously];
      [(PXStoryRecipeManager *)self storyQueue];
      objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v7[0] = 0;
      v7[1] = v7;
      v7[2] = 0x3032000000;
      v7[3] = __Block_byref_object_copy__164009;
      v7[4] = __Block_byref_object_dispose__164010;
      void v7[5] = 0;
      PXSyncCallbackBegin();
    }
  }
}

void __58__PXStoryRecipeManager__updateInitialAutoEditDecisionList__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __58__PXStoryRecipeManager__updateInitialAutoEditDecisionList__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    SEL v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeInitialAutoEditDecisionList", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleInitialAutoEditDecisionListResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateInitialAutoEditDecisionList
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInitialAutoEditDecisionList];
}

- (void)_updateAutoEditDecisionListsProducer
{
  id v12 = [(PXStoryRecipeManager *)self configuration];
  if (([v12 options] & 2) == 0)
  {
    id v3 = [(PXStoryRecipeManager *)self curatedAssets];
    if (v3
      && [(PXStoryRecipeManager *)self haveFinalMovieHighlightsBeenProduced])
    {
      BOOL v4 = [(PXStoryRecipeManager *)self hasFinalChapterCollectionBeenProduced];

      if (v4)
      {
        os_signpost_id_t v5 = [(PXStoryRecipeManager *)self curatedAssets];
        uint64_t v6 = [(PXStoryRecipeManager *)self movieHighlightsResult];
        id v7 = [v6 object];

        id v8 = [(PXStoryRecipeManager *)self chapterCollection];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v14 = 0u;
        [(PXStoryRecipeManager *)self overallDurationInfo];
        os_signpost_type_t v9 = [(PXStoryRecipeManager *)self autoEditDecisionListsProducerFactory];
        v10 = [(PXStoryRecipeManager *)self assetCollection];
        v13[2] = v16;
        v13[3] = v17;
        v13[4] = v18;
        v13[0] = v14;
        v13[1] = v15;
        uint64_t v11 = [v9 autoEditDecisionListsProducerForAssetCollection:v10 displayAssets:v5 movieHighlights:v7 chapterCollection:v8 targetOverallDurationInfo:v13];

        [(PXStoryRecipeManager *)self setAutoEditDecisionListsProducer:v11];
      }
      return;
    }
  }
}

- (void)_invalidateAutoEditDecisionListsProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAutoEditDecisionListsProducer];
}

- (void)_handleAutoEditStylesResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __52__PXStoryRecipeManager__handleAutoEditStylesResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __52__PXStoryRecipeManager__handleAutoEditStylesResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAutoEditStylesResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setAutoEditStylesProgress:0];
  }
  return result;
}

- (void)_updateAutoEditStyles
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (![(PXStoryRecipeManager *)self wantsAutoEditResults])
  {
    id v3 = +[PXStoryProducerResult nullResult];
    [(PXStoryRecipeManager *)self _handleAutoEditStylesResult:v3];
  }
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__164009;
  v5[4] = __Block_byref_object_dispose__164010;
  v5[5] = 0;
  [(PXStoryRecipeManager *)self defaultRequestOptions];
  [(PXStoryRecipeManager *)self requiresAutoEditStylesSynchronously];
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __45__PXStoryRecipeManager__updateAutoEditStyles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __45__PXStoryRecipeManager__updateAutoEditStyles__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)long long v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    id v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)long long v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)long long v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeStyles", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleAutoEditStylesResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateAutoEditStyles
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAutoEditStyles];
}

- (void)_updateAutoEditStylesProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
    id v8 = [v5 object];

    if (v8)
    {
      uint64_t v6 = [(PXStoryRecipeManager *)self stylesProducerFactory];
      id v7 = [v6 stylesProducerForAutoEditDecisionLists:v8];
      [(PXStoryRecipeManager *)self setAutoEditStylesProducer:v7];
    }
  }
}

- (void)_invalidateAutoEditStylesProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAutoEditStylesProducer];
}

- (void)_handleInitialStyleResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__PXStoryRecipeManager__handleInitialStyleResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __50__PXStoryRecipeManager__handleInitialStyleResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialStyleResult:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setHasInitialStyleBeenProduced:1];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setInitialStyleProgress:0];
  }
  return result;
}

- (void)_updateInitialStyle
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__164009;
  v4[4] = __Block_byref_object_dispose__164010;
  v4[5] = 0;
  [(PXStoryRecipeManager *)self defaultRequestOptions];
  [(PXStoryRecipeManager *)self requiresInitialStyleSynchronously];
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __43__PXStoryRecipeManager__updateInitialStyle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __43__PXStoryRecipeManager__updateInitialStyle__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)long long v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    id v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)long long v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)long long v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeInitialStyle", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleInitialStyleResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateInitialStyle
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInitialStyle];
}

- (void)_updateInitialStyleProducer
{
  if (![(PXStoryRecipeManager *)self hasInitialPersistableRecipeBeenProduced]
    || ([(PXStoryRecipeManager *)self configuration],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 options],
        v3,
        (v4 & 2) != 0))
  {
    id v15 = [(PXStoryRecipeManager *)self stylesProducerFactory];
    os_signpost_type_t v9 = [(PXStoryRecipeManager *)self configuration];
    v10 = [v9 assetCollection];
    uint64_t v13 = [v15 initialStyleProducerForAssetCollection:v10];
    [(PXStoryRecipeManager *)self setInitialStyleProducer:v13];
  }
  else
  {
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
    uint64_t v6 = [v5 object];
    id v15 = [v6 firstObject];

    id v7 = [(PXStoryRecipeManager *)self persistableRecipeResult];
    id v8 = [v7 object];
    os_signpost_type_t v9 = [v8 recipe];

    v10 = [(PXStoryRecipeManager *)self initialSongResource];
    uint64_t v11 = objc_msgSend(v10, "px_storyResourceSongAsset");
    char v12 = [v11 flags];

    if ((v12 & 4) != 0) {
      goto LABEL_7;
    }
    uint64_t v13 = [(PXStoryRecipeManager *)self stylesProducerFactory];
    long long v14 = [v13 initialStyleProducerForPersistableRecipe:v9 songResource:v10 autoEditDecisionList:v15];
    [(PXStoryRecipeManager *)self setInitialStyleProducer:v14];
  }
LABEL_7:
}

- (void)_invalidateInitialStyleProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInitialStyleProducer];
}

- (void)_updateManuallyCuratedAssets
{
  if (!self->_manuallyCuratedAssets)
  {
    id v5 = [(PXStoryRecipeManager *)self curatedAssets];
    if ([v5 count] <= 0)
    {
    }
    else
    {
      [(PXStoryRecipeManager *)self overallDurationInfo];

      if (v6 == 2)
      {
        id v3 = [(PXStoryRecipeManager *)self curatedAssets];
        manuallyCuratedAssets = self->_manuallyCuratedAssets;
        self->_manuallyCuratedAssets = v3;
      }
    }
  }
}

- (void)_invalidateManuallyCuratedAssets
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateManuallyCuratedAssets];
}

- (void)_updateKeyAsset
{
  id v4 = [(PXStoryRecipeManager *)self assetsDataSource];
  id v3 = [v4 keyAsset];
  [(PXStoryRecipeManager *)self setKeyAsset:v3];
}

- (void)_invalidateKeyAsset
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateKeyAsset];
}

- (void)_updateCuratedAssets
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryRecipeManager *)self assetsDataSource];
  if ([v3 numberOfSections] < 1)
  {
LABEL_10:
    id v5 = 0;
    goto LABEL_11;
  }
  if (v3)
  {
    [v3 firstSectionIndexPath];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  id v4 = [v3 assetsInSectionIndexPath:&v11];
  id v5 = v4;
  if (v4 && ![v4 count])
  {
    uint64_t v6 = PLStoryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(PXStoryRecipeManager *)self assetCollection];
      *(_DWORD *)buf = 138412546;
      long long v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Assets datasource contains a section, but it has 0 curated assets %@ %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
LABEL_11:
  id v8 = +[PXStorySettings sharedInstance];
  uint64_t v9 = [v8 curatedAssetsLimit];

  if ([v5 count] > v9 && v5 != 0) {
    PXDisplayAssetFetchResultSubfetchResultWithRange();
  }
  [(PXStoryRecipeManager *)self setCuratedAssets:v5];
  [(PXStoryRecipeManager *)self setUntruncatedCuratedAssets:0];
}

- (void)_invalidateCuratedAssets
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCuratedAssets];
}

- (void)_updateAllAssets
{
  id v3 = [(PXStoryRecipeManager *)self assetsDataSource];
  if ([v3 numberOfSections] < 1)
  {
    [(PXStoryRecipeManager *)self setAllAssets:0];
  }
  else
  {
    if (v3) {
      [v3 firstSectionIndexPath];
    }
    else {
      memset(v5, 0, sizeof(v5));
    }
    id v4 = [v3 uncuratedAssetsInSectionIndexPath:v5];
    [(PXStoryRecipeManager *)self setAllAssets:v4];
  }
}

- (void)_invalidateAllAssets
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAllAssets];
}

- (void)_updateOverallDurationInfo
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  [(PXStoryRecipeManager *)self overallDurationInfo];
  id v3 = [(PXStoryRecipeManager *)self persistableRecipeResult];
  id v4 = [v3 object];
  id v5 = [v4 recipe];

  if (v5)
  {
    [v5 overallDurationInfo];
    long long v23 = v18;
    long long v24 = v19;
    long long v25 = v20;
    long long v21 = v16;
    long long v22 = v17;
  }

  uint64_t v6 = [(PXStoryRecipeManager *)self curationLengthsResult];
  if (v6)
  {

    if ((unint64_t)v21 <= 1)
    {
      unint64_t v7 = [(PXStoryRecipeManager *)self defaultCurationLength];
      if (v7 > 4) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = qword_1AB35BC78[v7];
      }
      *(void *)&long long v21 = v8;
    }
  }
  uint64_t v9 = [(PXStoryRecipeManager *)self recipeAssetEdits];
  id v10 = v9;
  if (v9)
  {
    [v9 overallDurationInfo];
    if (v15)
    {
      id v11 = [(PXStoryRecipeManager *)self persistedRecipeAssetEdits];
      if (v10 == v11)
      {
      }
      else
      {
        long long v12 = v11;
        int v13 = [v10 isEqual:v11];

        if (!v13) {
          goto LABEL_16;
        }
      }
      [v10 overallDurationInfo];
      long long v23 = v18;
      long long v24 = v19;
      long long v25 = v20;
      long long v21 = v16;
      long long v22 = v17;
    }
  }
LABEL_16:
  v14[2] = v23;
  v14[3] = v24;
  v14[4] = v25;
  v14[0] = v21;
  v14[1] = v22;
  [(PXStoryRecipeManager *)self setOverallDurationInfo:v14];
}

- (void)_invalidateOverallDurationInfo
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOverallDurationInfo];
}

- (void)_updateChapterCollection
{
  id v4 = [(PXStoryRecipeManager *)self chapterCollectionManager];
  id v3 = [v4 chapterCollection];
  [(PXStoryRecipeManager *)self setChapterCollection:v3];
}

- (void)_invalidateChapterCollection
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChapterCollection];
}

- (void)_handleChapterCollectionResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__PXStoryRecipeManager__handleChapterCollectionResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __55__PXStoryRecipeManager__handleChapterCollectionResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setChapterCollectionResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHasFinalChapterCollectionBeenProduced:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 setChapterCollectionProgress:0];
  }
  return result;
}

- (void)_updateChapterCollectionResult
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryRecipeManager *)self curatedAssets];
  if (v3)
  {
    id v4 = [(PXStoryRecipeManager *)self keyAsset];

    if (v4)
    {
      v6[0] = 0;
      v6[1] = v6;
      void v6[2] = 0x3032000000;
      v6[3] = __Block_byref_object_copy__164009;
      v6[4] = __Block_byref_object_dispose__164010;
      void v6[5] = 0;
      [(PXStoryRecipeManager *)self defaultRequestOptions];
      [(PXStoryRecipeManager *)self requiresChapterCollectionSynchronously];
      objc_initWeak(&location, self);
      [(PXStoryRecipeManager *)self storyQueue];
      objc_claimAutoreleasedReturnValue();
      PXSyncCallbackBegin();
    }
  }
}

void __54__PXStoryRecipeManager__updateChapterCollectionResult__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __54__PXStoryRecipeManager__updateChapterCollectionResult__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    id v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeChapterCollection", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleChapterCollectionResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateChapterCollectionResult
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChapterCollectionResult];
}

- (void)_updateChapterCollectionProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v7 = [(PXStoryRecipeManager *)self chapterCollectionProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self configuration];
    uint64_t v6 = [v7 chapterCollectionProducerForConfiguration:v5];
    [(PXStoryRecipeManager *)self setChapterCollectionProducer:v6];
  }
}

- (void)_invalidateChapterCollectionProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateChapterCollectionProducer];
}

- (void)_handleDetailedSaliencyResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __54__PXStoryRecipeManager__handleDetailedSaliencyResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __54__PXStoryRecipeManager__handleDetailedSaliencyResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDetailedSaliencyResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHasFinalDetailedSaliencyBeenProduced:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 setDetailedSaliencyProgress:0];
  }
  return result;
}

- (void)_updateDetailedSaliency
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__164009;
  v4[4] = __Block_byref_object_dispose__164010;
  v4[5] = 0;
  [(PXStoryRecipeManager *)self defaultRequestOptions];
  [(PXStoryRecipeManager *)self requiresDetailedSaliencySynchronously];
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __47__PXStoryRecipeManager__updateDetailedSaliency__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __47__PXStoryRecipeManager__updateDetailedSaliency__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    id v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeDetailedSaliency", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleDetailedSaliencyResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateDetailedSaliency
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDetailedSaliency];
}

- (void)_updateDetailedSaliencyProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v7 = [(PXStoryRecipeManager *)self detailedSaliencyProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self configuration];
    uint64_t v6 = [v7 detailedSaliencyProducerForConfiguration:v5];
    [(PXStoryRecipeManager *)self setDetailedSaliencyProducer:v6];
  }
}

- (void)_invalidateDetailedSaliencyProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDetailedSaliencyProducer];
}

- (void)_handleMovieHighlightsResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __53__PXStoryRecipeManager__handleMovieHighlightsResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __53__PXStoryRecipeManager__handleMovieHighlightsResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMovieHighlightsResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setHaveFinalMovieHighlightsBeenProduced:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 setMovieHighlightsProgress:0];
  }
  return result;
}

- (void)_updateMovieHighlights
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__164009;
  v4[4] = __Block_byref_object_dispose__164010;
  v4[5] = 0;
  [(PXStoryRecipeManager *)self defaultRequestOptions];
  [(PXStoryRecipeManager *)self requiresMovieHighlightsSynchronously];
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __46__PXStoryRecipeManager__updateMovieHighlights__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __46__PXStoryRecipeManager__updateMovieHighlights__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    id v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeMovieHighlights", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleMovieHighlightsResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateMovieHighlights
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMovieHighlights];
}

- (void)_updateMovieHighlightsProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v7 = [(PXStoryRecipeManager *)self movieHighlightsProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self configuration];
    uint64_t v6 = [v7 movieHighlightsProducerWithConfiguration:v5];
    [(PXStoryRecipeManager *)self setMovieHighlightsProducer:v6];
  }
}

- (void)_invalidateMovieHighlightsProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMovieHighlightsProducer];
}

- (void)_handleCurationLengthsResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __53__PXStoryRecipeManager__handleCurationLengthsResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

void __53__PXStoryRecipeManager__handleCurationLengthsResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurationLengthsResult:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 40) object];
  objc_msgSend(*(id *)(a1 + 32), "setAvailableCurationLengths:", objc_msgSend(v2, "availableCurationLengths"));
  objc_msgSend(*(id *)(a1 + 32), "setDefaultCurationLength:", objc_msgSend(v2, "defaultCurationLength"));
  if (([*(id *)(a1 + 40) isDegraded] & 1) == 0) {
    [*(id *)(a1 + 32) setCurationLengthsProgress:0];
  }
}

- (void)_updateCurationLengths
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryRecipeManager *)self allAssets];
  if (v3)
  {
    id v4 = [(PXStoryRecipeManager *)self curatedAssets];

    if (v4)
    {
      v6[0] = 0;
      v6[1] = v6;
      void v6[2] = 0x3032000000;
      v6[3] = __Block_byref_object_copy__164009;
      v6[4] = __Block_byref_object_dispose__164010;
      void v6[5] = 0;
      objc_initWeak(&location, self);
      [(PXStoryRecipeManager *)self storyQueue];
      objc_claimAutoreleasedReturnValue();
      PXSyncCallbackBegin();
    }
  }
}

void __46__PXStoryRecipeManager__updateCurationLengths__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __46__PXStoryRecipeManager__updateCurationLengths__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    id v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeCurationLengths", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleCurationLengthsResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateCurationLengths
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurationLengths];
}

- (void)_updateAutoCurationProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v7 = [(PXStoryRecipeManager *)self autoCurationProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self configuration];
    uint64_t v6 = [v7 autoCurationProducerForConfiguration:v5];
    [(PXStoryRecipeManager *)self setAutoCurationProducer:v6];
  }
}

- (void)_invalidateAutoCurationProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAutoCurationProducer];
}

- (void)_handleSongsResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __43__PXStoryRecipeManager__handleSongsResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __43__PXStoryRecipeManager__handleSongsResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCuratedSongsResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setCuratedSongsProgress:0];
  }
  return result;
}

- (void)_updateCuratedSongs
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryRecipeManager *)self persistedSongResult];
  if (v3)
  {
    char v4 = [(PXStoryRecipeManager *)self finalizedProducers];

    if ((v4 & 0x10) == 0)
    {
      id v5 = [(PXStoryRecipeManager *)self initialSongResource];
      if (!v5
        || (BOOL v6 = [(PXStoryRecipeManager *)self wantsAutoEditResults], v5, v6))
      {
        v9[0] = 0;
        v9[1] = v9;
        v9[2] = 0x3032000000;
        v9[3] = __Block_byref_object_copy__164009;
        v9[4] = __Block_byref_object_dispose__164010;
        v9[5] = 0;
        [(PXStoryRecipeManager *)self defaultRequestOptions];
        [(PXStoryRecipeManager *)self requiresSongsSynchronously];
        objc_initWeak(&location, self);
        [(PXStoryRecipeManager *)self storyQueue];
        objc_claimAutoreleasedReturnValue();
        PXSyncCallbackBegin();
      }
      id v7 = +[PXStoryProducerResult nullResult];
      [(PXStoryRecipeManager *)self _handleSongsResult:v7];
    }
  }
}

void __43__PXStoryRecipeManager__updateCuratedSongs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __43__PXStoryRecipeManager__updateCuratedSongs__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    uint64_t v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeSongs", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleSongsResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateCuratedSongs
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCuratedSongs];
}

- (void)_updateCuratedSongsProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v7 = [(PXStoryRecipeManager *)self songsProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self configuration];
    uint64_t v6 = [v7 songsProducerForConfiguration:v5];
    [(PXStoryRecipeManager *)self setCuratedSongsProducer:v6];
  }
}

- (void)_invalidateCuratedSongsProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCuratedSongsProducer];
}

- (PXStorySongResource)initialSongResource
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 songsConfiguration];
  os_signpost_id_t v5 = [v4 currentAsset];

  if (!v5)
  {
    uint64_t v6 = [(PXStoryRecipeManager *)self persistedSongResult];
    os_signpost_id_t v5 = [v6 object];

    if (!v5)
    {
      id v7 = [(PXStoryRecipeManager *)self curatedSongs];
      if ([v7 count] < 1)
      {
        os_signpost_id_t v5 = 0;
      }
      else
      {
        os_signpost_id_t v5 = [v7 firstObject];
      }
    }
  }
  return (PXStorySongResource *)v5;
}

- (void)_handlePersistedSongResourceResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__PXStoryRecipeManager__handlePersistedSongResourceResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __59__PXStoryRecipeManager__handlePersistedSongResourceResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPersistedSongResult:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setPersistedSongProgress:0];
  }
  return result;
}

- (void)_updatePersistedSong
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__164009;
  v4[4] = __Block_byref_object_dispose__164010;
  v4[5] = 0;
  [(PXStoryRecipeManager *)self defaultRequestOptions];
  [(PXStoryRecipeManager *)self requiresSongsSynchronously];
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __44__PXStoryRecipeManager__updatePersistedSong__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __44__PXStoryRecipeManager__updatePersistedSong__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    uint64_t v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipePersistedSong", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handlePersistedSongResourceResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidatePersistedSong
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistedSong];
}

- (void)_updatePersistedSongProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v10 = [(PXStoryRecipeManager *)self songResourceProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self persistableRecipeResult];
    uint64_t v6 = [v5 object];
    id v7 = [v6 recipe];
    uint64_t v8 = [(PXStoryRecipeManager *)self configuration];
    os_signpost_type_t v9 = [v10 songResourceProducerForPersistableRecipe:v7 configuration:v8];
    [(PXStoryRecipeManager *)self setPersistedSongProducer:v9];
  }
}

- (void)_invalidatePersistedSongProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistedSongProducer];
}

- (void)_handlePersistableRecipeResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__PXStoryRecipeManager__handlePersistableRecipeResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __55__PXStoryRecipeManager__handlePersistableRecipeResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPersistableRecipeResult:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setHasInitialPersistableRecipeBeenProduced:1];
  uint64_t result = [*(id *)(a1 + 40) isDegraded];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setPersistableRecipeProgress:0];
  }
  return result;
}

- (void)_updatePersistableRecipe
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__164009;
  v4[4] = __Block_byref_object_dispose__164010;
  v4[5] = 0;
  [(PXStoryRecipeManager *)self defaultRequestOptions];
  [(PXStoryRecipeManager *)self requiresPersistableRecipeSynchronously];
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __48__PXStoryRecipeManager__updatePersistableRecipe__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __48__PXStoryRecipeManager__updatePersistableRecipe__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    id v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    id v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    id v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    id v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipePersistableRecipe", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handlePersistableRecipeResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidatePersistableRecipe
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistableRecipe];
}

- (void)_updatePersistableRecipeProducer
{
  id v3 = [(PXStoryRecipeManager *)self configuration];
  char v4 = [v3 options];

  if ((v4 & 2) == 0)
  {
    id v7 = [(PXStoryRecipeManager *)self persistableRecipeProducerFactory];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self configuration];
    uint64_t v6 = [v7 persistableRecipeProducerForConfiguration:v5];
    [(PXStoryRecipeManager *)self setPersistableRecipeProducer:v6];
  }
}

- (void)_invalidatePersistableRecipeProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePersistableRecipeProducer];
}

- (void)_handleAssetsResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __44__PXStoryRecipeManager__handleAssetsResult___block_invoke;
  v6[3] = &unk_1E5DC0ED0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXStoryRecipeManager *)self performChanges:v6];
}

uint64_t __44__PXStoryRecipeManager__handleAssetsResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAssetsResult:*(void *)(a1 + 40)];
}

- (void)_updateAssets
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = v6;
  void v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__164009;
  v6[4] = __Block_byref_object_dispose__164010;
  void v6[5] = 0;
  id v3 = [(PXStoryRecipeManager *)self configuration];
  BOOL v4 = ([v3 options] & 1) == 0;

  if (v4) {
    [(PXStoryRecipeManager *)self requiresAssetsSynchronously];
  }
  objc_initWeak(&location, self);
  [(PXStoryRecipeManager *)self storyQueue];
  objc_claimAutoreleasedReturnValue();
  PXSyncCallbackBegin();
}

void __37__PXStoryRecipeManager__updateAssets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 64));
  PXPerformWithSyncTokenOnQueue();
}

void __37__PXStoryRecipeManager__updateAssets__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    id v10 = *(id *)(a1 + 32);
    id v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v11;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    long long v12 = *(id *)(a1 + 32);
    id v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v13;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    *(_DWORD *)uint64_t v15 = 134217984;
    *(void *)&v15[4] = v6;
    uint64_t v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    uint64_t v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeAssets", v7, v15, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", *(_OWORD *)v15) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained _handleAssetsResult:*(void *)(a1 + 48)];
  }
}

- (void)_invalidateAssets
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssets];
}

- (void)_updateAssetsProducer
{
  id v5 = [(PXStoryRecipeManager *)self assetsProducerFactory];
  id v3 = [(PXStoryRecipeManager *)self configuration];
  id v4 = [v5 assetsProducerForConfiguration:v3];
  [(PXStoryRecipeManager *)self setAssetsProducer:v4];
}

- (void)_invalidateAssetsProducer
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetsProducer];
}

- (void)_updateAssetCollection
{
  id v4 = [(PXStoryRecipeManager *)self assetsDataSource];
  id v3 = [v4 firstAssetCollection];
  [(PXStoryRecipeManager *)self setAssetCollection:v3];
}

- (void)_invalidateAssetCollection
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetCollection];
}

- (void)_setNeedsUpdate
{
}

- (PXStoryAutoEditMomentsProvider)diagnosticsMomentsProvider
{
  id v2 = [(PXStoryRecipeManager *)self autoEditDecisionListsProducer];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 diagnosticsMomentsProvider];
  }
  else
  {
    id v3 = 0;
  }

  return (PXStoryAutoEditMomentsProvider *)v3;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__164009;
  long long v28 = __Block_byref_object_dispose__164010;
  id v29 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXStoryRecipeManager_diagnosticErrorsByComponentForHUDType___block_invoke;
  aBlock[3] = &unk_1E5DC1128;
  aBlock[4] = &v24;
  id v4 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  id v5 = [(PXStoryRecipeManager *)self assetsResult];
  uint64_t v6 = [v5 error];
  v4[2](v4, @"Assets", v6);

  uint64_t v7 = [(PXStoryRecipeManager *)self persistableRecipeResult];
  uint64_t v8 = [v7 error];
  v4[2](v4, @"Persistable Recipe", v8);

  os_signpost_type_t v9 = [(PXStoryRecipeManager *)self persistedSongResult];
  id v10 = [v9 error];
  v4[2](v4, @"Persisted Song", v10);

  uint64_t v11 = [(PXStoryRecipeManager *)self curatedSongsResult];
  long long v12 = [v11 error];
  v4[2](v4, @"Curated Songs", v12);

  uint64_t v13 = [(PXStoryRecipeManager *)self initialStyleResult];
  long long v14 = [v13 error];
  v4[2](v4, @"Initial Style", v14);

  uint64_t v15 = [(PXStoryRecipeManager *)self autoEditStylesResult];
  uint64_t v16 = [v15 error];
  v4[2](v4, @"AE Styles", v16);

  long long v17 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
  long long v18 = [v17 error];
  v4[2](v4, @"Initial EDL", v18);

  long long v19 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
  long long v20 = [v19 error];
  v4[2](v4, @"Auto EDL", v20);

  long long v21 = (void *)[(id)v25[5] copy];
  _Block_object_dispose(&v24, 8);

  return v21;
}

uint64_t __62__PXStoryRecipeManager_diagnosticErrorsByComponentForHUDType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:a3 forKeyedSubscript:a2];
}

- (id)_shortDescriptionOfPersistableRecipe:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PXStoryRecipeManager__shortDescriptionOfPersistableRecipe___block_invoke;
  aBlock[3] = &unk_1E5DD2D40;
  id v5 = v4;
  id v14 = v5;
  uint64_t v6 = (char *)_Block_copy(aBlock);
  uint64_t v7 = (void (**)(void *, uint64_t, __CFString *))(v6 + 16);
  (*((void (**)(char *, uint64_t, __CFString *))v6 + 2))(v6, [v3 numberOfAssets], @"assets");
  uint64_t v8 = [v3 currentStyle];
  os_signpost_type_t v9 = @"Y\n";
  if (!v8) {
    os_signpost_type_t v9 = @"N\n";
  }
  [v5 appendFormat:@"Custom Style?: %@", v9];

  (*v7)(v6, [v3 numberOfPresentations], @"presentations");
  id v10 = [v3 autoEditDecisionLists];
  (*v7)(v6, [v10 count], @"AEDLs");

  if (v3) {
    [v3 overallDurationInfo];
  }
  objc_msgSend(v5, "appendFormat:", @"v%li.%li", objc_msgSend(v3, "majorVersion"), objc_msgSend(v3, "minorVersion"));
  uint64_t v11 = (void *)[v5 copy];

  return v11;
}

uint64_t __61__PXStoryRecipeManager__shortDescriptionOfPersistableRecipe___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    return [*(id *)(result + 32) appendFormat:@"%li %@\n", a2, a3];
  }
  return result;
}

- (id)_diagnosticTextForGenericHUDAtDisplaySize:(CGSize)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (_diagnosticTextForGenericHUDAtDisplaySize__onceToken != -1) {
    dispatch_once(&_diagnosticTextForGenericHUDAtDisplaySize__onceToken, &__block_literal_global_356_164209);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_2;
  aBlock[3] = &unk_1E5DC1030;
  id v5 = v4;
  id v39 = v5;
  uint64_t v6 = (void (**)(void *, __CFString *, void *, void *, void *))_Block_copy(aBlock);
  uint64_t v7 = [(PXStoryRecipeManager *)self assetsProgress];
  uint64_t v8 = [(PXStoryRecipeManager *)self assetsResult];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_3;
  v37[3] = &unk_1E5DC1058;
  v37[4] = self;
  v6[2](v6, @"Assets", v7, v8, v37);

  os_signpost_type_t v9 = [(PXStoryRecipeManager *)self persistableRecipeProgress];
  id v10 = [(PXStoryRecipeManager *)self persistableRecipeResult];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_4;
  v36[3] = &unk_1E5DC1080;
  v36[4] = self;
  v6[2](v6, @"Previously Persisted Recipe", v9, v10, v36);

  uint64_t v11 = [(PXStoryRecipeManager *)self persistedSongProgress];
  long long v12 = [(PXStoryRecipeManager *)self persistedSongResult];
  v6[2](v6, @"Persisted Song", v11, v12, __block_literal_global_426);

  uint64_t v13 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListProgress];
  id v14 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
  v6[2](v6, @"Initial EDL", v13, v14, __block_literal_global_435_164211);

  uint64_t v15 = [(PXStoryRecipeManager *)self initialStyleProgress];
  uint64_t v16 = [(PXStoryRecipeManager *)self initialStyleResult];
  v6[2](v6, @"Persisted Style", v15, v16, __block_literal_global_447_164213);

  long long v17 = [(PXStoryRecipeManager *)self curatedSongsProgress];
  long long v18 = [(PXStoryRecipeManager *)self curatedSongsResult];
  v6[2](v6, @"Curated Songs", v17, v18, __block_literal_global_456);

  long long v19 = [(PXStoryRecipeManager *)self autoEditDecisionListsProgress];
  long long v20 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
  v6[2](v6, @"Auto EDLs", v19, v20, __block_literal_global_464);

  long long v21 = [(PXStoryRecipeManager *)self autoEditStylesProgress];
  long long v22 = [(PXStoryRecipeManager *)self autoEditStylesResult];
  v6[2](v6, @"Auto Edit Styles", v21, v22, __block_literal_global_472);

  long long v23 = PXStoryComponentAttributesDescription([(PXStoryRecipeManager *)self recipeAttributes]);
  [v5 appendFormat:@"\nAttributes: %@\n", v23];

  uint64_t v24 = [(PXStoryRecipeManager *)self loadingReadyForPlaybackDate];

  if (v24)
  {
    long long v25 = (void *)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter;
    uint64_t v26 = [(PXStoryRecipeManager *)self loadingReadyForPlaybackDate];
    long long v27 = [(PXStoryRecipeManager *)self loadingStartDate];
    [v26 timeIntervalSinceDate:v27];
    long long v28 = objc_msgSend(v25, "stringFromTimeInterval:");
    [v5 appendFormat:@"\nReady For Playback In: %@\n", v28];
  }
  id v29 = [(PXStoryRecipeManager *)self loadingFinalDate];

  if (v29)
  {
    v30 = (void *)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter;
    uint64_t v31 = [(PXStoryRecipeManager *)self loadingFinalDate];
    v32 = [(PXStoryRecipeManager *)self loadingStartDate];
    [v31 timeIntervalSinceDate:v32];
    v33 = objc_msgSend(v30, "stringFromTimeInterval:");
    [v5 appendFormat:@"\nFinal In: %@\n", v33];
  }
  v34 = (void *)[v5 copy];

  return v34;
}

void __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v29 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = [v10 object];
  long long v28 = v11;
  if (v12)
  {
    uint64_t v13 = (*((void (**)(id, void *))v11 + 2))(v11, v12);
    id v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];

    if ([(__CFString *)v14 hasSuffix:@"\n"])
    {
      uint64_t v15 = -[__CFString substringWithRange:](v14, "substringWithRange:", 0, [(__CFString *)v14 length] - 1);

      id v14 = (__CFString *)v15;
    }
  }
  else
  {
    id v14 = @"n/a";
  }
  if ([v10 flags]) {
    uint64_t v16 = @"Degraded";
  }
  else {
    uint64_t v16 = @"Final";
  }
  [v10 productionDuration];
  long long v17 = objc_msgSend((id)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter, "stringFromTimeInterval:");
  long long v18 = [v10 error];
  if (v18)
  {
    long long v19 = @"❌";
  }
  else
  {
    long long v19 = @"🔳";
    if (!v9 && v12)
    {
      uint64_t v24 = *(void **)(a1 + 32);
      long long v20 = (id *)(a1 + 32);
      [v24 appendFormat:@"%@:\n", v29];
      long long v19 = @"✅";
LABEL_16:
      [*v20 appendFormat:@"\t%@\n", v14];
      goto LABEL_17;
    }
  }
  long long v21 = *(void **)(a1 + 32);
  long long v20 = (id *)(a1 + 32);
  [v21 appendFormat:@"%@:\n", v29];
  if (!v9) {
    goto LABEL_16;
  }
  id v22 = *v20;
  [v9 fractionCompleted];
  objc_msgSend(v22, "appendFormat:", @"\tProgress: %0.1f%%\n", v23 * 100.0);
  if (v12) {
    goto LABEL_16;
  }
LABEL_17:
  [*v20 appendFormat:@"\t%@ %@ %@\n", v19, v16, v17];
  if (v18)
  {
    id v25 = *v20;
    uint64_t v26 = [v18 localizedDescription];
    long long v27 = PXStoryErrorDetailsDescription(v18);
    [v25 appendFormat:@"\tError: %@ / %@\n", v26, v27];
  }
  [*v20 appendString:@"\n"];
}

uint64_t __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedAssetsCountHUDDescription];
  uint64_t v3 = [v2 length];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = [*(id *)(a1 + 32) assetCollection];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [*(id *)(a1 + 32) assetCollection];
      uint64_t v8 = [v7 photoLibrary];
      id v9 = [v8 librarySpecificFetchOptions];

      id v10 = [MEMORY[0x1E4F38EB8] fetchCustomUserAssetsInMemory:v7 options:v9];
      uint64_t v11 = [v10 count];

      long long v12 = [MEMORY[0x1E4F38EB8] fetchUserCuratedAssetsInMemory:v7];
      uint64_t v13 = [v12 count];

      id v14 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v7];
      uint64_t v15 = [v14 count];

      uint64_t v16 = [NSString stringWithFormat:@"CustomUser: %lu, UserCurated: %lu, RawCurated: %lu", v11, v13, v15];
      [v4 addObject:v16];
    }
    long long v17 = NSString;
    long long v18 = [*(id *)(a1 + 32) curatedAssets];
    long long v19 = objc_msgSend(v17, "stringWithFormat:", @"Curated: %lu", objc_msgSend(v18, "count"));
    [v4 addObject:v19];

    long long v20 = NSString;
    long long v21 = [*(id *)(a1 + 32) allAssets];
    id v22 = objc_msgSend(v20, "stringWithFormat:", @"All: %lu", objc_msgSend(v21, "count"));
    [v4 addObject:v22];

    double v23 = [v4 componentsJoinedByString:@"\n"];
    [*(id *)(a1 + 32) setCachedAssetsCountHUDDescription:v23];
  }
  uint64_t v24 = *(void **)(a1 + 32);
  return [v24 cachedAssetsCountHUDDescription];
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 recipe];
  uint64_t v6 = [v4 _shortDescriptionOfPersistableRecipe:v5];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [v3 miroInfo];
  LODWORD(v6) = [v8 containsAnyData];

  if (v6)
  {
    id v9 = [v3 miroInfo];
    id v10 = [v9 description];
    [v7 appendFormat:@"\nMiro: %@", v10];
  }
  return v7;
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 count];

  uint64_t v6 = objc_msgSend(v4, "initWithFormat:", @"Count: %li", v5);
  return v6;
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 count];

  uint64_t v6 = objc_msgSend(v4, "initWithFormat:", @"Count: %li", v5);
  return v6;
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 curatedAudioAssets];

  uint64_t v6 = objc_msgSend(v4, "initWithFormat:", @"Curated Songs: %li", objc_msgSend(v5, "count"));
  return v6;
}

id __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = [a2 firstObject];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [v2 originalColorGradeCategory];
  [v2 customColorGradeKind];
  uint64_t v5 = PFStoryColorGradeKindToString();
  uint64_t v6 = [v2 songResource];
  uint64_t v7 = objc_msgSend(v6, "px_storyResourceSongAsset");
  uint64_t v8 = PXAudioAssetShortDescription(v7);
  [v3 appendFormat:@"Persisted Style:\n\t%@\n\t%@\n\t%@\n", v4, v5, v8];

  id v9 = (void *)[v3 copy];
  return v9;
}

__CFString *__66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 firstObject];
  if (v2) {
    id v3 = @"Loaded";
  }
  else {
    id v3 = @"Not Loaded";
  }
  id v4 = v3;

  return v4;
}

__CFString *__66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke_5(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = objc_msgSend(a2, "px_storyResourceSongAsset");
    PXAudioAssetShortDescription(v2);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = @"None";
  }
  return v3;
}

void __66__PXStoryRecipeManager__diagnosticTextForGenericHUDAtDisplaySize___block_invoke()
{
  v0 = objc_alloc_init(PXStoryDurationFormatter);
  v1 = (void *)_diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter;
  _diagnosticTextForGenericHUDAtDisplaySize__productionDurationFormatter = (uint64_t)v0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (-[PXStoryAutoEditDecisionListsProducer handlesDiagnosticTextForHUDType:](self->_autoEditDecisionListsProducer, "handlesDiagnosticTextForHUDType:"))-[PXStoryAutoEditDecisionListsProducer diagnosticTextForHUDType:displaySize:](self->_autoEditDecisionListsProducer, "diagnosticTextForHUDType:displaySize:", a3, width, height); {
  else
  }
  uint64_t v8 = -[PXStoryRecipeManager _diagnosticTextForGenericHUDAtDisplaySize:](self, "_diagnosticTextForGenericHUDAtDisplaySize:", width, height);
  return v8;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v7 = -[PXStoryRecipeManager diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", 3, *MEMORY[0x1E4F1DB30], v6);
  if (v7) {
    [v4 addAttachmentWithText:v7 name:@"recipe_manager_diagnostic"];
  }
  uint64_t v8 = -[PXStoryRecipeManager diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", 9, v5, v6);
  if (v8) {
    [v4 addAttachmentWithText:v8 name:@"moments_diagnostic"];
  }
  v48 = (void *)v8;
  id v9 = [(PXStoryRecipeManager *)self diagnosticsMomentsProvider];
  uint64_t v10 = [v9 _diagnosticSwiftCodeForMomentsUnitTest];

  if (v10) {
    [v4 addAttachmentWithSwiftCode:v10 name:@"moments_testcase"];
  }
  uint64_t v11 = -[PXStoryRecipeManager diagnosticTextForHUDType:displaySize:](self, "diagnosticTextForHUDType:displaySize:", 8, v5, v6);
  if (v11) {
    [v4 addAttachmentWithText:v11 name:@"autoedit_diagnostic"];
  }
  v46 = (void *)v11;
  long long v12 = [(PXStoryRecipeManager *)self persistableRecipeResult];
  uint64_t v13 = [v12 object];
  uint64_t v14 = [v13 recipe];

  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F8CDB8]);
    uint64_t v16 = [v15 archivedJSONDataWithRecipe:v14 options:3];
    [v4 addAttachmentWithData:v16 name:@"recipe.json"];
  }
  v47 = (void *)v10;
  v50 = (void *)v7;
  long long v17 = [(PXStoryRecipeManager *)self initialAutoEditDecisionListResult];
  long long v18 = [v17 object];
  long long v19 = [v18 firstObject];

  unint64_t v20 = 0x1E4F29000uLL;
  v45 = (void *)v14;
  if (v19)
  {
    long long v21 = NSString;
    id v22 = [v19 song];
    [v22 pace];
    double v23 = PFStoryRecipeSongPaceDescription();
    uint64_t v24 = [v19 colorGradeCategory];
    id v25 = [v21 stringWithFormat:@"autoEdit_decisionList_%d_%@_%@", 0, v23, v24];

    uint64_t v26 = [v19 diagnosticDescription];
    [v4 addAttachmentWithText:v26 name:v25];

    long long v27 = [v19 decisionPapertrail];
    [v4 addAttachmentWithText:v27 name:@"autoedit_papertrail"];

    uint64_t v53 = 1;
  }
  else
  {
    uint64_t v53 = 0;
  }
  v44 = v19;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v49 = self;
  long long v28 = [(PXStoryRecipeManager *)self autoEditDecisionListsResult];
  id v29 = [v28 object];

  id obj = v29;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v52 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        v33 = v4;
        if (*(void *)v55 != v52) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v35 = *(void **)(v20 + 24);
        v36 = [v34 song];
        [v36 pace];
        PFStoryRecipeSongPaceDescription();
        v38 = unint64_t v37 = v20;
        id v39 = [v34 colorGradeCategory];
        v40 = [v35 stringWithFormat:@"autoEdit_decisionList_%d_%@_%@", v53 + i, v38, v39];

        unint64_t v20 = v37;
        v41 = [v34 diagnosticDescription];
        id v4 = v33;
        [v33 addAttachmentWithText:v41 name:v40];
      }
      uint64_t v53 = (v53 + i);
      uint64_t v31 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v31);
  }

  v42 = [(PXStoryRecipeManager *)v49 autoEditDecisionListsProducer];
  [v4 addSubprovider:v42];

  v43 = [(PXStoryRecipeManager *)v49 recipe];
  [v4 addSubprovider:v43];
}

- (void)setAdditionalAutoEditDecisionListsBySong:(id)a3
{
  uint64_t v8 = (NSDictionary *)a3;
  id v4 = self->_additionalAutoEditDecisionListsBySong;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      double v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      additionalAutoEditDecisionListsBySong = self->_additionalAutoEditDecisionListsBySong;
      self->_additionalAutoEditDecisionListsBySong = v6;

      [(PXStoryRecipeManager *)self _invalidateRecipe];
    }
  }
}

- (void)_handleAdditionalAutoEditDecisionListsResult:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(PXStoryRecipeManager *)self additionalAutoEditDecisionListsBySong];
  double v6 = (void *)[v5 mutableCopy];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v17 = v4;
  uint64_t v7 = [v4 object];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [v12 song];
        if (v13)
        {
          [v6 setObject:v12 forKeyedSubscript:v13];
        }
        else
        {
          uint64_t v14 = PLStoryGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = self;
            __int16 v27 = 2112;
            long long v28 = v12;
            _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "%@ received additional AEDL with no song! %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__PXStoryRecipeManager__handleAdditionalAutoEditDecisionListsResult___block_invoke;
  v18[3] = &unk_1E5DC1008;
  v18[4] = self;
  id v19 = v17;
  id v20 = v6;
  id v15 = v6;
  id v16 = v17;
  [(PXStoryRecipeManager *)self performChanges:v18];
}

void __69__PXStoryRecipeManager__handleAdditionalAutoEditDecisionListsResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleResult:*(void *)(a1 + 40) forProducer:1024];
  id v2 = (id)[*(id *)(a1 + 48) copy];
  [*(id *)(a1 + 32) setAdditionalAutoEditDecisionListsBySong:v2];
}

- (void)_updateAdditionalAutoEditDecisionLists
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXStoryRecipeManager *)self additionalSongs];
  if ([v3 count])
  {
    objc_initWeak(&location, self);
    [(PXStoryRecipeManager *)self storyQueue];
    objc_claimAutoreleasedReturnValue();
    PXSyncCallbackBegin();
  }
}

void __62__PXStoryRecipeManager__updateAdditionalAutoEditDecisionLists__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 56));
  PXPerformWithSyncTokenOnQueue();
}

void __62__PXStoryRecipeManager__updateAdditionalAutoEditDecisionLists__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  switch(v2)
  {
    case 2:
      uint64_t v10 = *(id *)(a1 + 32);
      id v4 = v10;
      os_signpost_id_t v5 = *(void *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
        goto LABEL_15;
      }
      uint64_t v11 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v11;
      uint64_t v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
      uint64_t v8 = v4;
      os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_14;
    case 1:
      long long v12 = *(id *)(a1 + 32);
      id v4 = v12;
      os_signpost_id_t v5 = *(void *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
        goto LABEL_15;
      }
      uint64_t v13 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v13;
      uint64_t v7 = "Context=%{signpost.telemetry:string2}lu ";
      goto LABEL_13;
    case 0:
      id v3 = *(id *)(a1 + 32);
      id v4 = v3;
      os_signpost_id_t v5 = *(void *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v3)) {
        goto LABEL_15;
      }
      uint64_t v6 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v6;
      uint64_t v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
      uint64_t v8 = v4;
      os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeAdditionalAutoEditDecisionLists", v7, (uint8_t *)&v15, 0xCu);
LABEL_15:

      break;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAdditionalAutoEditDecisionListsResult:*(void *)(a1 + 48)];
}

- (void)_invalidateAdditionalAutoEditDecisionLists
{
  id v2 = [(PXStoryRecipeManager *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAdditionalAutoEditDecisionLists];
}

- (void)ensureAutoEditDecisionListForSong:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = [(PXStoryRecipeManager *)self additionalSongs];
  if (([v5 containsObject:v4] & 1) == 0)
  {
    uint64_t v6 = [v5 setByAddingObject:v4];
    [(PXStoryRecipeManager *)self setAdditionalSongs:v6];

    objc_initWeak(&location, self);
    [(PXStoryRecipeManager *)self storyQueue];
    objc_claimAutoreleasedReturnValue();
    PXSyncCallbackBegin();
  }
}

void __58__PXStoryRecipeManager_ensureAutoEditDecisionListForSong___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v4, (id *)(a1 + 56));
  PXPerformWithSyncTokenOnQueue();
}

void __58__PXStoryRecipeManager_ensureAutoEditDecisionListForSong___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  switch(v2)
  {
    case 2:
      uint64_t v10 = *(id *)(a1 + 32);
      id v4 = v10;
      os_signpost_id_t v5 = *(void *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
        goto LABEL_15;
      }
      uint64_t v11 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v11;
      uint64_t v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
      uint64_t v8 = v4;
      os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_14;
    case 1:
      long long v12 = *(id *)(a1 + 32);
      id v4 = v12;
      os_signpost_id_t v5 = *(void *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
        goto LABEL_15;
      }
      uint64_t v13 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v13;
      uint64_t v7 = "Context=%{signpost.telemetry:string2}lu ";
      goto LABEL_13;
    case 0:
      id v3 = *(id *)(a1 + 32);
      id v4 = v3;
      os_signpost_id_t v5 = *(void *)(a1 + 72);
      if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v3)) {
        goto LABEL_15;
      }
      uint64_t v6 = *(void *)(a1 + 64);
      int v15 = 134217984;
      uint64_t v16 = v6;
      uint64_t v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
      uint64_t v8 = v4;
      os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeSingleAdditionalAutoEditDecisionList", v7, (uint8_t *)&v15, 0xCu);
LABEL_15:

      break;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAdditionalAutoEditDecisionListsResult:*(void *)(a1 + 48)];
}

- (void)applyKeyAsset:(id)a3
{
  id v4 = a3;
  id v6 = [(PXStoryRecipeManager *)self recipeAssetEdits];
  os_signpost_id_t v5 = (void *)[v6 copyWithKeyAsset:v4];

  [(PXStoryRecipeManager *)self setRecipeAssetEdits:v5];
}

- (void)applyManuallyRemovedAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_signpost_id_t v5 = [(PXStoryRecipeManager *)self curatedAssets];
  id v6 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v5, "indexOfObject:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
          [v6 removeIndex:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  PXDisplayAssetFetchResultSubfetchResultWithIndexSet();
}

- (void)_applyManuallyCuratedAssets:(id)a3 setAsCustomUserAssets:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_manuallyCuratedAssets, a3);
  long long v8 = *MEMORY[0x1E4F8D280];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 16);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 48);
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 32);
  long long v21 = v9;
  uint64_t v22 = *(void *)(MEMORY[0x1E4F8D280] + 64);
  long long v18 = v8;
  uint64_t v10 = [(PXStoryRecipeManager *)self recipeAssetEdits];
  uint64_t v17 = 2;
  uint64_t v11 = (void *)[v10 copyWithOverallDurationInfo:&v17 userCuratedAssets:v7];

  if (v4)
  {
    uint64_t v12 = [v11 copyWithCustomUserAssets:v7];

    uint64_t v11 = (void *)v12;
  }
  long long v13 = [(PXStoryRecipeManager *)self assetsDataSource];
  long long v14 = [v13 keyAsset];

  if ([v7 count] >= 1 && v14 && (objc_msgSend(v7, "containsObject:", v14) & 1) == 0)
  {
    long long v15 = [v7 objectAtIndexedSubscript:0];
    uint64_t v16 = [v11 copyWithKeyAsset:v15];

    uint64_t v11 = (void *)v16;
  }
  [(PXStoryRecipeManager *)self setRecipeAssetEdits:v11];
}

- (void)applyCustomUserAssets:(id)a3
{
}

- (void)applyManuallyCuratedAssets:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(PXStoryRecipeManager *)self recipeAssetEdits];
  os_signpost_id_t v5 = [v4 customUserAssetsEdit];
  id v6 = [v5 assets];
  BOOL v7 = [v6 count] > 0;

  [(PXStoryRecipeManager *)self _applyManuallyCuratedAssets:v8 setAsCustomUserAssets:v7];
}

- (void)_handleCuratedAssetsResult:(id)a3 targetOverallDurationInfo:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 object];

  if (v7)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = (uint64_t)__77__PXStoryRecipeManager__handleCuratedAssetsResult_targetOverallDurationInfo___block_invoke;
    v21[3] = (uint64_t)&unk_1E5DC0F90;
    v21[4] = (uint64_t)self;
    long long v8 = *(_OWORD *)&a4->var1.var1.var3;
    long long v25 = *(_OWORD *)&a4->var1.var1.var0;
    long long v26 = v8;
    long long v27 = *(_OWORD *)&a4->var1.var2.var1;
    long long v9 = *(_OWORD *)&a4->var1.var0.var1;
    long long v23 = *(_OWORD *)&a4->var0;
    long long v24 = v9;
    id v22 = v6;
    [(PXStoryRecipeManager *)self performChanges:v21];
  }
  else
  {
    uint64_t v10 = [v6 error];
    uint64_t v17 = v10;
    if (v10)
    {
      id v18 = v10;
    }
    else
    {
      PXStoryErrorCreateWithCodeDebugFormat(16, @"Target Duration Curation Failed", v11, v12, v13, v14, v15, v16, v21[0]);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v19 = v18;

    long long v20 = [(PXStoryRecipeManager *)self errorReporter];
    [v20 setError:v19 forComponent:@"TargetDurationCuration"];
  }
}

void __77__PXStoryRecipeManager__handleCuratedAssetsResult_targetOverallDurationInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) recipeAssetEdits];
  id v3 = [*(id *)(a1 + 40) object];
  long long v4 = *(_OWORD *)(a1 + 96);
  void v8[2] = *(_OWORD *)(a1 + 80);
  v8[3] = v4;
  v8[4] = *(_OWORD *)(a1 + 112);
  long long v5 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v5;
  id v6 = (void *)[v2 copyWithOverallDurationInfo:v8 userCuratedAssets:v3];

  BOOL v7 = (void *)[v6 copyWithCustomUserAssets:0];
  [*(id *)(a1 + 32) setRecipeAssetEdits:v7];
}

- (void)setAssetsAutoCurationProgress:(id)a3
{
  long long v5 = (NSProgress *)a3;
  p_assetsAutoCurationProgress = &self->_assetsAutoCurationProgress;
  if (*p_assetsAutoCurationProgress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)*p_assetsAutoCurationProgress cancel];
    objc_storeStrong((id *)p_assetsAutoCurationProgress, a3);
    long long v5 = v7;
  }
}

- (void)applyTargetOverallDurationInfo:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t var0 = a3->var0;
  if (!a3->var0)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXStoryRecipeManager.m", 1183, @"Invalid parameter not satisfying: %@", @"targetOverallDurationInfo.kind != PFStoryOverallDurationKindUndefined" object file lineNumber description];

    int64_t var0 = a3->var0;
  }
  if (var0 != 2)
  {
    +[PXProgressIndicatorAlertController beginShowingModalProgressWithConfiguration:0];
    objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    [(PXStoryRecipeManager *)self storyQueue];
    objc_claimAutoreleasedReturnValue();
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3032000000;
    v10[3] = __Block_byref_object_copy__164009;
    void v10[4] = __Block_byref_object_dispose__164010;
    v10[5] = 0;
    [(PXStoryRecipeManager *)self storyQueue];
    objc_claimAutoreleasedReturnValue();
    PXSyncCallbackBegin();
  }
  id v6 = [(PXStoryRecipeManager *)self manuallyCuratedAssets];

  if (!v6) {
    PXAssertGetLog();
  }
  id v9 = [(PXStoryRecipeManager *)self manuallyCuratedAssets];
  [(PXStoryRecipeManager *)self applyCustomUserAssets:v9];
}

void __55__PXStoryRecipeManager_applyTargetOverallDurationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 88);
  *(id *)(a1 + 48);
  v3;
  objc_copyWeak(&v5, (id *)(a1 + 72));
  long long v4 = *(_OWORD *)(a1 + 136);
  long long v8 = *(_OWORD *)(a1 + 120);
  long long v9 = v4;
  long long v10 = *(_OWORD *)(a1 + 152);
  long long v11 = *(_OWORD *)(a1 + 168);
  long long v7 = *(_OWORD *)(a1 + 104);
  PXPerformWithSyncTokenOnQueue();
}

void __55__PXStoryRecipeManager_applyTargetOverallDurationInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _ProducerRequestEnd(*(void **)(a1 + 40), *(void **)(a1 + 48));
  if (v2 == 2)
  {
    long long v10 = *(id *)(a1 + 32);
    long long v4 = v10;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10)) {
      goto LABEL_15;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    LODWORD(v18[0]) = 134217984;
    *(void *)((char *)v18 + 4) = v11;
    long long v7 = "Context=%{signpost.telemetry:string2}lu  enableTelemetry=YES ";
LABEL_13:
    long long v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_14;
  }
  if (v2 == 1)
  {
    uint64_t v12 = *(id *)(a1 + 32);
    long long v4 = v12;
    os_signpost_id_t v5 = *(void *)(a1 + 80);
    if (v5 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v12)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)(a1 + 72);
    LODWORD(v18[0]) = 134217984;
    *(void *)((char *)v18 + 4) = v13;
    long long v7 = "Context=%{signpost.telemetry:string2}lu ";
    goto LABEL_13;
  }
  if (v2) {
    goto LABEL_16;
  }
  id v3 = *(id *)(a1 + 32);
  long long v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 80);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 72);
    LODWORD(v18[0]) = 134217984;
    *(void *)((char *)v18 + 4) = v6;
    long long v7 = "Context=%{signpost.telemetry:string2}lu degraded result";
    long long v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_EVENT;
LABEL_14:
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, v9, v5, "PXStoryRecipeCuratedAssets", v7, (uint8_t *)v18, 0xCu);
  }
LABEL_15:

LABEL_16:
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "isCancelled", v18[0]) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v15 = *(void *)(a1 + 48);
    long long v16 = *(_OWORD *)(a1 + 104);
    long long v17 = *(_OWORD *)(a1 + 136);
    v18[2] = *(_OWORD *)(a1 + 120);
    v18[3] = v17;
    v18[4] = *(_OWORD *)(a1 + 152);
    v18[0] = *(_OWORD *)(a1 + 88);
    v18[1] = v16;
    [WeakRetained _handleCuratedAssetsResult:v15 targetOverallDurationInfo:v18];
  }
}

- (void)setPersistedRecipeAssetEdits:(id)a3
{
  os_signpost_id_t v5 = (PXStoryRecipeAssetEdits *)a3;
  p_persistedRecipeAssetEdits = &self->_persistedRecipeAssetEdits;
  long long v7 = self->_persistedRecipeAssetEdits;
  if (v7 == v5)
  {
  }
  else
  {
    long long v8 = v7;
    BOOL v9 = [(PXStoryRecipeAssetEdits *)v7 isEqual:v5];

    if (!v9)
    {
      long long v10 = [(PXStoryRecipeAssetEdits *)*p_persistedRecipeAssetEdits userCuratedAssets];
      uint64_t v11 = [(PXStoryRecipeAssetEdits *)v5 userCuratedAssets];
      int ResultsEqual = _areFetchResultsEqual(v10, v11);

      if (ResultsEqual)
      {
        id v13 = [(PXStoryRecipeAssetEdits *)*p_persistedRecipeAssetEdits keyAsset];
        id v14 = [(PXStoryRecipeAssetEdits *)v5 keyAsset];
        if (v13 == v14)
        {

          objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, a3);
          [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
          goto LABEL_11;
        }
        uint64_t v15 = v14;
        char v16 = [v13 isEqual:v14];

        objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, a3);
        [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
        if (v16) {
          goto LABEL_11;
        }
      }
      else
      {
        objc_storeStrong((id *)&self->_persistedRecipeAssetEdits, a3);
        [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
      }
      long long v17 = [(PXStoryRecipeManager *)self assetsDataSourceManager];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__PXStoryRecipeManager_setPersistedRecipeAssetEdits___block_invoke;
      v18[3] = &unk_1E5DD1458;
      v18[4] = self;
      [v17 performChanges:v18];
    }
  }
LABEL_11:
}

void __53__PXStoryRecipeManager_setPersistedRecipeAssetEdits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assetCollection];
  [v3 refreshResultsForAssetCollection:v4];
}

- (void)setRecipeAssetEdits:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = (PXStoryRecipeAssetEdits *)a3;
  uint64_t v6 = self->_recipeAssetEdits;
  if (v6 == v5)
  {
  }
  else
  {
    long long v7 = v6;
    BOOL v8 = [(PXStoryRecipeAssetEdits *)v6 isEqual:v5];

    if (!v8)
    {
      objc_storeStrong((id *)&self->_recipeAssetEdits, a3);
      [(PXStoryRecipeManager *)self signalChange:64];
      BOOL v9 = [(PXStoryRecipeManager *)self log];
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          int v20 = 134217984;
          uint64_t v21 = [(PXStoryRecipeManager *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PXStoryRecipeManagerChangedAssetEdits", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
        }
      }

      uint64_t v12 = v9;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
          int v20 = 134218242;
          uint64_t v21 = v15;
          __int16 v22 = 2114;
          long long v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryRecipeManagerChangedAssetEdits", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

      char v16 = v12;
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v18 = v17;
        if (os_signpost_enabled(v16))
        {
          uint64_t v19 = [(PXStoryRecipeManager *)self logContext];
          int v20 = 134218242;
          uint64_t v21 = v19;
          __int16 v22 = 2114;
          long long v23 = v5;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PXStoryRecipeManagerChangedAssetEdits", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
        }
      }

      [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
    }
  }
}

- (void)_handleResult:(id)a3 forProducer:(unint64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PXStoryRecipeManager *)self setProducersWithInitialResults:[(PXStoryRecipeManager *)self producersWithInitialResults] | a4];
  if ([v6 isDegraded]) {
    unint64_t v7 = [(PXStoryRecipeManager *)self finalizedProducers] & ~a4;
  }
  else {
    unint64_t v7 = [(PXStoryRecipeManager *)self finalizedProducers] | a4;
  }
  [(PXStoryRecipeManager *)self setFinalizedProducers:v7];
  uint64_t v8 = [v6 error];
  BOOL v9 = (void *)v8;
  if (v8)
  {
    os_signpost_id_t v10 = (void *)MEMORY[0x1E4F56658];
    uint64_t v18 = *MEMORY[0x1E4F56568];
    v19[0] = v8;
    os_signpost_id_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v10 sendEvent:@"com.apple.photos.memory.interactiveMemoryRecipeErrorOccurred" withPayload:v11];
  }
  uint64_t v12 = [(PXStoryRecipeManager *)self errorReporter];
  os_signpost_id_t v13 = PXStoryProducerName(a4);
  [v12 setError:v9 forComponent:v13];

  os_signpost_id_t v14 = [(PXStoryRecipeManager *)self _monitorForProducer:a4];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__PXStoryRecipeManager__handleResult_forProducer___block_invoke;
  v16[3] = &unk_1E5DC0F18;
  id v17 = v6;
  id v15 = v6;
  [v14 performChanges:v16];
}

uint64_t __50__PXStoryRecipeManager__handleResult_forProducer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 producerDidProduceResult:*(void *)(a1 + 32)];
}

- (void)setRecipeAttributes:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t recipeAttributes = self->_recipeAttributes;
  if (recipeAttributes == a3) {
    return;
  }
  char v4 = a3;
  if ((recipeAttributes & 2) == 0 || !(((self->_recipeAttributes & 1) == 0) | a3 & 1))
  {
    if ((((self->_recipeAttributes & 2) == 0) & (((self->_recipeAttributes & 1) == 0) | a3)) != 0) {
      goto LABEL_8;
    }
LABEL_7:
    PXAssertGetLog();
  }
  if ((a3 & 2) == 0) {
    goto LABEL_7;
  }
LABEL_8:
  self->_unint64_t recipeAttributes = a3;
  [(PXStoryRecipeManager *)self signalChange:4];
  id v6 = [(PXStoryRecipeManager *)self log];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      uint64_t v9 = [(PXStoryRecipeManager *)self logContext];
      int v20 = 134217984;
      uint64_t v21 = v9;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryRecipeManagerChangedRecipeAttributes", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v20, 0xCu);
    }
  }

  os_signpost_id_t v10 = v6;
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v12 = v11;
    if (os_signpost_enabled(v10))
    {
      uint64_t v13 = [(PXStoryRecipeManager *)self logContext];
      os_signpost_id_t v14 = PXStoryComponentAttributesDescription(v4);
      int v20 = 134218242;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      long long v23 = v14;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_EVENT, v12, "PXStoryRecipeManagerChangedRecipeAttributes", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

  id v15 = v10;
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v15))
    {
      uint64_t v18 = [(PXStoryRecipeManager *)self logContext];
      uint64_t v19 = PXStoryComponentAttributesDescription(v4);
      int v20 = 134218242;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      long long v23 = v19;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryRecipeManagerChangedRecipeAttributes", "Context=%{signpost.telemetry:string2}lu %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

  [(PXStoryRecipeManager *)self setIsRecipeFinal:(self->_recipeAttributes >> 1) & 1];
}

- (void)setIsRecipeFinal:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isRecipeFinal != a3)
  {
    BOOL v3 = a3;
    self->_isRecipeFinal = a3;
    [(PXStoryRecipeManager *)self signalChange:2];
    os_signpost_id_t v5 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryRecipeManager *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryRecipeManagerChangedIsRecipeFinal", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    os_signpost_id_t v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryRecipeManager *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryRecipeManagerChangedIsRecipeFinal", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    os_signpost_id_t v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManagerChangedIsRecipeFinal", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }
  }
}

- (void)setRecipe:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v5 = (PXStoryRecipe *)a3;
  os_signpost_id_t v6 = self->_recipe;
  if (v6 == v5)
  {
  }
  else
  {
    os_signpost_id_t v7 = v6;
    char v8 = [(PXStoryRecipe *)v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_recipe, a3);
      [(PXStoryRecipeManager *)self _invalidateRecipeAttributes];
      [(PXStoryRecipeManager *)self signalChange:1];
      os_signpost_id_t v9 = [(PXStoryRecipeManager *)self log];
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          int v24 = 134217984;
          uint64_t v25 = [(PXStoryRecipeManager *)self logContext];
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PXStoryRecipeManagerChangedRecipe", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v24, 0xCu);
        }
      }

      os_signpost_id_t v12 = v9;
      os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v14 = v13;
        if (os_signpost_enabled(v12))
        {
          uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
          int v16 = [(PXStoryRecipe *)v5 curatedAssets];
          uint64_t v17 = [v16 count];
          int v24 = 134218496;
          uint64_t v25 = v15;
          __int16 v26 = 2048;
          long long v27 = v5;
          __int16 v28 = 2048;
          uint64_t v29 = v17;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_EVENT, v14, "PXStoryRecipeManagerChangedRecipe", "Context=%{signpost.telemetry:string2}lu %p curatedAssets:%ld", (uint8_t *)&v24, 0x20u);
        }
      }

      __int16 v18 = v12;
      os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self);
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v20 = v19;
        if (os_signpost_enabled(v18))
        {
          uint64_t v21 = [(PXStoryRecipeManager *)self logContext];
          __int16 v22 = [(PXStoryRecipe *)v5 curatedAssets];
          uint64_t v23 = [v22 count];
          int v24 = 134218496;
          uint64_t v25 = v21;
          __int16 v26 = 2048;
          long long v27 = v5;
          __int16 v28 = 2048;
          uint64_t v29 = v23;
          _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PXStoryRecipeManagerChangedRecipe", "Context=%{signpost.telemetry:string2}lu %p curatedAssets:%ld", (uint8_t *)&v24, 0x20u);
        }
      }
    }
  }
}

- (void)setAutoEditStylesResult:(id)a3
{
  os_signpost_id_t v7 = (PXStoryProducerResult *)a3;
  os_signpost_id_t v5 = self->_autoEditStylesResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_autoEditStylesResult, a3);
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:128];
    }
  }
}

- (void)setAutoEditStylesProgress:(id)a3
{
  os_signpost_id_t v5 = (NSProgress *)a3;
  p_autoEditStylesProgress = &self->_autoEditStylesProgress;
  if (*p_autoEditStylesProgress != v5)
  {
    os_signpost_id_t v7 = v5;
    [(NSProgress *)*p_autoEditStylesProgress cancel];
    objc_storeStrong((id *)p_autoEditStylesProgress, a3);
    os_signpost_id_t v5 = v7;
  }
}

- (void)setAutoEditStylesProducer:(id)a3
{
  os_signpost_id_t v7 = (PXStoryStylesProducer *)a3;
  os_signpost_id_t v5 = self->_autoEditStylesProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryStylesProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_autoEditStylesProducer, a3);
      [(PXStoryRecipeManager *)self _updateAutoEditStyles];
    }
  }
}

- (void)setAutoEditDecisionListsResult:(id)a3
{
  os_signpost_id_t v7 = (PXStoryProducerResult *)a3;
  os_signpost_id_t v5 = self->_autoEditDecisionListsResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_autoEditDecisionListsResult, a3);
      [(PXStoryRecipeManager *)self _invalidateAutoEditStylesProducer];
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:512];
    }
  }
}

- (void)setAutoEditDecisionListsProgress:(id)a3
{
  os_signpost_id_t v5 = (NSProgress *)a3;
  p_autoEditDecisionListsProgress = &self->_autoEditDecisionListsProgress;
  if (*p_autoEditDecisionListsProgress != v5)
  {
    os_signpost_id_t v7 = v5;
    [(NSProgress *)*p_autoEditDecisionListsProgress cancel];
    objc_storeStrong((id *)p_autoEditDecisionListsProgress, a3);
    os_signpost_id_t v5 = v7;
  }
}

- (BOOL)requiresAutoEditDecisionListsSynchronously
{
  return 0;
}

- (void)setAutoEditDecisionListsProducer:(id)a3
{
  os_signpost_id_t v7 = (PXStoryAutoEditDecisionListsProducer *)a3;
  os_signpost_id_t v5 = self->_autoEditDecisionListsProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryAutoEditDecisionListsProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_autoEditDecisionListsProducer, a3);
      [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionLists];
      [(PXStoryRecipeManager *)self _invalidateAdditionalAutoEditDecisionLists];
      [(PXStoryRecipeManager *)self _invalidateInitialAutoEditDecisionList];
    }
  }
}

- (void)setInitialStyleResult:(id)a3
{
  os_signpost_id_t v7 = (PXStoryProducerResult *)a3;
  os_signpost_id_t v5 = self->_initialStyleResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_initialStyleResult, a3);
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:64];
    }
  }
}

- (void)setInitialStyleProgress:(id)a3
{
  os_signpost_id_t v5 = (NSProgress *)a3;
  p_initialStyleProgress = &self->_initialStyleProgress;
  if (*p_initialStyleProgress != v5)
  {
    os_signpost_id_t v7 = v5;
    [(NSProgress *)*p_initialStyleProgress cancel];
    objc_storeStrong((id *)p_initialStyleProgress, a3);
    os_signpost_id_t v5 = v7;
  }
}

- (BOOL)requiresInitialStyleSynchronously
{
  return ![(PXStoryRecipeManager *)self shouldAvoidSynchronousProductions];
}

- (void)setInitialStyleProducer:(id)a3
{
  os_signpost_id_t v7 = (PXStoryStylesProducer *)a3;
  os_signpost_id_t v5 = self->_initialStyleProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryStylesProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_initialStyleProducer, a3);
      [(PXStoryRecipeManager *)self setHasInitialStyleBeenProduced:0];
      [(PXStoryRecipeManager *)self _invalidateInitialStyle];
    }
  }
}

- (void)setKeyAsset:(id)a3
{
  os_signpost_id_t v5 = (PXDisplayAsset *)a3;
  if (self->_keyAsset != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_keyAsset, a3);
    [(PXStoryRecipeManager *)self _invalidateChapterCollectionResult];
    [(PXStoryRecipeManager *)self _invalidateRecipe];
    os_signpost_id_t v5 = v6;
  }
}

- (void)setAllAssets:(id)a3
{
  id v6 = a3;
  if ((_areFetchResultsEqual(v6, self->_allAssets) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_allAssets, a3);
    cachedAssetsCountHUDDescription = self->_cachedAssetsCountHUDDescription;
    self->_cachedAssetsCountHUDDescription = 0;

    [(PXStoryRecipeManager *)self _invalidateRecipe];
    [(PXStoryRecipeManager *)self _invalidateCurationLengths];
  }
}

- (void)setUntruncatedCuratedAssets:(id)a3
{
  id v5 = a3;
  if ((_areFetchResultsEqual(v5, self->_untruncatedCuratedAssets) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_untruncatedCuratedAssets, a3);
    [(PXStoryRecipeManager *)self _invalidateRecipe];
  }
}

- (void)setCuratedAssets:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((_areFetchResultsEqual(v5, self->_curatedAssets) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_curatedAssets, a3);
    cachedAssetsCountHUDDescription = self->_cachedAssetsCountHUDDescription;
    self->_cachedAssetsCountHUDDescription = 0;

    [(PXStoryRecipeManager *)self _invalidateMovieHighlights];
    [(PXStoryRecipeManager *)self _invalidateDetailedSaliency];
    [(PXStoryRecipeManager *)self _invalidateChapterCollectionResult];
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
    [(PXStoryRecipeManager *)self _invalidateRecipe];
    [(PXStoryRecipeManager *)self _invalidateCurationLengths];
    [(PXStoryRecipeManager *)self _invalidateManuallyCuratedAssets];
    [(PXStoryRecipeManager *)self _invalidateProducerMonitors];
    os_signpost_id_t v7 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        int v10 = 134218240;
        uint64_t v11 = [(PXStoryRecipeManager *)self logContext];
        __int16 v12 = 2048;
        uint64_t v13 = [v5 count];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManagerSetCuratedAssets", "Context=%{signpost.telemetry:string2}lu curatedAssets:%ld", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)setAvailableCurationLengths:(unint64_t)a3
{
  if (self->_availableCurationLengths != a3)
  {
    self->_availableCurationLengths = a3;
    [(PXStoryRecipeManager *)self signalChange:32];
  }
}

- (void)setDefaultCurationLength:(unint64_t)a3
{
  if (self->_defaultCurationLength != a3)
  {
    self->_defaultCurationLength = a3;
    [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
    [(PXStoryRecipeManager *)self signalChange:32];
  }
}

- (void)setCurationLengthsResult:(id)a3
{
  os_signpost_id_t v7 = (PXStoryProducerResult *)a3;
  id v5 = self->_curationLengthsResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_curationLengthsResult, a3);
      [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
    }
  }
}

- (void)setAutoCurationProducer:(id)a3
{
  os_signpost_id_t v7 = (PXStoryAutoCurationProducer *)a3;
  id v5 = self->_autoCurationProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryAutoCurationProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_autoCurationProducer, a3);
      [(PXStoryRecipeManager *)self _invalidateCurationLengths];
    }
  }
}

- (void)setCurationLengthsProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_curationLengthsProgress = &self->_curationLengthsProgress;
  if (*p_curationLengthsProgress != v5)
  {
    os_signpost_id_t v7 = v5;
    [(NSProgress *)*p_curationLengthsProgress cancel];
    objc_storeStrong((id *)p_curationLengthsProgress, a3);
    id v5 = v7;
  }
}

- (void)setOverallDurationInfo:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  p_overallDurationInfo = &self->_overallDurationInfo;
  if (a3->var0 != self->_overallDurationInfo.kind) {
    goto LABEL_5;
  }
  long long v6 = *(_OWORD *)&a3->var1.var0.var3;
  long long v7 = *(_OWORD *)&a3->var1.var2.var0;
  *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var1.var1.var1;
  long long v33 = v7;
  *(void *)&long long v34 = a3->var1.var2.var3;
  *(_OWORD *)buf = *(_OWORD *)&a3->var1.var0.var0;
  *(_OWORD *)&buf[16] = v6;
  $E4065D193D0B4373B394C9E71DDE8F31 specificDurationInfo = self->_overallDurationInfo.specificDurationInfo;
  CMTime time1 = (CMTime)a3->var1.var0;
  CMTime time2 = (CMTime)self->_overallDurationInfo.specificDurationInfo.minimumDuration;
  if (CMTimeCompare(&time1, &time2)
    || (CMTime time1 = *(CMTime *)&buf[24],
        CMTime time2 = (CMTime)specificDurationInfo.preferredDuration,
        CMTimeCompare(&time1, &time2))
    || (*(_OWORD *)&time1.value = v33,
        time1.epoch = v34,
        CMTime time2 = (CMTime)specificDurationInfo.maximumDuration,
        CMTimeCompare(&time1, &time2)))
  {
LABEL_5:
    *(_OWORD *)&p_overallDurationInfo->kind = *(_OWORD *)&a3->var0;
    long long v8 = *(_OWORD *)&a3->var1.var0.var1;
    long long v9 = *(_OWORD *)&a3->var1.var1.var0;
    long long v10 = *(_OWORD *)&a3->var1.var2.var1;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.preferredDuration.epoch = *(_OWORD *)&a3->var1.var1.var3;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.maximumDuration.timescale = v10;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.minimumDuration.timescale = v8;
    *(_OWORD *)&p_overallDurationInfo->specificDurationInfo.preferredDuration.value = v9;
    -[PXStoryRecipeManager signalChange:](self, "signalChange:", 128, *(_OWORD *)&specificDurationInfo.minimumDuration.value, specificDurationInfo.minimumDuration.epoch);
    uint64_t v11 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, self);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        uint64_t v14 = [(PXStoryRecipeManager *)self logContext];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v14;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PXStoryRecipeManagerChangedOverallDurationInfo", "Context=%{signpost.telemetry:string2}lu ", buf, 0xCu);
      }
    }

    uint64_t v15 = v11;
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        uint64_t v18 = [(PXStoryRecipeManager *)self logContext];
        long long v19 = *(_OWORD *)&a3->var1.var1.var3;
        *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var1.var1.var0;
        long long v33 = v19;
        long long v34 = *(_OWORD *)&a3->var1.var2.var1;
        long long v20 = *(_OWORD *)&a3->var1.var0.var1;
        *(_OWORD *)buf = *(_OWORD *)&a3->var0;
        *(_OWORD *)&buf[16] = v20;
        uint64_t v21 = PFStoryOverallDurationInfoDescription();
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_EVENT, v17, "PXStoryRecipeManagerChangedOverallDurationInfo", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
      }
    }

    __int16 v22 = v15;
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, self);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = v23;
      if (os_signpost_enabled(v22))
      {
        uint64_t v25 = [(PXStoryRecipeManager *)self logContext];
        long long v26 = *(_OWORD *)&a3->var1.var1.var3;
        *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var1.var1.var0;
        long long v33 = v26;
        long long v34 = *(_OWORD *)&a3->var1.var2.var1;
        long long v27 = *(_OWORD *)&a3->var1.var0.var1;
        *(_OWORD *)buf = *(_OWORD *)&a3->var0;
        *(_OWORD *)&buf[16] = v27;
        __int16 v28 = PFStoryOverallDurationInfoDescription();
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v28;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PXStoryRecipeManagerChangedOverallDurationInfo", "Context=%{signpost.telemetry:string2}lu %{public}@", buf, 0x16u);
      }
    }

    [(PXStoryRecipeManager *)self _invalidateRecipe];
    [(PXStoryRecipeManager *)self _invalidateManuallyCuratedAssets];
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
  }
}

- (void)setChapterCollection:(id)a3
{
  id v5 = (PXStoryChapterCollection *)a3;
  if (self->_chapterCollection != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_chapterCollection, a3);
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
    [(PXStoryRecipeManager *)self _invalidateRecipe];
    id v5 = v6;
  }
}

- (void)setChapterCollectionManager:(id)a3
{
  id v5 = (PXStoryChapterCollectionManager *)a3;
  chapterCollectionManager = self->_chapterCollectionManager;
  if (chapterCollectionManager != v5)
  {
    long long v7 = v5;
    [(PXStoryChapterCollectionManager *)chapterCollectionManager unregisterChangeObserver:self context:ChapterCollectionManagerObservationContext];
    objc_storeStrong((id *)&self->_chapterCollectionManager, a3);
    [(PXStoryChapterCollectionManager *)self->_chapterCollectionManager registerChangeObserver:self context:ChapterCollectionManagerObservationContext];
    [(PXStoryRecipeManager *)self _invalidateChapterCollection];
    id v5 = v7;
  }
}

- (void)setChapterCollectionResult:(id)a3
{
  long long v8 = (PXStoryProducerResult *)a3;
  id v5 = self->_chapterCollectionResult;
  long long v6 = v8;
  if (v5 != v8)
  {
    BOOL v7 = [(PXStoryProducerResult *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_chapterCollectionResult, a3);
    [(PXStoryRecipeManager *)self _handleResult:v8 forProducer:2048];
    long long v6 = [(PXStoryProducerResult *)self->_chapterCollectionResult object];
    [(PXStoryRecipeManager *)self setChapterCollectionManager:v6];
  }

LABEL_5:
}

- (void)setHasFinalChapterCollectionBeenProduced:(BOOL)a3
{
  if (self->_hasFinalChapterCollectionBeenProduced != a3)
  {
    self->_hasFinalChapterCollectionBeenProduced = a3;
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
  }
}

- (void)setChapterCollectionProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_chapterCollectionProgress = &self->_chapterCollectionProgress;
  if (*p_chapterCollectionProgress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)*p_chapterCollectionProgress cancel];
    objc_storeStrong((id *)p_chapterCollectionProgress, a3);
    id v5 = v7;
  }
}

- (BOOL)requiresChapterCollectionSynchronously
{
  return 0;
}

- (void)setChapterCollectionProducer:(id)a3
{
  BOOL v7 = (PXStoryChapterCollectionProducer *)a3;
  id v5 = self->_chapterCollectionProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryChapterCollectionProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_chapterCollectionProducer, a3);
      [(PXStoryRecipeManager *)self setHasFinalChapterCollectionBeenProduced:0];
      [(PXStoryRecipeManager *)self _invalidateChapterCollectionResult];
    }
  }
}

- (void)setDetailedSaliencyResult:(id)a3
{
  BOOL v7 = (PXStoryProducerResult *)a3;
  id v5 = self->_detailedSaliencyResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_detailedSaliencyResult, a3);
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:4096];
    }
  }
}

- (void)setHasFinalDetailedSaliencyBeenProduced:(BOOL)a3
{
  if (self->_hasFinalDetailedSaliencyBeenProduced != a3)
  {
    self->_hasFinalDetailedSaliencyBeenProduced = a3;
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
  }
}

- (void)setDetailedSaliencyProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_detailedSaliencyProgress = &self->_detailedSaliencyProgress;
  if (*p_detailedSaliencyProgress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)*p_detailedSaliencyProgress cancel];
    objc_storeStrong((id *)p_detailedSaliencyProgress, a3);
    id v5 = v7;
  }
}

- (BOOL)requiresDetailedSaliencySynchronously
{
  return 0;
}

- (void)setDetailedSaliencyProducer:(id)a3
{
  long long v8 = (PXStoryDetailedSaliencyProducer *)a3;
  id v5 = self->_detailedSaliencyProducer;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = [(PXStoryDetailedSaliencyProducer *)v8 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_detailedSaliencyProducer, a3);
      [(PXStoryRecipeManager *)self setHasFinalDetailedSaliencyBeenProduced:0];
      BOOL v7 = [(PXStoryRecipeManager *)self detailedSaliencyProducerMonitor];
      [v7 performChanges:&__block_literal_global_164424];

      [(PXStoryRecipeManager *)self _invalidateDetailedSaliency];
    }
  }
}

uint64_t __52__PXStoryRecipeManager_setDetailedSaliencyProducer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)setMovieHighlightsResult:(id)a3
{
  BOOL v7 = (PXStoryProducerResult *)a3;
  id v5 = self->_movieHighlightsResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_movieHighlightsResult, a3);
      [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:32];
    }
  }
}

- (void)setHaveFinalMovieHighlightsBeenProduced:(BOOL)a3
{
  if (self->_haveFinalMovieHighlightsBeenProduced != a3)
  {
    self->_haveFinalMovieHighlightsBeenProduced = a3;
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
  }
}

- (void)setMovieHighlightsProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_movieHighlightsProgress = &self->_movieHighlightsProgress;
  if (*p_movieHighlightsProgress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)*p_movieHighlightsProgress cancel];
    objc_storeStrong((id *)p_movieHighlightsProgress, a3);
    id v5 = v7;
  }
}

- (BOOL)requiresMovieHighlightsSynchronously
{
  return 0;
}

- (void)setMovieHighlightsProducer:(id)a3
{
  BOOL v7 = (PXStoryMovieHighlightsProducer *)a3;
  id v5 = self->_movieHighlightsProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryMovieHighlightsProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_movieHighlightsProducer, a3);
      [(PXStoryRecipeManager *)self setHaveFinalMovieHighlightsBeenProduced:0];
      [(PXStoryRecipeManager *)self _invalidateMovieHighlights];
    }
  }
}

- (id)fallbackSongResource
{
  uint64_t v2 = [(PXStoryRecipeManager *)self curatedSongsResult];
  BOOL v3 = [v2 object];
  char v4 = [v3 fallbackCuratedAssets];

  if ([v4 count] < 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v4 firstObject];
  }

  return v5;
}

- (PXAudioAssetFetchResult)curatedSongs
{
  uint64_t v2 = [(PXStoryRecipeManager *)self curatedSongsResult];
  BOOL v3 = [v2 object];
  char v4 = [v3 curatedAudioAssets];

  return (PXAudioAssetFetchResult *)v4;
}

- (void)setCuratedSongsResult:(id)a3
{
  BOOL v7 = (PXStoryProducerResult *)a3;
  id v5 = self->_curatedSongsResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_curatedSongsResult, a3);
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionLists];
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _invalidateInitialAutoEditDecisionList];
      [(PXStoryRecipeManager *)self _invalidateInitialStyleProducer];
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:16];
    }
  }
}

- (void)setCuratedSongsProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  if (self->_curatedSongsProgress != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_curatedSongsProgress, a3);
    id v5 = v6;
  }
}

- (BOOL)requiresSongsSynchronously
{
  return 0;
}

- (void)setCuratedSongsProducer:(id)a3
{
  BOOL v7 = (PXStorySongsProducer *)a3;
  id v5 = self->_curatedSongsProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStorySongsProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_curatedSongsProducer, a3);
      [(PXStorySongsProducer *)v7 setLogContext:[(PXStoryRecipeManager *)self logContext]];
      [(PXStoryRecipeManager *)self _invalidateCuratedSongs];
    }
  }
}

- (void)setInitialAutoEditDecisionListResult:(id)a3
{
  BOOL v7 = (PXStoryProducerResult *)a3;
  id v5 = self->_initialAutoEditDecisionListResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:256];
      objc_storeStrong((id *)&self->_initialAutoEditDecisionListResult, a3);
      [(PXStoryRecipeManager *)self _invalidateInitialStyleProducer];
    }
  }
}

- (void)setPersistedSongProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_persistedSongProgress = &self->_persistedSongProgress;
  if (*p_persistedSongProgress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)*p_persistedSongProgress cancel];
    objc_storeStrong((id *)p_persistedSongProgress, a3);
    id v5 = v7;
  }
}

- (void)setPersistedSongResult:(id)a3
{
  BOOL v7 = (PXStoryProducerResult *)a3;
  id v5 = self->_persistedSongResult;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXStoryProducerResult *)v7 isEqual:v5];

    if (!v6)
    {
      [(PXStoryRecipeManager *)self _handleResult:v7 forProducer:8];
      objc_storeStrong((id *)&self->_persistedSongResult, a3);
      [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionLists];
      [(PXStoryRecipeManager *)self _invalidateCuratedSongs];
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _invalidateInitialAutoEditDecisionList];
      [(PXStoryRecipeManager *)self _invalidateInitialStyleProducer];
    }
  }
}

- (void)setPersistedSongProducer:(id)a3
{
  long long v8 = (NSProgress *)a3;
  id v5 = self->_persistedSongProgress;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(NSProgress *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_persistedSongProducer, a3);
      [(PXStoryRecipeManager *)self _invalidatePersistedSong];
    }
  }
}

- (void)setPersistableRecipeResult:(id)a3
{
  id v5 = (PXStoryProducerResult *)a3;
  BOOL v6 = self->_persistableRecipeResult;
  if (v6 == v5)
  {
  }
  else
  {
    char v7 = v6;
    BOOL v8 = [(PXStoryProducerResult *)v5 isEqual:v6];

    if (!v8)
    {
      objc_storeStrong((id *)&self->_persistableRecipeResult, a3);
      long long v9 = [(PXStoryProducerResult *)v5 object];
      long long v10 = [v9 miroInfo];

      if ([v10 containsAnyData])
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __51__PXStoryRecipeManager_setPersistableRecipeResult___block_invoke;
        v11[3] = &unk_1E5DC1548;
        id v12 = v10;
        [(PXStoryRecipeManager *)self performChanges:v11];
      }
      [(PXStoryRecipeManager *)self _invalidateRecipe];
      [(PXStoryRecipeManager *)self _invalidateManuallyCuratedAssets];
      [(PXStoryRecipeManager *)self _invalidatePersistedSongProducer];
      [(PXStoryRecipeManager *)self _invalidatePersistedSong];
      [(PXStoryRecipeManager *)self _invalidateOverallDurationInfo];
      [(PXStoryRecipeManager *)self _handleResult:v5 forProducer:4];
    }
  }
}

void __51__PXStoryRecipeManager_setPersistableRecipeResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 curatedAssets];
  [v3 applyManuallyCuratedAssets:v4];
}

- (void)setHasInitialPersistableRecipeBeenProduced:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_hasInitialPersistableRecipeBeenProduced != a3)
  {
    BOOL v3 = a3;
    self->_hasInitialPersistableRecipeBeenProduced = a3;
    id v5 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v7 = v6;
      if (os_signpost_enabled(v5))
      {
        int v16 = 134217984;
        uint64_t v17 = [(PXStoryRecipeManager *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_END, v7, "PXStoryRecipeManager.hasInitialPersistableRecipeBeenProduced", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v16, 0xCu);
      }
    }

    BOOL v8 = v5;
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        uint64_t v11 = [(PXStoryRecipeManager *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v11;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_EVENT, v10, "PXStoryRecipeManager.hasInitialPersistableRecipeBeenProduced", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    id v12 = v8;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
        int v16 = 134218240;
        uint64_t v17 = v15;
        __int16 v18 = 1024;
        BOOL v19 = v3;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.hasInitialPersistableRecipeBeenProduced", "Context=%{signpost.telemetry:string2}lu %d", (uint8_t *)&v16, 0x12u);
      }
    }

    [(PXStoryRecipeManager *)self _invalidateInitialStyleProducer];
  }
}

- (void)setPersistableRecipeProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_persistableRecipeProgress = &self->_persistableRecipeProgress;
  if (*p_persistableRecipeProgress != v5)
  {
    os_signpost_id_t v7 = v5;
    [(NSProgress *)*p_persistableRecipeProgress cancel];
    objc_storeStrong((id *)p_persistableRecipeProgress, a3);
    id v5 = v7;
  }
}

- (BOOL)requiresPersistableRecipeSynchronously
{
  return 0;
}

- (void)setPersistableRecipeProducer:(id)a3
{
  os_signpost_id_t v7 = (PXStoryPersistableRecipeProducer *)a3;
  id v5 = self->_persistableRecipeProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryPersistableRecipeProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_persistableRecipeProducer, a3);
      [(PXStoryRecipeManager *)self _invalidatePersistableRecipe];
    }
  }
}

- (void)setAssetsDataSource:(id)a3
{
  uint64_t v11 = (PXAssetsDataSource *)a3;
  id v5 = self->_assetsDataSource;
  char v6 = (PXStoryProducerResult *)v11;
  if (v5 != v11)
  {
    os_signpost_id_t v7 = v5;
    char v8 = [(PXAssetsDataSource *)v5 isEqual:v11];

    if (v8) {
      goto LABEL_7;
    }
    objc_storeStrong((id *)&self->_assetsDataSource, a3);
    char v6 = [[PXStoryProducerResult alloc] initWithObject:v11];
    if (([(PXAssetsDataSource *)v11 areAllSectionsConsideredAccurate] & 1) == 0) {
      id v9 = [(PXStoryProducerResult *)v6 flags:1];
    }
    [(PXStoryRecipeManager *)self _handleResult:v6 forProducer:2];
    os_signpost_id_t v10 = [(PXAssetsDataSource *)v11 firstAssetCollection];
    [(PXStoryRecipeManager *)self setAssetCollection:v10];

    [(PXStoryRecipeManager *)self _invalidateCuratedAssets];
    [(PXStoryRecipeManager *)self _invalidateAllAssets];
    [(PXStoryRecipeManager *)self _invalidateKeyAsset];
  }

LABEL_7:
}

- (void)setAssetsDataSourceManager:(id)a3
{
  id v9 = (PXAssetsDataSourceManager *)a3;
  id v5 = self->_assetsDataSourceManager;
  char v6 = v9;
  if (v5 != v9)
  {
    os_signpost_id_t v7 = v5;
    char v8 = [(PXAssetsDataSourceManager *)v5 isEqual:v9];

    if (v8) {
      goto LABEL_5;
    }
    [(PXAssetsDataSourceManager *)self->_assetsDataSourceManager unregisterChangeObserver:self context:AssetsDataSourceManagerObservationContext];
    objc_storeStrong((id *)&self->_assetsDataSourceManager, a3);
    [(PXAssetsDataSourceManager *)v9 registerChangeObserver:self context:AssetsDataSourceManagerObservationContext];
    [(PXStoryRecipeManager *)self signalChange:16];
    char v6 = [(PXAssetsDataSourceManager *)v9 dataSource];
    [(PXStoryRecipeManager *)self setAssetsDataSource:v6];
  }

LABEL_5:
}

- (void)setAssetsResult:(id)a3
{
  char v8 = (PXStoryProducerResult *)a3;
  id v5 = self->_assetsResult;
  char v6 = v8;
  if (v5 != v8)
  {
    BOOL v7 = [(PXStoryProducerResult *)v8 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_assetsResult, a3);
    [(PXStoryRecipeManager *)self _handleResult:v8 forProducer:1];
    char v6 = [(PXStoryProducerResult *)v8 object];
    [(PXStoryRecipeManager *)self setAssetsDataSourceManager:v6];
  }

LABEL_5:
}

- (void)setAssetsProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_assetsProgress = &self->_assetsProgress;
  if (*p_assetsProgress != v5)
  {
    BOOL v7 = v5;
    [(NSProgress *)*p_assetsProgress cancel];
    objc_storeStrong((id *)p_assetsProgress, a3);
    id v5 = v7;
  }
}

- (void)setAssetCollection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = (PXDisplayAssetCollection *)a3;
  if (self->_assetCollection != v5)
  {
    objc_storeStrong((id *)&self->_assetCollection, a3);
    char v6 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        int v21 = 134217984;
        uint64_t v22 = [(PXStoryRecipeManager *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PXStoryRecipeManager.assetCollection", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v21, 0xCu);
      }
    }

    id v9 = v6;
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        uint64_t v12 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v13 = [(PXDisplayAssetCollection *)v5 uuid];
        os_signpost_id_t v14 = [(PXDisplayAssetCollection *)v5 localizedTitle];
        int v21 = 134218498;
        uint64_t v22 = v12;
        __int16 v23 = 2114;
        os_signpost_id_t v24 = v13;
        __int16 v25 = 2114;
        long long v26 = v14;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_EVENT, v11, "PXStoryRecipeManager.assetCollection", "Context=%{signpost.telemetry:string2}lu uuid:%{public}@ title:%{public}@", (uint8_t *)&v21, 0x20u);
      }
    }

    uint64_t v15 = v9;
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        uint64_t v18 = [(PXStoryRecipeManager *)self logContext];
        BOOL v19 = [(PXDisplayAssetCollection *)v5 uuid];
        uint64_t v20 = [(PXDisplayAssetCollection *)v5 localizedTitle];
        int v21 = 134218498;
        uint64_t v22 = v18;
        __int16 v23 = 2114;
        os_signpost_id_t v24 = v19;
        __int16 v25 = 2114;
        long long v26 = v20;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PXStoryRecipeManager.assetCollection", "Context=%{signpost.telemetry:string2}lu uuid:%{public}@ title:%{public}@", (uint8_t *)&v21, 0x20u);
      }
    }

    [(PXStoryRecipeManager *)self _invalidateRecipe];
  }
}

- (BOOL)requiresAssetsSynchronously
{
  return ![(PXStoryRecipeManager *)self shouldAvoidSynchronousProductions];
}

- (void)setAssetsProducer:(id)a3
{
  os_signpost_id_t v7 = (PXStoryAssetsProducer *)a3;
  id v5 = self->_assetsProducer;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryAssetsProducer *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetsProducer, a3);
      [(PXStoryRecipeManager *)self _invalidateAssets];
    }
  }
}

- (BOOL)wantsAutoEditResults
{
  uint64_t v2 = [(PXStoryRecipeManager *)self configuration];
  BOOL v3 = ([v2 options] & 1) == 0;

  return v3;
}

- (unint64_t)optionalProducers
{
  return 1024;
}

- (unint64_t)producersToMonitor
{
  return 4096;
}

- (unint64_t)producersRequiredForPlayback
{
  return 6465;
}

- (void)setProducersLikelyToKeepUp:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_producersLikelyToKeepUp != a3)
  {
    self->_producersLikelyToKeepUp = a3;
    [(PXStoryRecipeManager *)self _invalidateRecipeAttributes];
    id v4 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXStoryRecipeManager *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryRecipeManager.producersLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    os_signpost_id_t v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v11 = PXStoryProducersDescription(self->_producersLikelyToKeepUp);
        int v17 = 134218242;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManager.producersLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
      }
    }

    uint64_t v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v16 = PXStoryProducersDescription(self->_producersLikelyToKeepUp);
        int v17 = 134218242;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.producersLikelyToKeepUp", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setProducersWithInitialResults:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_producersWithInitialResults != a3)
  {
    self->_producersWithInitialResults = a3;
    id v4 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXStoryRecipeManager *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryRecipeManager.producersWithInitialResults", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    os_signpost_id_t v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v11 = PXStoryProducersDescription(self->_producersWithInitialResults);
        int v17 = 134218242;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManager.producersWithInitialResults", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
      }
    }

    uint64_t v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v16 = PXStoryProducersDescription(self->_producersWithInitialResults);
        int v17 = 134218242;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.producersWithInitialResults", "Context=%{signpost.telemetry:string2}lu Producers=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setRemainingProducers:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_remainingProducers != a3)
  {
    self->_remainingProducers = a3;
    id v4 = [(PXStoryRecipeManager *)self log];
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        int v17 = 134217984;
        uint64_t v18 = [(PXStoryRecipeManager *)self logContext];
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PXStoryRecipeManager.remainingProducers", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v17, 0xCu);
      }
    }

    os_signpost_id_t v7 = v4;
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, self);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        uint64_t v10 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v11 = PXStoryProducersDescription(self->_remainingProducers);
        int v17 = 134218242;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v11;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_EVENT, v9, "PXStoryRecipeManager.remainingProducers", "Context=%{signpost.telemetry:string2}lu Remaining=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
      }
    }

    uint64_t v12 = v7;
    os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        uint64_t v15 = [(PXStoryRecipeManager *)self logContext];
        os_signpost_id_t v16 = PXStoryProducersDescription(self->_remainingProducers);
        int v17 = 134218242;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PXStoryRecipeManager.remainingProducers", "Context=%{signpost.telemetry:string2}lu Remaining=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
      }
    }
  }
}

- (void)setFinalizedProducers:(unint64_t)a3
{
  if (self->_finalizedProducers != a3)
  {
    self->_finalizedProducers = a3;
    [(PXStoryRecipeManager *)self setRemainingProducers:~(_WORD)a3 & 0x1FFF];
    [(PXStoryRecipeManager *)self _invalidateRecipeAttributes];
  }
}

- (BOOL)shouldAvoidSynchronousProductions
{
  uint64_t v2 = [(PXStoryRecipeManager *)self configuration];
  BOOL v3 = ([v2 options] & 0xC) != 0;

  return v3;
}

- (void)setConfiguration:(id)a3
{
  os_signpost_id_t v13 = (PXStoryConfiguration *)a3;
  os_signpost_id_t v5 = self->_configuration;
  if (v5 == v13)
  {
  }
  else
  {
    char v6 = [(PXStoryConfiguration *)v13 isEqual:v5];

    os_signpost_id_t v7 = v13;
    if (v6) {
      goto LABEL_10;
    }
    os_signpost_id_t v8 = (PXStoryConfiguration *)[(PXStoryConfiguration *)v13 copy];
    configuration = self->_configuration;
    self->_configuration = v8;

    uint64_t v10 = [(PXStoryConfiguration *)v13 storyQueue];
    os_signpost_id_t v11 = [(PXStoryRecipeManager *)self storyQueue];

    if (v10 != v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryRecipeManager.m" lineNumber:446 description:@"queue mismatch"];
    }
    self->_defaultRequestOptions = 0;
    if ([(PXStoryConfiguration *)self->_configuration options]) {
      self->_defaultRequestOptions |= 2uLL;
    }
    [(PXStoryRecipeManager *)self _invalidateInitialStyleProducer];
    [(PXStoryRecipeManager *)self _invalidateAssetCollection];
    [(PXStoryRecipeManager *)self _invalidateAssetsProducer];
    [(PXStoryRecipeManager *)self _invalidatePersistableRecipeProducer];
    [(PXStoryRecipeManager *)self _invalidateCuratedSongsProducer];
    [(PXStoryRecipeManager *)self _invalidateMovieHighlightsProducer];
    [(PXStoryRecipeManager *)self _invalidateDetailedSaliencyProducer];
    [(PXStoryRecipeManager *)self _invalidateChapterCollectionProducer];
    [(PXStoryRecipeManager *)self _invalidateAutoCurationProducer];
    [(PXStoryRecipeManager *)self _invalidateAutoEditDecisionListsProducer];
    [(PXStoryRecipeManager *)self _invalidateRecipe];
  }
  os_signpost_id_t v7 = v13;
LABEL_10:
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXStoryRecipeManager;
  [(PXStoryRecipeManager *)&v4 didPerformChanges];
  BOOL v3 = [(PXStoryRecipeManager *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(PXStoryRecipeManager *)self storyQueue];
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryRecipeManager;
  [(PXStoryRecipeManager *)&v6 performChanges:v4];
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  os_signpost_id_t v5 = NSStringFromClass(v4);
  objc_super v6 = [(PXStoryRecipeManager *)self configuration];
  os_signpost_id_t v7 = (void *)[v3 initWithFormat:@"<%@: %p, configuration: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (void)dealloc
{
  [(NSProgress *)self->_assetsProgress cancel];
  [(NSProgress *)self->_persistableRecipeProgress cancel];
  [(NSProgress *)self->_curatedSongsProgress cancel];
  [(NSProgress *)self->_persistedSongProgress cancel];
  [(NSProgress *)self->_initialStyleProgress cancel];
  [(NSProgress *)self->_initialAutoEditDecisionListProgress cancel];
  [(NSProgress *)self->_autoEditStylesProgress cancel];
  [(NSProgress *)self->_autoEditDecisionListsProgress cancel];
  [(NSProgress *)self->_detailedSaliencyProgress cancel];
  [(NSProgress *)self->_chapterCollectionProgress cancel];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryRecipeManager;
  [(PXStoryRecipeManager *)&v3 dealloc];
}

- (PXStoryRecipeManager)initWithConfiguration:(id)a3 assetsProducerFactory:(id)a4 persistableRecipeProducerFactory:(id)a5 songsProducerFactory:(id)a6 movieHighlightsProducerFactory:(id)a7 detailedSaliencyProducerFactory:(id)a8 chapterCollectionProducerFactory:(id)a9 stylesProducerFactory:(id)a10 autoEditDecisionListsProducerFactory:(id)a11 autoCurationProducerFactory:(id)a12
{
  id v75 = a3;
  int v17 = (PXStoryDefaultAssetsProducerFactory *)a4;
  uint64_t v18 = (PXStoryDefaultPersistableRecipeProducerFactory *)a5;
  __int16 v19 = (PXStoryDefaultSongsProducerFactory *)a6;
  uint64_t v20 = v17;
  uint64_t v21 = v18;
  uint64_t v22 = v19;
  __int16 v23 = (PXStoryDefaultMovieHighlightsProducerFactory *)a7;
  os_signpost_id_t v24 = (PXStoryDefaultDetailedSaliencyProducerFactory *)a8;
  __int16 v25 = (PXStoryDefaultChapterCollectionProducerFactory *)a9;
  long long v26 = v23;
  uint64_t v27 = (PXStoryDefaultStylesProducerFactory *)a10;
  __int16 v28 = v24;
  uint64_t v29 = v25;
  id obj = (PXStoryDefaultAutoEditDecisionListsProducerFactory *)a11;
  uint64_t v30 = (PXStoryDefaultAutoCurationProducerFactory *)a12;
  v81.receiver = self;
  v81.super_class = (Class)PXStoryRecipeManager;
  uint64_t v31 = [(PXStoryRecipeManager *)&v81 init];
  if (v31)
  {
    v73 = v27;
    v32 = [v75 log];
    [(PXStoryRecipeManager *)v31 setLog:v32];

    -[PXStoryRecipeManager setLogContext:](v31, "setLogContext:", [v75 logContext]);
    long long v33 = v20;
    if (!v20) {
      long long v33 = objc_alloc_init(PXStoryDefaultAssetsProducerFactory);
    }
    objc_storeStrong((id *)&v31->_assetsProducerFactory, v33);
    if (!v20) {

    }
    long long v34 = v21;
    if (!v21) {
      long long v34 = objc_alloc_init(PXStoryDefaultPersistableRecipeProducerFactory);
    }
    objc_storeStrong((id *)&v31->_persistableRecipeProducerFactory, v34);
    if (!v21) {

    }
    uint64_t v35 = v22;
    if (!v22) {
      uint64_t v35 = objc_alloc_init(PXStoryDefaultSongsProducerFactory);
    }
    objc_storeStrong((id *)&v31->_songsProducerFactory, v35);
    if (!v22) {

    }
    v36 = v26;
    if (!v26) {
      v36 = objc_alloc_init(PXStoryDefaultMovieHighlightsProducerFactory);
    }
    objc_storeStrong((id *)&v31->_movieHighlightsProducerFactory, v36);
    if (!v26) {

    }
    unint64_t v37 = v28;
    if (!v28) {
      unint64_t v37 = objc_alloc_init(PXStoryDefaultDetailedSaliencyProducerFactory);
    }
    objc_storeStrong((id *)&v31->_detailedSaliencyProducerFactory, v37);
    if (!v28) {

    }
    v38 = v29;
    if (!v29) {
      v38 = objc_alloc_init(PXStoryDefaultChapterCollectionProducerFactory);
    }
    objc_storeStrong((id *)&v31->_chapterCollectionProducerFactory, v38);
    if (!v29) {

    }
    id v39 = v27;
    if (!v27) {
      id v39 = objc_alloc_init(PXStoryDefaultStylesProducerFactory);
    }
    objc_storeStrong((id *)&v31->_stylesProducerFactory, v39);
    if (!v27) {

    }
    v40 = obj;
    if (!obj) {
      v40 = [[PXStoryDefaultAutoEditDecisionListsProducerFactory alloc] initWithStoryConfiguration:v75];
    }
    objc_storeStrong((id *)&v31->_autoEditDecisionListsProducerFactory, v40);
    if (!obj) {

    }
    v41 = v30;
    if (!v30) {
      v41 = objc_alloc_init(PXStoryDefaultAutoCurationProducerFactory);
    }
    objc_storeStrong((id *)&v31->_autoCurationProducerFactory, v41);
    if (!v30) {

    }
    v42 = objc_alloc_init(PXStoryDefaultSongResourceProducerFactory);
    songResourceProducerFactory = v31->_songResourceProducerFactory;
    v31->_songResourceProducerFactory = (PXStorySongResourceProducerFactory *)v42;

    v44 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    additionalSongs = v31->_additionalSongs;
    v31->_additionalSongs = v44;

    v46 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    additionalAutoEditDecisionListsBySong = v31->_additionalAutoEditDecisionListsBySong;
    v31->_additionalAutoEditDecisionListsBySong = v46;

    uint64_t v48 = [v75 storyQueue];
    storyQueue = v31->_storyQueue;
    v31->_storyQueue = (OS_dispatch_queue *)v48;

    uint64_t v50 = [v75 errorReporter];
    errorReporter = v31->_errorReporter;
    v31->_errorReporter = (PXStoryErrorReporter *)v50;

    uint64_t v52 = (_OWORD *)MEMORY[0x1E4F8D288];
    long long v53 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
    *(_OWORD *)&v31->_overallDurationInfo.specificDurationInfo.preferredDuration.value = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
    *(_OWORD *)&v31->_overallDurationInfo.specificDurationInfo.preferredDuration.epoch = v53;
    *(_OWORD *)&v31->_overallDurationInfo.specificDurationInfo.maximumDuration.timescale = v52[4];
    long long v54 = v52[1];
    *(_OWORD *)&v31->_overallDurationInfo.kind = *v52;
    *(_OWORD *)&v31->_overallDurationInfo.specificDurationInfo.minimumDuration.timescale = v54;
    long long v55 = objc_alloc_init(PXStoryRecipeAssetEdits);
    recipeAssetEdits = v31->_recipeAssetEdits;
    v31->_recipeAssetEdits = v55;

    uint64_t v57 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v31 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v31->_updater;
    v31->_updater = (PXUpdater *)v57;

    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAssetsProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAssets];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAssetCollection];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updatePersistableRecipeProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updatePersistableRecipe];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updatePersistedSongProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updatePersistedSong];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateCuratedSongsProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateCuratedSongs];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAllAssets];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateCuratedAssets];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateKeyAsset];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateMovieHighlightsProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateMovieHighlights];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateDetailedSaliencyProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateDetailedSaliency];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateChapterCollectionProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateChapterCollectionResult];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateChapterCollection];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAutoCurationProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateCurationLengths];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateOverallDurationInfo];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateManuallyCuratedAssets];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAutoEditDecisionListsProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateInitialAutoEditDecisionList];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAutoEditDecisionLists];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAdditionalAutoEditDecisionLists];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateInitialStyleProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateInitialStyle];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAutoEditStylesProducer];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateAutoEditStyles];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateProducerMonitors];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateProducersLikelyToKeepUp];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateRecipe];
    [(PXUpdater *)v31->_updater addUpdateSelector:sel__updateRecipeAttributes];
    uint64_t v59 = [MEMORY[0x1E4F1C9C8] date];
    loadingStartDate = v31->_loadingStartDate;
    v31->_loadingStartDate = (NSDate *)v59;

    if (([(PXStoryConfiguration *)v31->_configuration options] & 3) == 0)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke;
      aBlock[3] = &unk_1E5DC0EA8;
      v61 = v31;
      v80 = v61;
      v62 = v29;
      v63 = v28;
      v64 = v26;
      v65 = v22;
      v66 = v21;
      v67 = v20;
      v68 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v69 = v68[2]();
      detailedSaliencyProducerMonitor = v61->_detailedSaliencyProducerMonitor;
      v61->_detailedSaliencyProducerMonitor = (PXStoryProducerMonitor *)v69;

      uint64_t v20 = v67;
      uint64_t v21 = v66;
      uint64_t v22 = v65;
      long long v26 = v64;
      __int16 v28 = v63;
      uint64_t v29 = v62;
    }
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke_2;
    v76[3] = &unk_1E5DC0ED0;
    v77 = v31;
    id v78 = v75;
    [(PXStoryRecipeManager *)v77 performChanges:v76];

    uint64_t v27 = v73;
  }

  return v31;
}

PXStoryProducerMonitor *__305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[PXStoryProducerMonitor alloc] initWithStoryQueue:*(void *)(*(void *)(a1 + 32) + 104)];
  [(PXStoryProducerMonitor *)v2 registerChangeObserver:*(void *)(a1 + 32) context:ProducerMonitorObservationContext];
  return v2;
}

void __305__PXStoryRecipeManager_initWithConfiguration_assetsProducerFactory_persistableRecipeProducerFactory_songsProducerFactory_movieHighlightsProducerFactory_detailedSaliencyProducerFactory_chapterCollectionProducerFactory_stylesProducerFactory_autoEditDecisionListsProducerFactory_autoCurationProducerFactory___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setRemainingProducers:0x1FFFLL];
  [v4 setConfiguration:*(void *)(a1 + 40)];
}

- (PXStoryRecipeManager)initWithConfiguration:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [v4 detailedSaliencyProducer];
  if (v5) {
    objc_super v6 = [[PXStoryPassthroughDetailedSaliencyProducerFactory alloc] initWithDetailedSaliencyProducer:v5];
  }
  else {
    objc_super v6 = 0;
  }
  os_signpost_id_t v7 = [(PXStoryRecipeManager *)self initWithConfiguration:v4 assetsProducerFactory:0 persistableRecipeProducerFactory:0 songsProducerFactory:0 movieHighlightsProducerFactory:0 detailedSaliencyProducerFactory:v6 chapterCollectionProducerFactory:0 stylesProducerFactory:0 autoEditDecisionListsProducerFactory:0 autoCurationProducerFactory:0];

  return v7;
}

- (PXStoryRecipeManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRecipeManager.m", 313, @"%s is not available as initializer", "-[PXStoryRecipeManager init]");

  abort();
}

@end