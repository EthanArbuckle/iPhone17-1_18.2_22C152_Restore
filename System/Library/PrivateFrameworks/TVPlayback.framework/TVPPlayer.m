@interface TVPPlayer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)shouldDeactivateAVAudioSession;
+ (id)_audioSelectionCriteriaForPreferredAudioLanguageCodes:(id)a3 mediaItemLoader:(id)a4 prefersAudioDescriptions:(BOOL)a5;
+ (id)_newAVQueuePlayer;
+ (id)_stringForAudioFormat:(int64_t)a3;
+ (id)savedPreferredAudioLanguageCode;
+ (int64_t)_audioFormatForFormatDescription:(opaqueCMFormatDescription *)a3;
+ (int64_t)tvpVideoRangeForVideoDynamicRange:(int)a3;
+ (void)_playerDidBecomeInactive:(id)a3;
+ (void)_playerWillBecomeActive:(id)a3;
+ (void)_updateAudioSelectionCriteriaForAVQueuePlayer:(id)a3 mediaItemLoader:(id)a4 preferredAudioLanguageCodes:(id)a5 prefersAudioDescriptions:(BOOL)a6;
+ (void)initialize;
+ (void)removeTemporaryDownloadDirectory;
+ (void)setShouldDeactivateAVAudioSession:(BOOL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampInfiniteTimeToSeekableRange:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampedElapsedTimeForTime:(SEL)a3 duration:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampedSceneTimeForPlayerTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentMediaItemForwardPlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentMediaItemReversePlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_estimatedCMTimeForPlaybackDate:(SEL)a3 referenceTime:(id)a4 referenceDate:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedElapsedCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedCMTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimeSentToAVKitImageHandler;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startingSeekPrecision;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtStartOfSeek;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeBeingSeekedTo;
- (AVPlayerItem)unqueuedPlayerItem;
- (AVQueuePlayer)AVQueuePlayer;
- (AVQueuePlayer)earlyAVQueuePlayer;
- (BOOL)_beingUsedForIFrameOnlyPlayback;
- (BOOL)_currentPlayerItemCanScanAtRate:(double)a3;
- (BOOL)_currentPlayerItemContainsDates;
- (BOOL)_getStringForTitleLabel:(id *)a3 subtitleLabel:(id *)a4 forMediaItem:(id)a5;
- (BOOL)_isPlaybackLikelyToKeepUp;
- (BOOL)_isScreenBeingRecorded;
- (BOOL)allowsCellularUsage;
- (BOOL)allowsConstrainedNetworkUsage;
- (BOOL)allowsExternalPlayback;
- (BOOL)asyncDelegateInProgress;
- (BOOL)createsPlayerItemButDoesNotEnqueue;
- (BOOL)currentMediaItemHasDates;
- (BOOL)currentMediaItemHasVideoContent;
- (BOOL)currentMediaItemInitialLoadingComplete;
- (BOOL)currentMediaItemIsStreaming;
- (BOOL)currentMediaItemPreparedForLoading;
- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer;
- (BOOL)handleRemoteCommandsWithoutUpdatingMediaRemote;
- (BOOL)haveEverEnqueuedPlayerItem;
- (BOOL)initialMediaItemHasCompletedInitialLoading;
- (BOOL)interactive;
- (BOOL)invalidated;
- (BOOL)isLive;
- (BOOL)limitReadAhead;
- (BOOL)limitsBandwidthForCellularAccess;
- (BOOL)loadingInitialItemInPlaylist;
- (BOOL)mediaRemoteUpdatingEnabled;
- (BOOL)modifyingAVPlayerQueue;
- (BOOL)modifyingAVPlayerRate;
- (BOOL)muted;
- (BOOL)outputObscuredDueToInsufficientExternalProtection;
- (BOOL)pausesOnHDCPProtectionDown;
- (BOOL)pausesOnRouteChange;
- (BOOL)playerItem:(id)a3 shouldSeekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6;
- (BOOL)playerItemChangeIsHappening;
- (BOOL)prefersAudioDescriptions;
- (BOOL)prefersSDRVideo;
- (BOOL)preventsSleepDuringVideoPlayback;
- (BOOL)remainLoadingWhenSeekCompletes;
- (BOOL)respondsToRemoteControlEvents;
- (BOOL)sceneCompletelyBuffered;
- (BOOL)seeking;
- (BOOL)sendsPlayerReports;
- (BOOL)updatesBookmarks;
- (BOOL)updatesMediaRemoteInfoAutomatically;
- (BOOL)usesLegacyDelegateBehavior;
- (BOOL)waitsAfterPreparingMediaItems;
- (BOOL)wasMutedPriorToScreenRecording;
- (CGSize)currentMediaItemPresentationSize;
- (CGSize)iFramePrefetchMaxSize;
- (CGSize)preferredMaximumResolution;
- (CGSize)preferredMaximumResolutionForExpensiveNetworks;
- (NSArray)audioOptions;
- (NSArray)cachedLoadedTimeRanges;
- (NSArray)cachedSeekableTimeRanges;
- (NSArray)chapterCollections;
- (NSArray)pendingSelectedMediaArray;
- (NSArray)playbackEndTimeBoundaryObserverTokens;
- (NSArray)subtitleOptions;
- (NSDate)dateBeingSeekedTo;
- (NSDate)playbackDate;
- (NSDate)playbackDateAtStartOfSeek;
- (NSDate)startDate;
- (NSHashTable)videoViewWeakReferences;
- (NSMutableArray)asyncDelegateOperations;
- (NSMutableDictionary)boundaryTimeObserverInfos;
- (NSMutableDictionary)elapsedTimeObserverBlocks;
- (NSMutableDictionary)reportingValues;
- (NSMutableSet)mediaItemLoaders;
- (NSNumber)temporarySubtitleOverrideType;
- (NSString)mediaItemChangeReason;
- (NSString)name;
- (NSString)preferredAudioLanguageCode;
- (NSString)reportingCategory;
- (OS_dispatch_queue)avAssetTrackInspectionQueue;
- (TVPASyncPlaybackDelegate)asyncDelegate;
- (TVPAudioOption)cachedSelectedAudioOption;
- (TVPAudioOption)selectedAudioOption;
- (TVPChapter)currentChapter;
- (TVPChapterCollection)currentChapterCollection;
- (TVPDateRange)seekableDateRange;
- (TVPExternalImagePlayer)externalImagePlayer;
- (TVPInterstitial)currentInterstitial;
- (TVPInterstitialCollection)currentInterstitialCollection;
- (TVPMediaItem)currentMediaItem;
- (TVPMediaItemLoader)currentMediaItemLoader;
- (TVPPlaybackDelegate)delegate;
- (TVPPlaybackState)postAVKitScanningState;
- (TVPPlaybackState)postLoadingState;
- (TVPPlaybackState)state;
- (TVPPlayer)init;
- (TVPPlayer)initWithName:(id)a3;
- (TVPPlayerBookmarkMonitor)bookmarkMonitor;
- (TVPPlayerItem)currentPlayerItem;
- (TVPPlayerItem)playerItemFromCacheManager;
- (TVPPlayerReporter)playerReporter;
- (TVPPlaylist)playlistInternal;
- (TVPProgressiveJumpingScrubber)progressiveJumpingScrubber;
- (TVPStateMachine)stateMachine;
- (TVPSubtitleOption)selectedSubtitleOption;
- (TVPTimeRange)bufferedTimeRange;
- (TVPTimeRange)seekableTimeRange;
- (double)cachedElapsedTime;
- (double)duration;
- (double)elapsedTime;
- (double)forwardPlaybackEndTime;
- (double)maximumBitRate;
- (double)preferredForwardBufferDuration;
- (double)rate;
- (double)rateUsedForPlayback;
- (double)reversePlaybackEndTime;
- (double)startPosition;
- (float)volume;
- (id)AVKitExternalImageScanningUpdateBlock;
- (id)AVQueuePlayerCreateIfNecessary:(BOOL)a3;
- (id)_assetTracksOfType:(id)a3 fromTracks:(id)a4;
- (id)_bitRateString:(double)a3;
- (id)_currentDateFromPlayerItem:(id)a3;
- (id)_descriptionForVideoRange:(int64_t)a3;
- (id)_descriptionForVideoResolutionClass:(int64_t)a3;
- (id)_estimatedPlaybackDateForCMTime:(id *)a3;
- (id)_soundCheckNormalizationForMediaItem:(id)a3;
- (id)_statesThatReturnAVPlayerTime;
- (id)_statesThatReturnSeekTime;
- (id)_statesThatReturnStartTime;
- (id)accessLog;
- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4;
- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4;
- (id)addElapsedTimeObserver:(id)a3;
- (id)beginCoordinatedPlaybackSuspensionWithReason:(id)a3;
- (id)chapterBoundaryTimeObserverToken;
- (id)errorLog;
- (id)highFrequencyElapsedTimeObserverBlock;
- (id)highFrequencyTimeObserverToken;
- (id)interstitialBoundaryTimeObserverToken;
- (id)periodicTimeObserverToken;
- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4;
- (id)playbackErrorFromError:(id)a3 forMediaItem:(id)a4;
- (id)selectedSubtitleOptionWithNoOffOrAutoOption;
- (id)timeJumpPeriodicObserverToken;
- (id)timedMetadata;
- (int)_videoTrackIDFromTracks:(id)a3;
- (int64_t)currentDirectionOfPlaylistChange;
- (int64_t)currentMediaItemAudioChannels;
- (int64_t)currentMediaItemAudioFormat;
- (int64_t)currentMediaItemVideoRange;
- (int64_t)currentScanMode;
- (int64_t)errorBehavior;
- (int64_t)externalPlaybackType;
- (int64_t)loadingSubstate;
- (int64_t)mediaItemEndAction;
- (int64_t)numOutstandingSeeks;
- (void)_addBoundaryTimeObserversToAVQueuePlayer:(id)a3;
- (void)_addHighFrequencyTimeObserverIfNecessary;
- (void)_addObserversForMediaItem:(id)a3;
- (void)_addObserversForMediaItemLoader:(id)a3;
- (void)_addObserversForPlayerItem:(id)a3;
- (void)_addObserversForPlaylist:(id)a3;
- (void)_addObserversToAVQueuePlayer:(id)a3;
- (void)_addPeriodicTimeObserverToAVQueuePlayer:(id)a3;
- (void)_addPlaybackEndTimeBoundaryObservers;
- (void)_audioRouteChanged:(id)a3;
- (void)_avPlayerRateDidChange:(id)a3;
- (void)_avPlayerRateDidChangeTo:(float)a3;
- (void)_avPlayerTimeDidChangeTo:(id *)a3;
- (void)_configureSoundCheckForPlayerItem:(id)a3 tracks:(id)a4;
- (void)_currentMediaItemMetadataDidChange:(id)a3;
- (void)_currentPlayerItemAccessLogDidChange:(id)a3;
- (void)_currentPlayerItemBufferEmptyDidChangeTo:(BOOL)a3;
- (void)_currentPlayerItemBufferFullDidChangeTo:(BOOL)a3;
- (void)_currentPlayerItemDidChangeTo:(id)a3;
- (void)_currentPlayerItemDidFailToPlayToEnd:(id)a3;
- (void)_currentPlayerItemDidHitBeginningOrEnd:(id)a3;
- (void)_currentPlayerItemDidStall:(id)a3;
- (void)_currentPlayerItemDurationDidChangeTo:(id *)a3;
- (void)_currentPlayerItemErrorLogDidChange:(id)a3;
- (void)_currentPlayerItemHasVideoDidChangeTo:(BOOL)a3;
- (void)_currentPlayerItemLikelyToKeepUpDidChangeTo:(BOOL)a3;
- (void)_currentPlayerItemLoadedTimeRangesDidChangeTo:(id)a3;
- (void)_currentPlayerItemMediaSelectionDidChange:(id)a3;
- (void)_currentPlayerItemPresentationSizeDidChangeTo:(CGSize)a3;
- (void)_currentPlayerItemReachedTimeToPauseBuffering:(id)a3;
- (void)_currentPlayerItemReachedTimeToPausePlayback:(id)a3;
- (void)_currentPlayerItemSeekableTimeRangesDidChangeTo:(id)a3;
- (void)_currentPlayerItemStatusDidChangeTo:(int64_t)a3 from:(int64_t)a4;
- (void)_currentPlayerItemTimedMetadataDidChange;
- (void)_currentPlayerItemTracksDidChangeTo:(id)a3 from:(id)a4;
- (void)_currentPlayerItemWillChange;
- (void)_enqueueAsyncDelegateOperation:(id)a3;
- (void)_externalPlaybackActiveDidChange;
- (void)_logAccessLogEvents;
- (void)_logExternalPlaybackType;
- (void)_mediaItemLoader:(id)a3 stateDidChangeTo:(id)a4;
- (void)_notifyListenersOfElapsedTimeChange:(id *)a3 playbackDate:(id)a4 dueToTimeJump:(BOOL)a5;
- (void)_notifyOfBoundaryCrossingBetweenPreviousTime:(id *)a3 updatedTime:(id *)a4;
- (void)_outputObscuredDidChangeTo:(BOOL)a3;
- (void)_playerMutedDidChange;
- (void)_playlistCurrentMediaItemDidChangeWithContext:(id)a3;
- (void)_playlistCurrentMediaItemWillChangeWithContext:(id)a3;
- (void)_playlistEndActionDidChange;
- (void)_playlistNextMediaItemDidChangeWithContext:(id)a3;
- (void)_populatePlayerItem:(id)a3 withMetadataFromMediaItem:(id)a4;
- (void)_postCurrentMediaItemDidChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6;
- (void)_postCurrentMediaItemWillChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6;
- (void)_processNextAsyncDelegateOperation;
- (void)_registerStateMachineHandlers;
- (void)_removeBoundaryTimeObserversFromAVQueuePlayer:(id)a3;
- (void)_removeHighFrequencyTimeObserverIfNecessary;
- (void)_removeObserversForMediaItem:(id)a3;
- (void)_removeObserversForMediaItemLoader:(id)a3;
- (void)_removeObserversForPlayerItem:(id)a3;
- (void)_removeObserversForPlaylist:(id)a3;
- (void)_removeObserversFromAVQueuePlayer:(id)a3;
- (void)_removePeriodicTimeObserverFromAVQueuePlayer:(id)a3;
- (void)_removePlaybackEndTimeBoundaryObservers;
- (void)_resetAndReselectAudioOptions;
- (void)_screenRecordingStateDidChange:(id)a3;
- (void)_selectMediaArray:(id)a3 withItem:(id)a4;
- (void)_setSelectedSubtitleOption:(id)a3 userOverridesSystemSubtitleSettings:(BOOL)a4;
- (void)_setState:(id)a3 updatedRate:(double)a4 notifyListeners:(BOOL)a5;
- (void)_setState:(id)a3 updatedRate:(double)a4 reason:(id)a5 notifyListeners:(BOOL)a6;
- (void)_subtitleSettingsDidChange;
- (void)_timeControlStatusDidChangeTo:(int64_t)a3 oldStatusNum:(id)a4;
- (void)_updateAVPlayerActionAtItemEnd;
- (void)_updateCurrentMediaItemAudioInfoForPlayerItem:(id)a3 tracks:(id)a4;
- (void)_updateCurrentMediaItemVideoRangeForTracks:(id)a3;
- (void)_updateIsLiveForElapsedTime:(id *)a3;
- (void)_updateSelectedSubtitleForFilteredOptions:(id)a3;
- (void)_updateVideoViewsWithAVQueuePlayer:(id)a3;
- (void)addWeakReferenceToVideoView:(id)a3;
- (void)avKitDidFinishScanning;
- (void)avKitSeekDidComplete;
- (void)changeMediaInDirection:(int64_t)a3;
- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4;
- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4 ignoreDelegate:(BOOL)a5;
- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4;
- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4 ignoreDelegate:(BOOL)a5;
- (void)continueLoadingCurrentItem;
- (void)dealloc;
- (void)endCoordinatedPlaybackSuspension:(id)a3;
- (void)invalidate;
- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)pauseIgnoringDelegate:(BOOL)a3;
- (void)pauseWithAVKitCompletion:(id)a3;
- (void)pauseWithVolumeRampDuration:(double)a3;
- (void)play;
- (void)playIgnoringDelegate:(BOOL)a3;
- (void)playWithAVKitCompletion:(id)a3;
- (void)playWithVolumeRampDuration:(double)a3;
- (void)playerDidHitBeginningOrEnd;
- (void)removeBoundaryTimeObserverWithToken:(id)a3;
- (void)removeElapsedTimeObserverWithToken:(id)a3;
- (void)removeWeakReferenceToVideoView:(id)a3;
- (void)restartPlaybackWithState:(id)a3;
- (void)scanWithRate:(double)a3;
- (void)scanWithRate:(double)a3 withAVKitCompletion:(id)a4;
- (void)selectMediaArray:(id)a3;
- (void)setAVKitExternalImageScanningUpdateBlock:(id)a3;
- (void)setAVQueuePlayer:(id)a3;
- (void)setAllowsCellularUsage:(BOOL)a3;
- (void)setAllowsConstrainedNetworkUsage:(BOOL)a3;
- (void)setAllowsExternalPlayback:(BOOL)a3;
- (void)setAsyncDelegate:(id)a3;
- (void)setAsyncDelegateInProgress:(BOOL)a3;
- (void)setAsyncDelegateOperations:(id)a3;
- (void)setAudioOptions:(id)a3;
- (void)setAvAssetTrackInspectionQueue:(id)a3;
- (void)setBookmarkMonitor:(id)a3;
- (void)setBoundaryTimeObserverInfos:(id)a3;
- (void)setCachedDuration:(id *)a3;
- (void)setCachedElapsedCMTime:(id *)a3;
- (void)setCachedLoadedTimeRanges:(id)a3;
- (void)setCachedSeekableTimeRanges:(id)a3;
- (void)setCachedSelectedAudioOption:(id)a3;
- (void)setChapterBoundaryTimeObserverToken:(id)a3;
- (void)setChapterCollections:(id)a3;
- (void)setCreatesPlayerItemButDoesNotEnqueue:(BOOL)a3;
- (void)setCurrentChapter:(id)a3;
- (void)setCurrentChapterCollection:(id)a3;
- (void)setCurrentDirectionOfPlaylistChange:(int64_t)a3;
- (void)setCurrentInterstitial:(id)a3;
- (void)setCurrentInterstitialCollection:(id)a3;
- (void)setCurrentMediaItem:(id)a3;
- (void)setCurrentMediaItemAudioChannels:(int64_t)a3;
- (void)setCurrentMediaItemAudioFormat:(int64_t)a3;
- (void)setCurrentMediaItemHasDates:(BOOL)a3;
- (void)setCurrentMediaItemHasVideoContent:(BOOL)a3;
- (void)setCurrentMediaItemInitialLoadingComplete:(BOOL)a3;
- (void)setCurrentMediaItemIsStreaming:(BOOL)a3;
- (void)setCurrentMediaItemLoader:(id)a3;
- (void)setCurrentMediaItemPresentationSize:(CGSize)a3;
- (void)setCurrentMediaItemVideoRange:(int64_t)a3;
- (void)setCurrentPlayerItem:(id)a3;
- (void)setDateBeingSeekedTo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEarlyAVQueuePlayer:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5;
- (void)setElapsedTime:(double)a3 precise:(BOOL)a4;
- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4;
- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5;
- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5 withAVKitCompletion:(id)a6;
- (void)setElapsedTimeObserverBlocks:(id)a3;
- (void)setErrorBehavior:(int64_t)a3;
- (void)setExternalImagePlayer:(id)a3;
- (void)setHandleRemoteCommandsWithoutUpdatingMediaRemote:(BOOL)a3;
- (void)setHaveEverEnqueuedPlayerItem:(BOOL)a3;
- (void)setHighFrequencyElapsedTimeObserverBlock:(id)a3;
- (void)setHighFrequencyTimeObserverToken:(id)a3;
- (void)setIFramePrefetchMaxSize:(CGSize)a3;
- (void)setInitialMediaItemHasCompletedInitialLoading:(BOOL)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setInterstitialBoundaryTimeObserverToken:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setIsLive:(BOOL)a3;
- (void)setLastTimeSentToAVKitImageHandler:(id *)a3;
- (void)setLimitReadAhead:(BOOL)a3;
- (void)setLimitsBandwidthForCellularAccess:(BOOL)a3;
- (void)setLoadingInitialItemInPlaylist:(BOOL)a3;
- (void)setMaximumBitRate:(double)a3;
- (void)setMediaItemChangeReason:(id)a3;
- (void)setMediaItemEndAction:(int64_t)a3;
- (void)setMediaItemLoaders:(id)a3;
- (void)setMediaRemoteUpdatingEnabled:(BOOL)a3;
- (void)setModifyingAVPlayerQueue:(BOOL)a3;
- (void)setModifyingAVPlayerRate:(BOOL)a3;
- (void)setMuted:(BOOL)a3;
- (void)setNumOutstandingSeeks:(int64_t)a3;
- (void)setOutputObscuredDueToInsufficientExternalProtection:(BOOL)a3;
- (void)setPausesOnHDCPProtectionDown:(BOOL)a3;
- (void)setPausesOnRouteChange:(BOOL)a3;
- (void)setPendingSelectedMediaArray:(id)a3;
- (void)setPeriodicTimeObserverToken:(id)a3;
- (void)setPlaybackDate:(id)a3;
- (void)setPlaybackDate:(id)a3 withAVKitCompletion:(id)a4;
- (void)setPlaybackDateAtStartOfSeek:(id)a3;
- (void)setPlaybackEndTimeBoundaryObserverTokens:(id)a3;
- (void)setPlaybackHUDString:(id)a3;
- (void)setPlayerItemChangeIsHappening:(BOOL)a3;
- (void)setPlayerItemFromCacheManager:(id)a3;
- (void)setPlayerReporter:(id)a3;
- (void)setPlaylist:(id)a3;
- (void)setPlaylistInternal:(id)a3;
- (void)setPostAVKitScanningState:(id)a3;
- (void)setPostLoadingState:(id)a3;
- (void)setPreferredAudioLanguageCode:(id)a3;
- (void)setPreferredForwardBufferDuration:(double)a3;
- (void)setPreferredMaximumResolution:(CGSize)a3;
- (void)setPreferredMaximumResolutionForExpensiveNetworks:(CGSize)a3;
- (void)setPrefersAudioDescriptions:(BOOL)a3;
- (void)setPrefersSDRVideo:(BOOL)a3;
- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3;
- (void)setProgressiveJumpingScrubber:(id)a3;
- (void)setRateUsedForPlayback:(double)a3;
- (void)setRemainLoadingWhenSeekCompletes:(BOOL)a3;
- (void)setReportingCategory:(id)a3;
- (void)setReportingValueWithNumber:(id)a3 forKey:(id)a4;
- (void)setReportingValueWithString:(id)a3 forKey:(id)a4;
- (void)setReportingValues:(id)a3;
- (void)setRespondsToRemoteControlEvents:(BOOL)a3;
- (void)setSceneCompletelyBuffered:(BOOL)a3;
- (void)setSelectedAudioOption:(id)a3;
- (void)setSelectedSubtitleOption:(id)a3;
- (void)setSendsPlayerReports:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStartPosition:(double)a3;
- (void)setStartTime:(id *)a3;
- (void)setStartingSeekPrecision:(id *)a3;
- (void)setStateMachine:(id)a3;
- (void)setSubtitleOptions:(id)a3;
- (void)setTemporarySubtitleOverrideType:(id)a3;
- (void)setTimeAtStartOfSeek:(id *)a3;
- (void)setTimeBeingSeekedTo:(id *)a3;
- (void)setTimeJumpPeriodicObserverToken:(id)a3;
- (void)setUnqueuedPlayerItem:(id)a3;
- (void)setUpdatesBookmarks:(BOOL)a3;
- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3;
- (void)setUsesLegacyDelegateBehavior:(BOOL)a3;
- (void)setVideoViewWeakReferences:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3;
- (void)setWasMutedPriorToScreenRecording:(BOOL)a3;
- (void)skipToNextChapterInDirection:(int64_t)a3;
- (void)stop;
- (void)stopWithVolumeRampDuration:(double)a3;
- (void)togglePlayPause;
- (void)updateAudioSelectionCriteria;
- (void)updateSubtitleOptions;
- (void)updateSubtitleOptionsAndSelection;
@end

@implementation TVPPlayer

uint64_t __23__TVPPlayer_initialize__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  v1 = (void *)sActivePlayers;
  sActivePlayers = v0;

  dispatch_queue_t v2 = dispatch_queue_create("TVPPlayer AVAudioSession management queue", 0);
  v3 = (void *)sAVAudioSessionQueue;
  sAVAudioSessionQueue = (uint64_t)v2;

  sPlayerLogObject = (uint64_t)os_log_create("com.apple.AppleTV.playback", "TVPPlayer");
  return MEMORY[0x270F9A758]();
}

+ (void)initialize
{
  if (initialize_onceToken_5 != -1) {
    dispatch_once(&initialize_onceToken_5, &__block_literal_global_10);
  }
}

+ (void)removeTemporaryDownloadDirectory
{
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (automaticallyNotifiesObserversForKey__onceToken != -1) {
    dispatch_once(&automaticallyNotifiesObserversForKey__onceToken, &__block_literal_global_223);
  }
  if ([(id)automaticallyNotifiesObserversForKey__keysToNotifyManually containsObject:v4])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___TVPPlayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

uint64_t __50__TVPPlayer_automaticallyNotifiesObserversForKey___block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"playlist", @"currentMediaItem", @"currentMediaItemHasVideoContent", @"currentMediaItemIsStreaming", @"currentMediaItemPresentationSize", @"currentMediaItemHasDates", @"state", @"errorBehavior", @"interactive", @"rate", @"rateUsedForPlayback", @"elapsedTime", @"playbackDate", @"duration", @"muted", @"volume", @"bufferedTimeRange",
    @"seekableTimeRange",
    @"seekableDateRange",
    @"mediaItemEndAction",
    @"maximumBitRate",
    @"startPosition",
    @"accessLog",
    @"errorLog",
    @"playlistInternal",
    @"currentPlayerItem",
    @"cachedDuration",
    @"cachedLoadedTimeRanges",
    @"cachedSeekableTimeRanges",
    @"AVQueuePlayer",
    @"chapterCollections",
    @"currentChapterCollection",
    @"currentChapter",
    @"currentInterstitialCollection",
    @"currentInterstitial",
    @"audioOptions",
    @"subtitleOptions",
    @"selectedAudioOption",
    @"selectedSubtitleOption",
    @"currentMediaItemInitialLoadingComplete",
    @"preventsSleepDuringVideoPlayback",
    @"isLive",
    @"allowsExternalPlayback",
  automaticallyNotifiesObserversForKey__keysToNotifyManually = 0);
  return MEMORY[0x270F9A758]();
}

+ (int64_t)tvpVideoRangeForVideoDynamicRange:(int)a3
{
  if ((a3 - 1) > 9) {
    return 0;
  }
  else {
    return qword_23702FC10[a3 - 1];
  }
}

+ (void)_playerWillBecomeActive:(id)a3
{
  if (a3)
  {
    sNeedsAVAudioSessionDeactivation = 0;
    objc_msgSend((id)sActivePlayers, "addObject:");
  }
}

+ (BOOL)shouldDeactivateAVAudioSession
{
  return sShouldDeactivateAVAudioSession;
}

+ (void)setShouldDeactivateAVAudioSession:(BOOL)a3
{
  sShouldDeactivateAVAudioSession = a3;
}

+ (void)_playerDidBecomeInactive:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v3 = [(id)sActivePlayers count];
    [(id)sActivePlayers removeObject:v6];
    if (v3)
    {
      if (![(id)sActivePlayers count] && sShouldDeactivateAVAudioSession != 0)
      {
        sNeedsAVAudioSessionDeactivation = 1;
        dispatch_time_t v5 = dispatch_time(0, 1000000000);
        dispatch_after(v5, MEMORY[0x263EF83A0], &__block_literal_global_357);
      }
    }
  }
}

void __38__TVPPlayer__playerDidBecomeInactive___block_invoke()
{
  if (sNeedsAVAudioSessionDeactivation == 1)
  {
    sNeedsAVAudioSessionDeactivation = 0;
    dispatch_async((dispatch_queue_t)sAVAudioSessionQueue, &__block_literal_global_359);
  }
}

void __38__TVPPlayer__playerDidBecomeInactive___block_invoke_2()
{
  uint64_t v0 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236FC5000, v0, OS_LOG_TYPE_DEFAULT, "Deactivating audio session since no players are active", buf, 2u);
  }
  v1 = [MEMORY[0x263EF93E0] sharedInstance];
  id v6 = 0;
  [v1 setActive:0 error:&v6];
  id v2 = v6;

  uint64_t v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v5 = 0;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "Done deactivating audio session", v5, 2u);
  }
  if (v2)
  {
    id v4 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
      __38__TVPPlayer__playerDidBecomeInactive___block_invoke_2_cold_1((uint64_t)v2, v4);
    }
  }
}

- (TVPPlayer)init
{
  return [(TVPPlayer *)self initWithName:0];
}

- (TVPPlayer)initWithName:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TVPPlayer;
  dispatch_time_t v5 = [(TVPPlayer *)&v49 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    objc_super v7 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;

    uint64_t v8 = +[TVPPlaybackState stopped];
    v9 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v8;

    *((void *)v5 + 11) = 0;
    *((void *)v5 + 12) = 0x3FF0000000000000;
    *((_DWORD *)v5 + 12) = 1065353216;
    *((void *)v5 + 13) = 0;
    *((void *)v5 + 14) = 0x47EFFFFFE0000000;
    v5[12] = 1;
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    v11 = (void *)*((void *)v5 + 29);
    *((void *)v5 + 29) = v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    v13 = (void *)*((void *)v5 + 30);
    *((void *)v5 + 30) = v12;

    uint64_t v14 = MEMORY[0x263F01090];
    *(_OWORD *)(v5 + 760) = *MEMORY[0x263F01090];
    v15 = (long long *)MEMORY[0x263F010E0];
    *((void *)v5 + 97) = *(void *)(v14 + 16);
    long long v47 = *v15;
    *((_OWORD *)v5 + 46) = *v15;
    uint64_t v16 = *((void *)v15 + 2);
    *((void *)v5 + 94) = v16;
    *(_OWORD *)(v5 + 616) = v47;
    *((void *)v5 + 79) = v16;
    *((void *)v5 + 82) = v16;
    *((_OWORD *)v5 + 40) = v47;
    *((void *)v5 + 50) = 0;
    uint64_t v17 = +[TVPPlaybackState playing];
    v18 = (void *)*((void *)v5 + 26);
    *((void *)v5 + 26) = v17;

    uint64_t v19 = +[TVPPlaybackState playing];
    v20 = (void *)*((void *)v5 + 27);
    *((void *)v5 + 27) = v19;

    *((_OWORD *)v5 + 43) = v47;
    *((void *)v5 + 88) = v16;
    *(_OWORD *)(v5 + 712) = v47;
    *((void *)v5 + 91) = v16;
    v5[32] = 1;
    long long v48 = *MEMORY[0x263F001B0];
    *(_OWORD *)(v5 + 552) = *MEMORY[0x263F001B0];
    v5[27] = 1;
    v21 = [[TVPPlayerBookmarkMonitor alloc] initWithPlayer:v5];
    v22 = (void *)*((void *)v5 + 35);
    *((void *)v5 + 35) = v21;

    v5[28] = 1;
    v23 = [[TVPPlayerReporter alloc] initWithPlayer:v5];
    v24 = (void *)*((void *)v5 + 36);
    *((void *)v5 + 36) = v23;

    *(_WORD *)(v5 + 15) = 1;
    v5[41] = 0;
    v5[17] = 0;
    v5[25] = 0;
    *(_OWORD *)(v5 + 600) = v48;
    uint64_t v25 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v26 = (void *)*((void *)v5 + 38);
    *((void *)v5 + 38) = v25;

    id v27 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v28 = (void *)*((void *)v5 + 39);
    *((void *)v5 + 39) = v27;

    id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
    v30 = (void *)*((void *)v5 + 56);
    *((void *)v5 + 56) = v29;

    *((void *)v5 + 22) = 0;
    *(_OWORD *)(v5 + 568) = v48;
    *(_OWORD *)(v5 + 584) = v48;
    v5[31] = 0;
    v5[22] = 1;
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.TVPlayback.AVAssetTrackInspectionQueue", 0);
    v32 = (void *)*((void *)v5 + 45);
    *((void *)v5 + 45) = v31;

    id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v34 = (void *)*((void *)v5 + 46);
    *((void *)v5 + 46) = v33;

    v5[23] = 1;
    v35 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v36 = *MEMORY[0x263EF9248];
    v37 = [MEMORY[0x263EF93E0] sharedInstance];
    [v35 addObserver:v5 selector:sel__audioRouteChanged_ name:v36 object:v37];

    v38 = [MEMORY[0x263F08A00] defaultCenter];
    [v38 addObserver:v5 selector:sel__screenRecordingStateDidChange_ name:*MEMORY[0x263F12440] object:0];

    id v39 = objc_alloc(MEMORY[0x263F089D8]);
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = initWithName__instanceNumber++;
    v42 = (void *)[v39 initWithFormat:@"%@ %ld", v40, v41];
    v43 = v42;
    if (v4) {
      [v42 appendFormat:@" (%@)", v4];
    }
    v44 = [[TVPStateMachine alloc] initWithName:v43 initialState:@"Stopped" mode:0];
    v45 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v44;

    [*((id *)v5 + 24) setLogObject:sPlayerLogObject];
    [v5 _registerStateMachineHandlers];
    [*((id *)v5 + 24) setShouldAcceptEvents:1];
  }
  return (TVPPlayer *)v5;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    stateMachine = self->_stateMachine;
    dispatch_time_t v5 = v3;
    uint64_t v6 = [(TVPStateMachine *)stateMachine name];
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }
  if (!self->_invalidated)
  {
    objc_super v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF488];
    v9 = NSString;
    uint64_t v10 = [(TVPStateMachine *)self->_stateMachine name];
    v11 = [v9 stringWithFormat:@"Instance of TVPPlayer with name [%@] was deallocated without being invalidated", v10];
    id v12 = [v7 exceptionWithName:v8 reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)TVPPlayer;
  [(TVPPlayer *)&v13 dealloc];
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![(TVPPlayer *)self invalidated])
  {
    uint64_t v3 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      stateMachine = self->_stateMachine;
      dispatch_time_t v5 = v3;
      uint64_t v6 = [(TVPStateMachine *)stateMachine name];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v6;
      _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "%@ invalidated", buf, 0xCu);
    }
    [(TVPPlayer *)self setInvalidated:1];
    objc_super v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __23__TVPPlayer_invalidate__block_invoke;
    v15[3] = &unk_264CC5470;
    v15[4] = self;
    uint64_t v8 = (void (**)(void))MEMORY[0x237E144A0](v15);
    v9 = [(TVPPlayer *)self stateMachine];
    uint64_t v10 = [v9 eventCount];

    if (v10)
    {
      v11 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "During invalidation, deferring cleanup to give stack a chance to unwind", buf, 2u);
      }
      id v12 = [(TVPPlayer *)self stateMachine];
      [v12 setShouldAcceptEvents:0];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __23__TVPPlayer_invalidate__block_invoke_392;
      block[3] = &unk_264CC5888;
      block[4] = self;
      uint64_t v14 = v8;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v8[2](v8);
    }
  }
}

void __23__TVPPlayer_invalidate__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  dispatch_time_t v5 = @"Being invalidated key";
  v6[0] = MEMORY[0x263EFFA88];
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postEvent:@"Set playlist" withContext:0 userInfo:v3];

  id v4 = [*(id *)(a1 + 32) stateMachine];
  [v4 deregisterHandlers];
}

uint64_t __23__TVPPlayer_invalidate__block_invoke_392(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 setShouldAcceptEvents:1];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = v12;
  if ((void *)__TVPSettingsPreferVideoDescriptionsKVOContext == a6)
  {
    [(TVPPlayer *)self _preferVideoDescriptionsSettingDidChange];
    goto LABEL_55;
  }
  if ((void *)__TVPSettingsSubtitleDisplayTypeKVOContext == a6
    || (void *)__TVPSettingsPreferredSubtitleLanguageDidChangeKVOContext == a6
    || (void *)__TVPSettingsPreferSDHOverRegularSubtitlesKVOContext == a6)
  {
    [(TVPPlayer *)self _subtitleSettingsDidChange];
    goto LABEL_55;
  }
  if ((void *)__TVPMediaItemLoaderStateKVOContext_0 == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    [(TVPPlayer *)self _mediaItemLoader:v11 stateDidChangeTo:v14];
LABEL_54:

    goto LABEL_55;
  }
  if ((void *)__TVPPlaylistEndActionKVOContext == a6)
  {
    [(TVPPlayer *)self _playlistEndActionDidChange];
    goto LABEL_55;
  }
  if ((void *)__AVPlayerMutedKVOContext == a6)
  {
    [(TVPPlayer *)self _playerMutedDidChange];
    goto LABEL_55;
  }
  if ((void *)__TVPPlaylistCurrentMediaItemKVOContext == a6)
  {
    v15 = [v12 objectForKey:*MEMORY[0x263F081C0]];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      uint64_t v14 = [(TVPPlayer *)self playlist];
      uint64_t v17 = [v14 changeContext];
      [(TVPPlayer *)self _playlistCurrentMediaItemWillChangeWithContext:v17];
LABEL_53:

      goto LABEL_54;
    }
    uint64_t v14 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    v20 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v20)
    {

      uint64_t v14 = 0;
    }
    uint64_t v17 = [(TVPPlayer *)self playlist];
    uint64_t v19 = [v17 changeContext];
    [(TVPPlayer *)self _playlistCurrentMediaItemDidChangeWithContext:v19];
LABEL_39:

    goto LABEL_53;
  }
  if ((void *)__TVPPlaylistNextMediaItemKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v18 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v18)
    {

      uint64_t v14 = 0;
    }
    uint64_t v17 = [(TVPPlayer *)self playlist];
    uint64_t v19 = [v17 changeContext];
    [(TVPPlayer *)self _playlistNextMediaItemDidChangeWithContext:v19];
    goto LABEL_39;
  }
  if ((void *)__AVPlayerItemStatusKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    uint64_t v17 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    if (!v14
      || ([MEMORY[0x263EFF9D0] null],
          v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v14 == v21))
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = [v14 integerValue];
    }
    if (!v17
      || ([MEMORY[0x263EFF9D0] null],
          v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v17 == v24))
    {
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = [v17 integerValue];
    }
    [(TVPPlayer *)self _currentPlayerItemStatusDidChangeTo:v25 from:v22];
    goto LABEL_53;
  }
  if ((void *)__AVPlayerItemDurationKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    long long v50 = *MEMORY[0x263F01090];
    uint64_t v51 = *(void *)(MEMORY[0x263F01090] + 16);
    if (v14)
    {
      v23 = [MEMORY[0x263EFF9D0] null];

      if (v14 != v23) {
        [v14 CMTimeValue];
      }
    }
    long long v48 = v50;
    uint64_t v49 = v51;
    [(TVPPlayer *)self _currentPlayerItemDurationDidChangeTo:&v48];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemHasVideoContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    if (!v14
      || ([MEMORY[0x263EFF9D0] null],
          v26 = objc_claimAutoreleasedReturnValue(),
          v26,
          v14 == v26))
    {
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = [v14 BOOLValue];
    }
    [(TVPPlayer *)self _currentPlayerItemHasVideoDidChangeTo:v27];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemPresentationSizeContent == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    long long v50 = *MEMORY[0x263F001B0];
    if (v14)
    {
      v28 = [MEMORY[0x263EFF9D0] null];

      if (v14 != v28) {
        [v14 getValue:&v50 size:16];
      }
    }
    [(TVPPlayer *)self _currentPlayerItemPresentationSizeDidChangeTo:v50];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemLikelyToKeepUpKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    if (!v14
      || ([MEMORY[0x263EFF9D0] null],
          id v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          v14 == v29))
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = [v14 BOOLValue];
    }
    [(TVPPlayer *)self _currentPlayerItemLikelyToKeepUpDidChangeTo:v30];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemBufferFullKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    if (!v14
      || ([MEMORY[0x263EFF9D0] null],
          dispatch_queue_t v31 = objc_claimAutoreleasedReturnValue(),
          v31,
          v14 == v31))
    {
      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v32 = [v14 BOOLValue];
    }
    [(TVPPlayer *)self _currentPlayerItemBufferFullDidChangeTo:v32];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemBufferEmptyKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    if (!v14
      || ([MEMORY[0x263EFF9D0] null],
          id v33 = objc_claimAutoreleasedReturnValue(),
          v33,
          v14 == v33))
    {
      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v34 = [v14 BOOLValue];
    }
    [(TVPPlayer *)self _currentPlayerItemBufferEmptyDidChangeTo:v34];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerCurrentItemKVOContext == a6)
  {
    v35 = [v12 objectForKey:*MEMORY[0x263F081C0]];
    uint64_t v14 = v35;
    if (v35 && [v35 BOOLValue])
    {
      [(TVPPlayer *)self _currentPlayerItemWillChange];
      goto LABEL_54;
    }
    uint64_t v17 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    uint64_t v36 = [MEMORY[0x263EFF9D0] null];

    if (v17 == v36)
    {

      uint64_t v17 = 0;
    }
    [(TVPPlayer *)self _currentPlayerItemDidChangeTo:v17];
    goto LABEL_53;
  }
  if ((void *)__AVPlayerTimeControlStatusKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    uint64_t v17 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    v37 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v37)
    {

      uint64_t v14 = 0;
    }
    if (!v17
      || ([MEMORY[0x263EFF9D0] null],
          v38 = objc_claimAutoreleasedReturnValue(),
          v38,
          v17 == v38))
    {
      v42 = [(TVPPlayer *)self AVQueuePlayer];
      uint64_t v39 = [v42 timeControlStatus];
    }
    else
    {
      uint64_t v39 = [v17 integerValue];
    }
    [(TVPPlayer *)self _timeControlStatusDidChangeTo:v39 oldStatusNum:v14];
    goto LABEL_53;
  }
  if ((void *)__AVPlayerOutputObscuredDueToInsufficientExternalProtectionKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    if (!v14
      || ([MEMORY[0x263EFF9D0] null],
          uint64_t v40 = objc_claimAutoreleasedReturnValue(),
          v40,
          v14 == v40))
    {
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v41 = [v14 BOOLValue];
    }
    [(TVPPlayer *)self _outputObscuredDidChangeTo:v41];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerExternalPlaybackActiveKVOContext == a6)
  {
    [(TVPPlayer *)self _externalPlaybackActiveDidChange];
    goto LABEL_55;
  }
  if ((void *)__AVPlayerItemLoadedTimeRangesKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    v43 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v43)
    {

      uint64_t v14 = 0;
    }
    [(TVPPlayer *)self _currentPlayerItemLoadedTimeRangesDidChangeTo:v14];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemSeekableTimeRangesKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    v44 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v44)
    {

      uint64_t v14 = 0;
    }
    [(TVPPlayer *)self _currentPlayerItemSeekableTimeRangesDidChangeTo:v14];
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemTimedMetadataKVOContext == a6)
  {
    [(TVPPlayer *)self _currentPlayerItemTimedMetadataDidChange];
    goto LABEL_55;
  }
  if ((void *)__AVPlayerItemTracksKVOContext == a6)
  {
    uint64_t v14 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    uint64_t v17 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    v45 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v45)
    {

      uint64_t v14 = 0;
    }
    v46 = [MEMORY[0x263EFF9D0] null];

    if (v17 == v46)
    {

      uint64_t v17 = 0;
    }
    [(TVPPlayer *)self _currentPlayerItemTracksDidChangeTo:v17 from:v14];
    goto LABEL_53;
  }
  v47.receiver = self;
  v47.super_class = (Class)TVPPlayer;
  [(TVPPlayer *)&v47 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_55:
}

- (NSString)name
{
  return self->_name;
}

- (void)setPlaylist:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v8 = @"Playlist key";
    v9[0] = a3;
    id v4 = NSDictionary;
    id v5 = a3;
    uint64_t v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_super v7 = [(TVPPlayer *)self stateMachine];
  [v7 postEvent:@"Set playlist" withContext:0 userInfo:v6];
}

- (void)setCurrentMediaItem:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = [TVPPlaylist alloc];
    v8[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

    objc_super v7 = [(TVPPlaylist *)v5 initWithMediaItems:v6 index:0 isCollection:0];
  }
  else
  {
    objc_super v7 = 0;
  }
  [(TVPPlayer *)self setPlaylist:v7];
}

- (TVPMediaItem)currentMediaItem
{
  id v2 = [(TVPPlayer *)self playlist];
  uint64_t v3 = [v2 currentMediaItem];

  return (TVPMediaItem *)v3;
}

- (BOOL)currentMediaItemPreparedForLoading
{
  uint64_t v3 = [(TVPPlayer *)self currentMediaItemLoader];
  id v4 = [v3 state];

  if ([v4 isEqual:0x26EA1A378] & 1) != 0 || (objc_msgSend(v4, "isEqual:", 0x26EA1A398))
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(TVPPlayer *)self currentMediaItemLoader];
    objc_super v7 = [v6 AVAsset];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)setCurrentMediaItemHasVideoContent:(BOOL)a3
{
  if (self->_currentMediaItemHasVideoContent != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"currentMediaItemHasVideoContent"];
    self->_currentMediaItemHasVideoContent = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"currentMediaItemHasVideoContent"];
  }
}

- (BOOL)currentMediaItemHasVideoContent
{
  return self->_currentMediaItemHasVideoContent;
}

- (void)setCurrentMediaItemIsStreaming:(BOOL)a3
{
  if (self->_currentMediaItemIsStreaming != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"currentMediaItemIsStreaming"];
    self->_currentMediaItemIsStreaming = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"currentMediaItemIsStreaming"];
  }
}

- (BOOL)currentMediaItemIsStreaming
{
  return self->_currentMediaItemIsStreaming;
}

- (void)setCurrentMediaItemPresentationSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (self->_currentMediaItemPresentationSize.width != a3.width
    || self->_currentMediaItemPresentationSize.height != a3.height)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"currentMediaItemPresentationSize"];
    self->_currentMediaItemPresentationSize.CGFloat width = width;
    self->_currentMediaItemPresentationSize.CGFloat height = height;
    [(TVPPlayer *)self didChangeValueForKey:@"currentMediaItemPresentationSize"];
  }
}

- (CGSize)currentMediaItemPresentationSize
{
  double width = self->_currentMediaItemPresentationSize.width;
  double height = self->_currentMediaItemPresentationSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCurrentMediaItemHasDates:(BOOL)a3
{
  if (self->_currentMediaItemHasDates != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"currentMediaItemHasDates"];
    self->_currentMediaItemHasDates = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"currentMediaItemHasDates"];
  }
}

- (BOOL)currentMediaItemHasDates
{
  return self->_currentMediaItemHasDates;
}

- (void)changeMediaInDirection:(int64_t)a3
{
}

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4
{
}

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4 ignoreDelegate:(BOOL)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a5) {
    goto LABEL_9;
  }
  v9 = [(TVPPlayer *)self delegate];

  if (v9)
  {
    id v10 = [(TVPPlayer *)self delegate];
    char v11 = [v10 player:self shouldChangeMediaInDirection:a3];

    if ((v11 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_9;
  }
  id v12 = [(TVPPlayer *)self asyncDelegate];

  if (!v12)
  {
LABEL_9:
    int v16 = [(TVPPlayer *)self playlist];
    uint64_t v17 = v16;
    if (a3)
    {
      if (v8)
      {
        v28 = @"TVPPlaybackCurrentMediaItemChangeReasonKey";
        id v29 = v8;
        uint64_t v18 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }
      [v17 changeMedia:1 withContext:v18];
    }
    else if ([v16 endAction] == 1 && (objc_msgSend(v17, "moreItemsAvailable:", 0) & 1) == 0)
    {
      uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
      [v19 postNotificationName:@"TVPPlaybackPlaylistDidFinishNotification" object:self];

      v20 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "Sending pause event on changeMediaInDirection because playlist end action is TVPPlaylistEndActionPause.", (uint8_t *)&buf, 2u);
      }
      uint64_t v18 = [(TVPPlayer *)self stateMachine];
      uint64_t v32 = @"Ignore delegate key";
      v33[0] = MEMORY[0x263EFFA88];
      v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      [v18 postEvent:@"Pause" withContext:0 userInfo:v21];
    }
    else
    {
      if (v8)
      {
        uint64_t v30 = @"TVPPlaybackCurrentMediaItemChangeReasonKey";
        id v31 = v8;
        uint64_t v18 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }
      [v17 changeMedia:0 withContext:v18];
    }

    goto LABEL_24;
  }
  objc_super v13 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeMediaInDirection returning NO until delegate is consulted", (uint8_t *)&buf, 2u);
  }
  objc_initWeak(&buf, self);
  uint64_t v14 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
  objc_initWeak(&location, v14);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke;
  v22[3] = &unk_264CC5900;
  objc_copyWeak(&v24, &buf);
  v25[1] = (id)a3;
  objc_copyWeak(v25, &location);
  id v23 = v8;
  [(TVPAsyncPlayerDelegateOperation *)v14 setBlock:v22];
  id v15 = objc_loadWeakRetained(&buf);
  [v15 _enqueueAsyncDelegateOperation:v14];

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  objc_destroyWeak(&buf);
LABEL_24:
}

void __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke(uint64_t a1)
{
  id v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeMediaInDirection calling delegate", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained asyncDelegate];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_399;
  v7[3] = &unk_264CC58D8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 40));
  v10[1] = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  [v4 player:v5 shouldChangeMediaInDirection:v6 completion:v7];

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_399(id *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v5 = objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = [v5 asyncDelegateOperations];
  objc_super v7 = [v6 firstObject];
  int v8 = [v7 isEqual:WeakRetained];

  if (v8)
  {
    id v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      if (a2) {
        id v10 = @"YES";
      }
      *(_DWORD *)id buf = 138412290;
      uint64_t v19 = v10;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeMediaInDirection response: %@", buf, 0xCu);
    }
    id v11 = objc_loadWeakRetained(a1 + 6);
    id v12 = [v11 asyncDelegateOperations];
    [v12 removeObjectAtIndex:0];

    if (a2)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_406;
      block[3] = &unk_264CC58B0;
      objc_copyWeak(v17, a1 + 6);
      v17[1] = a1[7];
      id v16 = a1[4];
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(v17);
    }
    id v13 = objc_loadWeakRetained(a1 + 6);
    [v13 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_10:
    uint64_t v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring shouldChangeMediaInDirection response", buf, 2u);
    }
  }
}

void __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_406(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained changeMediaInDirection:*(void *)(a1 + 48) reason:*(void *)(a1 + 32) ignoreDelegate:1];
}

- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4
{
}

- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4 ignoreDelegate:(BOOL)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a5) {
    goto LABEL_9;
  }
  id v9 = [(TVPPlayer *)self delegate];

  if (v9)
  {
    id v10 = [(TVPPlayer *)self delegate];
    char v11 = [v10 player:self shouldChangeToMediaAtIndex:a3];

    if ((v11 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  id v12 = [(TVPPlayer *)self asyncDelegate];

  if (!v12)
  {
LABEL_9:
    if (v8)
    {
      id v24 = @"TVPPlaybackCurrentMediaItemChangeReasonKey";
      v25[0] = v8;
      id v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    }
    else
    {
      id v16 = 0;
    }
    uint64_t v17 = [(TVPPlayer *)self playlist];
    [v17 changeToActiveListIndex:a3 withContext:v16];

    goto LABEL_13;
  }
  id v13 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Async delegate: changeToMediaAtIndex returning NO until delegate is consulted", (uint8_t *)&buf, 2u);
  }
  objc_initWeak(&buf, self);
  uint64_t v14 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
  objc_initWeak(&location, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke;
  v18[3] = &unk_264CC5900;
  objc_copyWeak(&v20, &buf);
  v21[1] = (id)a3;
  objc_copyWeak(v21, &location);
  id v19 = v8;
  [(TVPAsyncPlayerDelegateOperation *)v14 setBlock:v18];
  id v15 = objc_loadWeakRetained(&buf);
  [v15 _enqueueAsyncDelegateOperation:v14];

  objc_destroyWeak(v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  objc_destroyWeak(&buf);
LABEL_13:
}

void __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke(uint64_t a1)
{
  id v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeToMediaAtIndex calling delegate", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained asyncDelegate];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_408;
  v7[3] = &unk_264CC58D8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 40));
  v10[1] = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  [v4 player:v5 shouldChangeToMediaAtIndex:v6 completion:v7];

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_408(id *a1, int a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v5 = objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = [v5 asyncDelegateOperations];
  objc_super v7 = [v6 firstObject];
  int v8 = [v7 isEqual:WeakRetained];

  if (v8)
  {
    id v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      if (a2) {
        id v10 = @"YES";
      }
      *(_DWORD *)id buf = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeToMediaAtIndex response: %@", buf, 0xCu);
    }
    id v11 = objc_loadWeakRetained(a1 + 6);
    id v12 = [v11 asyncDelegateOperations];
    [v12 removeObjectAtIndex:0];

    if (a2)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_409;
      block[3] = &unk_264CC58B0;
      objc_copyWeak(v17, a1 + 6);
      v17[1] = a1[7];
      id v16 = a1[4];
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(v17);
    }
    id v13 = objc_loadWeakRetained(a1 + 6);
    [v13 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_10:
    uint64_t v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring shouldChangeToMediaAtIndex response", buf, 2u);
    }
  }
}

void __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_409(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained changeToMediaAtIndex:*(void *)(a1 + 48) reason:*(void *)(a1 + 32) ignoreDelegate:1];
}

- (TVPPlaybackState)state
{
  return self->_state;
}

- (void)setErrorBehavior:(int64_t)a3
{
  if (self->_errorBehavior != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"errorBehavior"];
    self->_errorBehavior = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"errorBehavior"];
  }
}

- (int64_t)errorBehavior
{
  return self->_errorBehavior;
}

- (void)setInteractive:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_interactive != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"interactive"];
    self->_interactive = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"interactive"];
    memset(&v17, 0, sizeof(v17));
    if ([(TVPPlayer *)self interactive]) {
      CMTimeMakeWithSeconds(&v17, -1.0, 1000000);
    }
    else {
      CMTime v17 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(TVPPlayer *)self AVQueuePlayer];
    uint64_t v6 = [v5 items];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          CMTime v12 = v17;
          [v11 setMaximumTrailingBufferDuration:&v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (double)rate
{
  uint64_t v3 = [(TVPPlayer *)self stateMachine];
  id v4 = [v3 currentState];

  if (([v4 isEqualToString:@"Scanning using external images"] & 1) != 0
    || ([v4 isEqualToString:@"Scanning using external images driven by AVKit"] & 1) != 0
    || [v4 isEqualToString:@"Waiting for AVKit seek after finishing external image scanning"])
  {
    id v5 = [(TVPPlayer *)self externalImagePlayer];
LABEL_5:
    uint64_t v6 = v5;
    [v5 rate];
    double v8 = v7;
    goto LABEL_6;
  }
  if (([v4 isEqualToString:@"Scrubbing using progressive jumping"] & 1) != 0
    || [v4 isEqualToString:@"Scrubbing using progressive jumping waiting for seek"])
  {
    id v5 = [(TVPPlayer *)self progressiveJumpingScrubber];
    goto LABEL_5;
  }
  id v10 = [(TVPPlayer *)self state];
  uint64_t v11 = +[TVPPlaybackState playing];
  if (v10 == (void *)v11)
  {
  }
  else
  {
    CMTime v12 = (void *)v11;
    long long v13 = [(TVPPlayer *)self state];
    long long v14 = +[TVPPlaybackState scanning];

    double v8 = 0.0;
    if (v13 != v14) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = [(TVPPlayer *)self AVQueuePlayer];
  [v6 rate];
  double v8 = v15;
LABEL_6:

LABEL_7:
  return v8;
}

- (void)setRateUsedForPlayback:(double)a3
{
  if (self->_rateUsedForPlayback != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"rateUsedForPlayback"];
    self->_rateUsedForPlayback = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"rateUsedForPlayback"];
    id v5 = [(TVPPlayer *)self stateMachine];
    [v5 postEvent:@"Rate used for playback did change"];
  }
}

- (double)rateUsedForPlayback
{
  return self->_rateUsedForPlayback;
}

- (void)continueLoadingCurrentItem
{
  id v2 = [(TVPPlayer *)self stateMachine];
  [v2 postEvent:@"Continue loading current item"];
}

- (void)play
{
  id v2 = [(TVPPlayer *)self stateMachine];
  [v2 postEvent:@"Play"];
}

- (void)playIgnoringDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = [(TVPPlayer *)self stateMachine];
  double v7 = @"Ignore delegate key";
  id v5 = [NSNumber numberWithBool:v3];
  v8[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postEvent:@"Play" withContext:0 userInfo:v6];
}

- (void)playWithVolumeRampDuration:(double)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = [(TVPPlayer *)self stateMachine];
  double v7 = @"Volume ramp duration key";
  id v5 = [NSNumber numberWithDouble:a3];
  v8[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postEvent:@"Play" withContext:0 userInfo:v6];
}

- (void)playWithAVKitCompletion:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    double v7 = @"Play completion key";
    id v4 = (void *)[a3 copy];
    v8[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(TVPPlayer *)self stateMachine];
  [v6 postEvent:@"Play" withContext:0 userInfo:v5];
}

- (void)pause
{
  id v2 = [(TVPPlayer *)self stateMachine];
  [v2 postEvent:@"Pause"];
}

- (void)pauseWithVolumeRampDuration:(double)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = [(TVPPlayer *)self stateMachine];
  double v7 = @"Volume ramp duration key";
  id v5 = [NSNumber numberWithDouble:a3];
  v8[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postEvent:@"Pause" withContext:0 userInfo:v6];
}

- (void)pauseIgnoringDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = [(TVPPlayer *)self stateMachine];
  double v7 = @"Ignore delegate key";
  id v5 = [NSNumber numberWithBool:v3];
  v8[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postEvent:@"Pause" withContext:0 userInfo:v6];
}

- (void)pauseWithAVKitCompletion:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    double v7 = @"Play completion key";
    id v4 = (void *)[a3 copy];
    v8[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(TVPPlayer *)self stateMachine];
  [v6 postEvent:@"Pause" withContext:0 userInfo:v5];
}

- (void)togglePlayPause
{
  id v13 = [(TVPPlayer *)self state];
  id v3 = +[TVPPlaybackState paused];

  if (v13 == v3)
  {
    id v10 = [(TVPPlayer *)self stateMachine];
    uint64_t v11 = v10;
    CMTime v12 = @"Play";
    goto LABEL_11;
  }
  id v4 = +[TVPPlaybackState playing];
  if (v13 == v4)
  {

    goto LABEL_10;
  }
  id v5 = +[TVPPlaybackState loading];

  if (v13 == v5)
  {
LABEL_10:
    id v10 = [(TVPPlayer *)self stateMachine];
    uint64_t v11 = v10;
    CMTime v12 = @"Pause";
    goto LABEL_11;
  }
  id v6 = +[TVPPlaybackState scanning];

  double v7 = v13;
  if (v13 != v6) {
    goto LABEL_12;
  }
  [(TVPPlayer *)self rate];
  double v9 = v8;
  id v10 = [(TVPPlayer *)self stateMachine];
  uint64_t v11 = v10;
  if (v9 <= -1.0 || v9 >= 1.0) {
    CMTime v12 = @"Play";
  }
  else {
    CMTime v12 = @"Pause";
  }
LABEL_11:
  [v10 postEvent:v12];

  double v7 = v13;
LABEL_12:
}

- (void)scanWithRate:(double)a3
{
}

- (void)scanWithRate:(double)a3 withAVKitCompletion:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  float v15 = @"Rate key";
  double v7 = [NSNumber numberWithDouble:a3];
  v16[0] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  double v9 = (void *)[v8 mutableCopy];

  if (v6)
  {
    id v10 = [(TVPPlayer *)self state];
    uint64_t v11 = +[TVPPlaybackState paused];

    if (v10 == v11) {
      +[TVPPlaybackState paused];
    }
    else {
    CMTime v12 = +[TVPPlaybackState playing];
    }
    [(TVPPlayer *)self setPostAVKitScanningState:v12];

    id v13 = (void *)[v6 copy];
    [v9 setObject:v13 forKey:@"Play completion key"];
  }
  long long v14 = [(TVPPlayer *)self stateMachine];
  [v14 postEvent:@"Scan with rate" withContext:0 userInfo:v9];
}

- (void)stop
{
  id v2 = [(TVPPlayer *)self stateMachine];
  [v2 postEvent:@"Stop"];
}

- (void)stopWithVolumeRampDuration:(double)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = [(TVPPlayer *)self stateMachine];
  double v7 = @"Volume ramp duration key";
  id v5 = [NSNumber numberWithDouble:a3];
  v8[0] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postEvent:@"Stop" withContext:0 userInfo:v6];
}

- (void)setElapsedTime:(double)a3
{
  long long v3 = *MEMORY[0x263F010E0];
  uint64_t v4 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(TVPPlayer *)self setElapsedTime:&v3 seekPrecision:0 ignoreDelegate:0 withAVKitCompletion:a3];
}

- (void)setElapsedTime:(double)a3 precise:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = (long long *)MEMORY[0x263F010E0];
  }
  else {
    uint64_t v4 = (long long *)MEMORY[0x263F010B8];
  }
  long long v5 = *v4;
  uint64_t v6 = *((void *)v4 + 2);
  [(TVPPlayer *)self setElapsedTime:&v5 seekPrecision:0 ignoreDelegate:0 withAVKitCompletion:a3];
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a4;
  [(TVPPlayer *)self setElapsedTime:&v4 seekPrecision:0 ignoreDelegate:0 withAVKitCompletion:a3];
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  [(TVPPlayer *)self setElapsedTime:&v5 seekPrecision:a5 ignoreDelegate:0 withAVKitCompletion:a3];
}

- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5
{
  if (a4)
  {
    -[TVPPlayer setPlaybackDate:withAVKitCompletion:](self, "setPlaybackDate:withAVKitCompletion:", a3);
  }
  else
  {
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    long long v7 = *MEMORY[0x263F010E0];
    uint64_t v8 = *(void *)(MEMORY[0x263F010E0] + 16);
    [(TVPPlayer *)self setElapsedTime:&v7 seekPrecision:0 ignoreDelegate:a5 withAVKitCompletion:a3];
  }
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5 withAVKitCompletion:(id)a6
{
  BOOL v6 = a5;
  v31[3] = *MEMORY[0x263EF8340];
  id v10 = a6;
  memset(&v29, 0, sizeof(v29));
  CMTimeMakeWithSeconds(&v29, a3, 1000000);
  if (a3 == -1000000000.0)
  {
    [(TVPPlayer *)self duration];
    if (v11 == 3.40282347e38)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      CMTime v12 = [(TVPPlayer *)self cachedSeekableTimeRanges];
      +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v12];
    }
    else
    {
      [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    }
    *(_OWORD *)&v29.value = v26;
    CMTimeEpoch epoch = v27;
    goto LABEL_8;
  }
  if (a3 == INFINITY)
  {
    *(_OWORD *)&v29.value = *MEMORY[0x263F010B8];
    CMTimeEpoch epoch = *(void *)(MEMORY[0x263F010B8] + 16);
LABEL_8:
    v29.CMTimeEpoch epoch = epoch;
    goto LABEL_9;
  }
  v21 = [(TVPPlayer *)self currentMediaItem];
  int v22 = [v21 hasTrait:@"TVPMediaItemTraitIsScene"];

  if (!v10 && v22)
  {
    long long v26 = 0uLL;
    *(void *)&long long v27 = 0;
    [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    *(_OWORD *)&lhs.value = v26;
    lhs.CMTimeEpoch epoch = v27;
    CMTime v23 = v29;
    CMTimeAdd(&v25, &lhs, &v23);
    *(_OWORD *)&v29.value = *(_OWORD *)&v25.value;
    CMTimeEpoch epoch = v25.epoch;
    goto LABEL_8;
  }
LABEL_9:
  long long v26 = *(_OWORD *)&v29.value;
  *(void *)&long long v27 = v29.epoch;
  long long v14 = [MEMORY[0x263F08D40] valueWithCMTime:&v26];
  v31[0] = v14;
  v30[0] = @"Elapsed CMTime key";
  v30[1] = @"Seek precision key";
  long long v26 = *(_OWORD *)&a4->var0;
  *(void *)&long long v27 = a4->var3;
  float v15 = [MEMORY[0x263F08D40] valueWithCMTime:&v26];
  v31[1] = v15;
  v30[2] = @"Ignore delegate key";
  long long v16 = [NSNumber numberWithBool:v6];
  v31[2] = v16;
  CMTime v17 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
  uint64_t v18 = (void *)[v17 mutableCopy];

  if (v10)
  {
    uint64_t v19 = (void *)[v10 copy];
    [v18 setObject:v19 forKey:@"Play completion key"];
  }
  uint64_t v20 = [(TVPPlayer *)self stateMachine];
  [v20 postEvent:@"Set elapsed time or date" withContext:0 userInfo:v18];
}

- (double)elapsedTime
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(TVPPlayer *)self elapsedCMTime];
  v3[0] = v3[1];
  return CMTimeGetSeconds(v3);
}

- (double)cachedElapsedTime
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(TVPPlayer *)self cachedElapsedCMTime];
  double result = 0.0;
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v3[0] = v3[1];
    return CMTimeGetSeconds(v3);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedCMTime
{
  uint64_t v5 = [(TVPPlayer *)self stateMachine];
  BOOL v6 = [v5 currentState];

  uint64_t v7 = MEMORY[0x263F010E0];
  long long v36 = *MEMORY[0x263F010E0];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x263F010E0];
  int64_t v8 = *(void *)(v7 + 16);
  retstr->var3 = v8;
  uint64_t v9 = [(TVPPlayer *)self _statesThatReturnStartTime];
  int v10 = [v9 containsObject:v6];

  if (v10)
  {
    [(TVPPlayer *)self startPosition];
    if (v11 > 0.0)
    {
      Float64 v12 = v11;
      id v13 = [(TVPPlayer *)self currentMediaItemLoader];
      long long v14 = [v13 AVAsset];

      if (!v14)
      {
LABEL_11:

        goto LABEL_28;
      }
      memset(&v41, 0, sizeof(v41));
      [v14 duration];
      CMTime time = v41;
      CMTimeMultiplyByFloat64(&time1, &time, v12);
LABEL_10:
      *(CMTime *)retstr = time1;
      goto LABEL_11;
    }
    memset(&v41, 0, sizeof(v41));
    [(TVPPlayer *)self startTime];
    CMTime time1 = v41;
    *(_OWORD *)&time.value = v36;
    time.CMTimeEpoch epoch = v8;
    if (!CMTimeCompare(&time1, &time))
    {
      CMTime v17 = [(TVPPlayer *)self currentMediaItem];
      uint64_t v18 = [v17 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStartTime"];

      uint64_t v19 = [(TVPPlayer *)self currentMediaItem];
      uint64_t v20 = [v19 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStartTimeIsRelativeToMainContent"];
      int v21 = [v20 BOOLValue];

      if (v21)
      {
        int v22 = [(TVPPlayer *)self currentMediaItem];
        CMTime v23 = [v22 mediaItemMetadataForProperty:@"TVPMediaItemMetadataFeatureStartTime"];

        [v18 doubleValue];
        double v25 = v24;
        [v23 doubleValue];
        CMTimeMakeWithSeconds(&time1, v25 + v26, 1000000);
        CMTime v41 = time1;
      }
      else if (v18)
      {
        [v18 floatValue];
        CMTimeMakeWithSeconds(&time1, v32, 1000000);
        CMTime v41 = time1;
      }
    }
    CMTime time = v41;
    [(TVPPlayer *)self _clampInfiniteTimeToSeekableRange:&time];
    goto LABEL_26;
  }
  float v15 = [(TVPPlayer *)self _statesThatReturnAVPlayerTime];
  int v16 = [v15 containsObject:v6];

  if (v16)
  {
    long long v14 = [(TVPPlayer *)self currentPlayerItem];
    if (![v14 status]) {
      goto LABEL_11;
    }
    memset(&v41, 0, sizeof(v41));
    if (v14) {
      [v14 currentTime];
    }
    memset(&time1, 0, sizeof(time1));
    [(TVPPlayer *)self cachedDuration];
    CMTime time = v41;
    [(TVPPlayer *)self _clampedElapsedTimeForTime:&time duration:v38];
    if ((time1.flags & 0x1D) != 1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  long long v27 = [(TVPPlayer *)self _statesThatReturnSeekTime];
  int v28 = [v27 containsObject:v6];

  if (!v28)
  {
    if (([v6 isEqualToString:@"Scanning using external images"] & 1) == 0
      && ([v6 isEqualToString:@"Scanning using external images driven by AVKit"] & 1) == 0
      && ![v6 isEqualToString:@"Waiting for AVKit seek after finishing external image scanning"])
    {
      goto LABEL_28;
    }
    memset(&v41, 0, sizeof(v41));
    uint64_t v30 = [(TVPPlayer *)self externalImagePlayer];
    id v31 = v30;
    if (v30) {
      [v30 elapsedTime];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }

    memset(&time1, 0, sizeof(time1));
    [(TVPPlayer *)self cachedDuration];
    CMTime time = v41;
    [(TVPPlayer *)self _clampedElapsedTimeForTime:&time duration:v37];
    if ((time1.flags & 0x1D) != 1) {
      goto LABEL_28;
    }
LABEL_26:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&time1.value;
    CMTimeEpoch epoch = time1.epoch;
    goto LABEL_27;
  }
  memset(&v41, 0, sizeof(v41));
  [(TVPPlayer *)self timeBeingSeekedTo];
  CMTime time = v41;
  [(TVPPlayer *)self _clampInfiniteTimeToSeekableRange:&time];
  CMTimeEpoch epoch = time1.epoch;
  CMTime v41 = time1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&time1.value;
LABEL_27:
  retstr->var3 = epoch;
LABEL_28:
  id v33 = [(TVPPlayer *)self currentMediaItem];
  int v34 = [v33 hasTrait:@"TVPMediaItemTraitIsScene"];

  if (v34)
  {
    CMTime time1 = (CMTime)*retstr;
    [(TVPPlayer *)self _clampedSceneTimeForPlayerTime:&time1];
    *(CMTime *)retstr = v41;
  }

  return result;
}

- (void)setPlaybackDate:(id)a3
{
}

- (void)setPlaybackDate:(id)a3 withAVKitCompletion:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    id v13 = @"Playback date key";
    v14[0] = a3;
    uint64_t v7 = NSDictionary;
    id v8 = a3;
    uint64_t v9 = [v7 dictionaryWithObjects:v14 forKeys:&v13 count:1];

    int v10 = (void *)[v9 mutableCopy];
    if (v6)
    {
      double v11 = (void *)[v6 copy];
      [v10 setObject:v11 forKey:@"Play completion key"];
    }
    Float64 v12 = [(TVPPlayer *)self stateMachine];
    [v12 postEvent:@"Set elapsed time or date" withContext:0 userInfo:v10];
  }
}

- (NSDate)playbackDate
{
  long long v3 = [(TVPPlayer *)self currentMediaItem];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [v3 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTreatAsTimeBasedNotDateBased"];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = [(TVPPlayer *)self stateMachine];
  id v8 = [v7 currentState];

  uint64_t v9 = [(TVPPlayer *)self _statesThatReturnStartTime];
  int v10 = [v9 containsObject:v8];

  if (!v10)
  {
    Float64 v12 = [(TVPPlayer *)self _statesThatReturnAVPlayerTime];
    int v13 = [v12 containsObject:v8];

    if (v13)
    {
      long long v14 = [(TVPPlayer *)self currentPlayerItem];
      if (![v14 status])
      {
        id v6 = 0;
        goto LABEL_17;
      }
      uint64_t v15 = [(TVPPlayer *)self _currentDateFromPlayerItem:v14];
    }
    else
    {
      int v16 = [(TVPPlayer *)self _statesThatReturnSeekTime];
      int v17 = [v16 containsObject:v8];

      if (v17)
      {
        uint64_t v11 = [(TVPPlayer *)self dateBeingSeekedTo];
        goto LABEL_10;
      }
      if (([v8 isEqualToString:@"Scanning using external images"] & 1) == 0
        && ([v8 isEqualToString:@"Scanning using external images driven by AVKit"] & 1) == 0
        && ![v8 isEqualToString:@"Waiting for AVKit seek after finishing external image scanning"])
      {
        id v6 = 0;
        goto LABEL_18;
      }
      long long v14 = [(TVPPlayer *)self externalImagePlayer];
      uint64_t v15 = [v14 playbackDate];
    }
    id v6 = (void *)v15;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v11 = [(TVPPlayer *)self startDate];
LABEL_10:
  id v6 = (void *)v11;
LABEL_18:

LABEL_19:
  return (NSDate *)v6;
}

- (void)avKitSeekDidComplete
{
  id v2 = [(TVPPlayer *)self stateMachine];
  [v2 postEvent:@"Seek completed"];
}

- (void)avKitDidFinishScanning
{
  long long v3 = [(TVPPlayer *)self postAVKitScanningState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = +[TVPPlaybackState paused];

  if (v3 == v4)
  {
    [(TVPPlayer *)self pauseWithAVKitCompletion:&__block_literal_global_414];
  }
  else
  {
    [(TVPPlayer *)self playWithAVKitCompletion:&__block_literal_global_417];
  }
}

- (id)addElapsedTimeObserver:(id)a3
{
  if (a3)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = (void *)MEMORY[0x263F08C38];
    id v5 = a3;
    id v6 = [v4 UUID];
    uint64_t v7 = [(TVPPlayer *)self elapsedTimeObserverBlocks];
    id v8 = (void *)[v5 copy];

    [v7 setObject:v8 forKey:v6];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)removeElapsedTimeObserverWithToken:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TVPPlayer *)self elapsedTimeObserverBlocks];
    [v5 removeObjectForKey:v4];
  }
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 count];
    uint64_t v9 = 0;
    if (v7 && v8)
    {
      int v10 = objc_alloc_init(TVPBoundaryTimeObserverInfo);
      uint64_t v11 = [MEMORY[0x263EFF980] array];
      Float64 v12 = [(TVPPlayer *)self currentMediaItem];
      int v13 = [v12 hasTrait:@"TVPMediaItemTraitIsScene"];

      int v34 = self;
      id v33 = v10;
      if (v13)
      {
        long long v14 = NSNumber;
        [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
        uint64_t v15 = [v14 numberWithDouble:CMTimeGetSeconds(&time)];
      }
      else
      {
        uint64_t v15 = 0;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v35 = v6;
      id v16 = v6;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(id *)(*((void *)&v37 + 1) + 8 * i);
            if (v15)
            {
              int v22 = NSNumber;
              [v15 doubleValue];
              double v24 = v23;
              [v21 doubleValue];
              uint64_t v26 = [v22 numberWithDouble:v24 + v25];

              id v21 = (id)v26;
            }
            long long v27 = (void *)MEMORY[0x263F08D40];
            [v21 doubleValue];
            CMTimeMakeWithSeconds(&v36, v28, 1000000);
            CMTime v29 = [v27 valueWithCMTime:&v36];
            [v11 addObject:v29];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v18);
      }

      [(TVPBoundaryTimeObserverInfo *)v33 setTimes:v11];
      [(TVPBoundaryTimeObserverInfo *)v33 setHandler:v7];
      uint64_t v9 = [MEMORY[0x263F08C38] UUID];
      uint64_t v30 = [(TVPPlayer *)v34 boundaryTimeObserverInfos];
      [v30 setObject:v33 forKey:v9];

      id v31 = [(TVPPlayer *)v34 AVQueuePlayer];
      [(TVPPlayer *)v34 _addBoundaryTimeObserversToAVQueuePlayer:v31];

      id v6 = v35;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4
{
  return 0;
}

- (void)removeBoundaryTimeObserverWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = [(TVPPlayer *)self boundaryTimeObserverInfos];
    id v6 = [v5 objectForKey:v9];
    id v7 = [v6 tokenFromAVPlayer];
    if (v7)
    {
      uint64_t v8 = [(TVPPlayer *)self AVQueuePlayer];
      [v8 removeTimeObserver:v7];
    }
    [v5 removeObjectForKey:v9];
  }
  MEMORY[0x270F9A758]();
}

- (double)duration
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(TVPPlayer *)self durationCMTime];
  double result = 0.0;
  if ((unsigned __int128)0 >> 96)
  {
    if ((v3[1].flags & 0x1D) == 1)
    {
      v3[0] = v3[1];
      return CMTimeGetSeconds(v3);
    }
    else if ((v3[1].flags & 0x10) != 0)
    {
      return 3.40282347e38;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationCMTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  [(TVPPlayer *)self cachedDuration];
  id v5 = [(TVPPlayer *)self currentMediaItem];
  int v6 = [v5 hasTrait:@"TVPMediaItemTraitIsScene"];

  if (v6)
  {
    [(TVPPlayer *)self _currentMediaItemForwardPlaybackEndTime];
    [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract(&v10, &lhs, &rhs);
    *(CMTime *)retstr = v10;
  }
  return result;
}

- (void)setIsLive:(BOOL)a3
{
  if (self->_isLive != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"isLive"];
    self->_isLive = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"isLive"];
  }
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (void)setMuted:(BOOL)a3
{
  [(TVPPlayer *)self willChangeValueForKey:@"muted"];
  self->_muted = a3;
  id v5 = [(TVPPlayer *)self AVQueuePlayer];
  [v5 setMuted:self->_muted];
  [(TVPPlayer *)self didChangeValueForKey:@"muted"];
}

- (BOOL)muted
{
  long long v3 = [(TVPPlayer *)self AVQueuePlayer];

  if (!v3) {
    return self->_muted;
  }
  id v4 = [(TVPPlayer *)self AVQueuePlayer];
  char v5 = [v4 isMuted];

  return v5;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  [(TVPPlayer *)self willChangeValueForKey:@"allowsExternalPlayback"];
  self->_allowsExternalPlayback = a3;
  id v5 = [(TVPPlayer *)self AVQueuePlayer];
  [v5 setAllowsExternalPlayback:self->_allowsExternalPlayback];
  [(TVPPlayer *)self didChangeValueForKey:@"allowsExternalPlayback"];
}

- (BOOL)allowsExternalPlayback
{
  long long v3 = [(TVPPlayer *)self AVQueuePlayer];

  if (!v3) {
    return self->_allowsExternalPlayback;
  }
  id v4 = [(TVPPlayer *)self AVQueuePlayer];
  char v5 = [v4 allowsExternalPlayback];

  return v5;
}

- (void)setVolume:(float)a3
{
  [(TVPPlayer *)self willChangeValueForKey:@"volume"];
  self->_volume = a3;
  char v5 = [(TVPPlayer *)self AVQueuePlayer];
  *(float *)&double v6 = self->_volume;
  [v5 setVolume:v6];

  [(TVPPlayer *)self didChangeValueForKey:@"volume"];
}

- (float)volume
{
  long long v3 = [(TVPPlayer *)self AVQueuePlayer];

  if (!v3) {
    return self->_volume;
  }
  id v4 = [(TVPPlayer *)self AVQueuePlayer];
  [v4 volume];
  float v6 = v5;

  return v6;
}

- (void)setChapterCollections:(id)a3
{
  float v5 = (NSArray *)a3;
  if (self->_chapterCollections != v5)
  {
    float v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"chapterCollections"];
    objc_storeStrong((id *)&self->_chapterCollections, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"chapterCollections"];
    float v5 = v6;
  }
}

- (NSArray)chapterCollections
{
  return self->_chapterCollections;
}

- (void)setCurrentChapter:(id)a3
{
  float v5 = (TVPChapter *)a3;
  if (self->_currentChapter != v5)
  {
    float v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"currentChapter"];
    objc_storeStrong((id *)&self->_currentChapter, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"currentChapter"];
    float v5 = v6;
  }
}

- (TVPChapter)currentChapter
{
  return self->_currentChapter;
}

- (void)setCurrentChapterCollection:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  float v5 = (TVPChapterCollection *)a3;
  float v6 = v5;
  if (self->_currentChapterCollection != v5)
  {
    if (!v5
      || ([(TVPPlayer *)self chapterCollections],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 containsObject:v6],
          v7,
          v8))
    {
      [(TVPPlayer *)self willChangeValueForKey:@"currentChapterCollection"];
      objc_storeStrong((id *)&self->_currentChapterCollection, a3);
      [(TVPPlayer *)self didChangeValueForKey:@"currentChapterCollection"];
      id v9 = [(TVPPlayer *)self chapterBoundaryTimeObserverToken];
      [(TVPPlayer *)self removeBoundaryTimeObserverWithToken:v9];

      [(TVPPlayer *)self setChapterBoundaryTimeObserverToken:0];
      [(TVPPlayer *)self elapsedTime];
      CMTime v10 = -[TVPChapterCollection chapterForTime:](v6, "chapterForTime:");
      [(TVPPlayer *)self setCurrentChapter:v10];

      uint64_t v20 = [(TVPChapterCollection *)v6 chapters];
      if ([v20 count])
      {
        uint64_t v11 = [MEMORY[0x263EFF980] array];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v12 = v20;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v26;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v12);
              }
              id v16 = NSNumber;
              uint64_t v17 = [*(id *)(*((void *)&v25 + 1) + 8 * v15) timeRange];
              [v17 startTime];
              uint64_t v18 = objc_msgSend(v16, "numberWithDouble:");
              [v11 addObject:v18];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v13);
        }

        objc_initWeak(&location, self);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        id v21[2] = __41__TVPPlayer_setCurrentChapterCollection___block_invoke;
        v21[3] = &unk_264CC5968;
        objc_copyWeak(&v23, &location);
        int v22 = v6;
        uint64_t v19 = [(TVPPlayer *)self addBoundaryTimeObserverForTimes:v11 withHandler:v21];
        [(TVPPlayer *)self setChapterBoundaryTimeObserverToken:v19];

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __41__TVPPlayer_setCurrentChapterCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v3 = *(void **)(a1 + 32);
  id v5 = WeakRetained;
  [v5 elapsedTime];
  id v4 = objc_msgSend(v3, "chapterForTime:");
  [v5 setCurrentChapter:v4];
}

- (TVPChapterCollection)currentChapterCollection
{
  return self->_currentChapterCollection;
}

- (void)skipToNextChapterInDirection:(int64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(TVPPlayer *)self elapsedTime];
  double v6 = v5;
  id v7 = [(TVPPlayer *)self playbackDate];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v8 = [(TVPPlayer *)self currentChapterCollection];
  id v9 = [v8 chapters];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v10)
  {
    id v12 = 0;
LABEL_38:

    goto LABEL_39;
  }
  uint64_t v11 = v10;
  id v31 = self;
  id v12 = 0;
  if (a3 == 1) {
    double v13 = -1.79769313e308;
  }
  else {
    double v13 = 1.79769313e308;
  }
  uint64_t v14 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v17 = [v16 dateRange];

      if (v17) {
        BOOL v18 = v7 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18)
      {
        uint64_t v20 = [v16 timeRange];
        [v20 startTime];
        double v23 = v19 - v6;
      }
      else
      {
        uint64_t v20 = [v16 dateRange];
        id v21 = [v20 startDate];
        [v21 timeIntervalSinceDate:v7];
        double v23 = v22;
      }
      double v24 = -v23;
      if (v23 >= 0.0) {
        double v24 = v23;
      }
      if (v24 > 2.0)
      {
        if (!a3 && (v23 > 0.0 ? (BOOL v25 = v23 < v13) : (BOOL v25 = 0), v25)
          || a3 == 1 && (v23 < 0.0 ? (BOOL v26 = v23 <= v13) : (BOOL v26 = 1), !v26))
        {
          id v27 = v16;

          double v13 = v23;
          id v12 = v27;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v11);

  if (v12)
  {
    id v9 = [v12 timeRange];
    long long v28 = [v12 dateRange];
    CMTime v29 = v28;
    if (v28)
    {
      uint64_t v30 = [v28 startDate];
      [(TVPPlayer *)v31 setPlaybackDate:v30];
    }
    else if (v9)
    {
      [v9 startTime];
      -[TVPPlayer setElapsedTime:](v31, "setElapsedTime:");
    }

    goto LABEL_38;
  }
LABEL_39:
}

- (void)setCurrentInterstitial:(id)a3
{
  double v5 = (TVPInterstitial *)a3;
  if (self->_currentInterstitial != v5)
  {
    double v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"currentInterstitial"];
    objc_storeStrong((id *)&self->_currentInterstitial, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"currentInterstitial"];
    double v5 = v6;
  }
}

- (TVPInterstitial)currentInterstitial
{
  return self->_currentInterstitial;
}

- (void)setCurrentInterstitialCollection:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v5 = (TVPInterstitialCollection *)a3;
  if (self->_currentInterstitialCollection != v5)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"currentInterstitialCollection"];
    objc_storeStrong((id *)&self->_currentInterstitialCollection, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"currentInterstitialCollection"];
    double v6 = [(TVPPlayer *)self interstitialBoundaryTimeObserverToken];
    [(TVPPlayer *)self removeBoundaryTimeObserverWithToken:v6];

    [(TVPPlayer *)self setInterstitialBoundaryTimeObserverToken:0];
    [(TVPPlayer *)self elapsedTime];
    id v7 = -[TVPInterstitialCollection interstitialForTime:](v5, "interstitialForTime:");
    [(TVPPlayer *)self setCurrentInterstitial:v7];

    uint64_t v20 = [(TVPInterstitialCollection *)v5 interstitials];
    if ([v20 count])
    {
      int v8 = [MEMORY[0x263EFF9C0] set];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v20;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v25;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v9);
            }
            double v13 = [*(id *)(*((void *)&v24 + 1) + 8 * v12) timeRange];
            uint64_t v14 = NSNumber;
            [v13 startTime];
            uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
            [v8 addObject:v15];

            id v16 = NSNumber;
            [v13 endTime];
            uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
            [v8 addObject:v17];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }

      objc_initWeak(&location, self);
      BOOL v18 = [v8 allObjects];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      id v21[2] = __46__TVPPlayer_setCurrentInterstitialCollection___block_invoke;
      v21[3] = &unk_264CC5990;
      objc_copyWeak(&v22, &location);
      double v19 = [(TVPPlayer *)self addBoundaryTimeObserverForTimes:v18 withHandler:v21];

      [(TVPPlayer *)self setInterstitialBoundaryTimeObserverToken:v19];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

void __46__TVPPlayer_setCurrentInterstitialCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained stateMachine];
  id v7 = @"Due to time jump key";
  double v5 = [NSNumber numberWithBool:a2];
  v8[0] = v5;
  double v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postEvent:@"Interstitial boundary crossed" withContext:0 userInfo:v6];
}

- (TVPInterstitialCollection)currentInterstitialCollection
{
  return self->_currentInterstitialCollection;
}

- (void)setAudioOptions:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_audioOptions != v5)
  {
    double v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"audioOptions"];
    objc_storeStrong((id *)&self->_audioOptions, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"audioOptions"];
    double v5 = v6;
  }
}

- (NSArray)audioOptions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  audioOptions = self->_audioOptions;
  if (!audioOptions)
  {
    id v4 = [(TVPPlayer *)self currentPlayerItem];
    if ([v4 status] == 1)
    {
      double v5 = [v4 asset];
      double v6 = objc_msgSend(v5, "tvp_sortedAudioAVMediaSelectionOptions");

      id v7 = [MEMORY[0x263EFF980] array];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
            uint64_t v14 = [TVPAudioOption alloc];
            uint64_t v15 = -[TVPAudioOption initWithOption:](v14, "initWithOption:", v13, (void)v18);
            [(NSArray *)v7 addObject:v15];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      id v16 = self->_audioOptions;
      self->_audioOptions = v7;
    }
    audioOptions = self->_audioOptions;
  }
  return audioOptions;
}

- (void)setSelectedAudioOption:(id)a3
{
  id v4 = a3;
  id v8 = [(TVPPlayer *)self currentPlayerItem];
  double v5 = [v4 avMediaSelectionOption];

  double v6 = [v8 asset];
  id v7 = objc_msgSend(v6, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);

  [(TVPPlayer *)self willChangeValueForKey:@"selectedAudioOption"];
  if (v5) {
    [v8 selectMediaOption:v5 inMediaSelectionGroup:v7];
  }
  else {
    [v8 selectMediaOptionAutomaticallyInMediaSelectionGroup:v7];
  }
  [(TVPPlayer *)self didChangeValueForKey:@"selectedAudioOption"];
}

- (TVPAudioOption)selectedAudioOption
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v3 = [(TVPPlayer *)self currentPlayerItem];
  id v4 = v3;
  if (v3 && [v3 status] == 1)
  {
    double v5 = [v4 asset];
    double v6 = objc_msgSend(v5, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);

    id v7 = [v4 currentMediaSelection];
    id v8 = [v7 selectedMediaOptionInMediaSelectionGroup:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [(TVPPlayer *)self audioOptions];
    id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = [v13 avMediaSelectionOption];
          int v15 = [v14 isEqual:v8];

          if (v15)
          {
            id v10 = v13;
            goto LABEL_14;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v10 = 0;
  }

  return (TVPAudioOption *)v10;
}

- (void)setSubtitleOptions:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_subtitleOptions != v5)
  {
    double v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"subtitleOptions"];
    objc_storeStrong((id *)&self->_subtitleOptions, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"subtitleOptions"];
    double v5 = v6;
  }
}

- (NSArray)subtitleOptions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  subtitleOptions = self->_subtitleOptions;
  if (!subtitleOptions)
  {
    id v4 = [(TVPPlayer *)self currentPlayerItem];
    double v5 = v4;
    if (v4 && [v4 status] == 1)
    {
      double v6 = [v5 asset];
      id v7 = objc_msgSend(v6, "tvp_sortedSubtitleAVMediaSelectionOptions");

      id v8 = [MEMORY[0x263EFF980] array];
      uint64_t v9 = +[TVPSubtitleOption offSubtitleOption];
      [(NSArray *)v8 addObject:v9];

      if ([v7 count])
      {
        id v10 = +[TVPSubtitleOption autoSubtitleOption];
        [(NSArray *)v8 addObject:v10];

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v7;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
              long long v17 = [TVPSubtitleOption alloc];
              long long v18 = -[TVPSubtitleOption initWithAVMediaSelectionOption:](v17, "initWithAVMediaSelectionOption:", v16, (void)v24);
              [(NSArray *)v8 addObject:v18];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v13);
        }
      }
      long long v19 = [(TVPPlayer *)self delegate];
      if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        long long v20 = [v19 player:self filteredSubtitleOptionsFromOptions:v8];
        if (([(NSArray *)v8 isEqual:v20] & 1) == 0)
        {
          uint64_t v21 = [MEMORY[0x263EFF980] arrayWithArray:v20];

          [(TVPPlayer *)self performSelector:sel__updateSelectedSubtitleForFilteredOptions_ withObject:v20 afterDelay:0.0];
          id v8 = (NSArray *)v21;
        }
      }
      uint64_t v22 = self->_subtitleOptions;
      self->_subtitleOptions = v8;
    }
    subtitleOptions = self->_subtitleOptions;
  }
  return subtitleOptions;
}

- (void)setSelectedSubtitleOption:(id)a3
{
}

- (TVPSubtitleOption)selectedSubtitleOption
{
  long long v3 = [(TVPPlayer *)self currentPlayerItem];
  id v4 = v3;
  if (!v3 || [v3 status] != 1)
  {
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  double v5 = [v4 asset];
  double v6 = objc_msgSend(v5, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9CD0]);

  id v7 = [v4 currentMediaSelection];
  id v8 = [v7 selectedMediaOptionInMediaSelectionGroup:v6];

  MACaptionAppearanceDisplayType DisplayType = MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
  id v10 = [(TVPSubtitleOption *)[TVPAutoSubtitleOption alloc] initWithAVMediaSelectionOption:v8];
  id v11 = [(TVPPlayer *)self temporarySubtitleOverrideType];
  if (v11 || DisplayType != kMACaptionAppearanceDisplayTypeAutomatic)
  {

LABEL_9:
    if (v8
      && (![v8 hasMediaCharacteristic:*MEMORY[0x263EF9C98]]
       || ([v8 hasMediaCharacteristic:*MEMORY[0x263EF9CB8]] & 1) != 0))
    {
      uint64_t v16 = TVPSubtitleOption;
    }
    else
    {
      uint64_t v16 = TVPOffSubtitleOption;
    }
    uint64_t v14 = (TVPAutoSubtitleOption *)[[v16 alloc] initWithAVMediaSelectionOption:v8];
    goto LABEL_15;
  }
  uint64_t v12 = [(TVPPlayer *)self subtitleOptions];
  int v13 = [v12 containsObject:v10];

  if (!v13) {
    goto LABEL_9;
  }
  uint64_t v14 = v10;
LABEL_15:
  uint64_t v15 = v14;

LABEL_16:
  return (TVPSubtitleOption *)v15;
}

- (id)selectedSubtitleOptionWithNoOffOrAutoOption
{
  id v2 = [(TVPPlayer *)self currentPlayerItem];
  long long v3 = v2;
  if (v2 && [v2 status] == 1)
  {
    id v4 = [v3 asset];
    double v5 = objc_msgSend(v4, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9CD0]);

    double v6 = [v3 currentMediaSelection];
    id v7 = [v6 selectedMediaOptionInMediaSelectionGroup:v5];

    id v8 = [[TVPSubtitleOption alloc] initWithAVMediaSelectionOption:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)updateSubtitleOptions
{
  [(TVPPlayer *)self willChangeValueForKey:@"subtitleOptions"];
  subtitleOptions = self->_subtitleOptions;
  self->_subtitleOptions = 0;

  uint64_t v4 = [(TVPPlayer *)self delegate];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(TVPPlayer *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7) {
      id v8 = [(TVPPlayer *)self subtitleOptions];
    }
  }
  [(TVPPlayer *)self didChangeValueForKey:@"subtitleOptions"];
}

- (void)updateSubtitleOptionsAndSelection
{
  [(TVPPlayer *)self updateSubtitleOptions];
  [(TVPPlayer *)self willChangeValueForKey:@"selectedSubtitleOption"];
  [(TVPPlayer *)self didChangeValueForKey:@"selectedSubtitleOption"];
}

- (void)setCurrentMediaItemInitialLoadingComplete:(BOOL)a3
{
  [(TVPPlayer *)self willChangeValueForKey:@"currentMediaItemInitialLoadingComplete"];
  self->_currentMediaItemInitialLoadingComplete = a3;
  [(TVPPlayer *)self didChangeValueForKey:@"currentMediaItemInitialLoadingComplete"];
}

- (BOOL)currentMediaItemInitialLoadingComplete
{
  return self->_currentMediaItemInitialLoadingComplete;
}

- (TVPTimeRange)bufferedTimeRange
{
  long long v3 = [(TVPPlayer *)self cachedLoadedTimeRanges];
  memset(&v17, 0, sizeof(v17));
  +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v3];
  uint64_t v4 = [(TVPPlayer *)self currentMediaItem];
  int v5 = [v4 hasTrait:@"TVPMediaItemTraitIsScene"];

  if (v5)
  {
    memset(&v16, 0, sizeof(v16));
    [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    [(TVPPlayer *)self _currentMediaItemForwardPlaybackEndTime];
    CMTimeRangeFromTimeToTime(&v16, &start, &end);
    CMTimeRange range = v17;
    memset(&v13, 0, sizeof(v13));
    CMTimeRange otherRange = v16;
    CMTimeRangeGetIntersection(&v13, &range, &otherRange);
    [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    *(_OWORD *)&range.start.value = *(_OWORD *)&v13.start.value;
    range.start.CMTimeEpoch epoch = v13.start.epoch;
    CMTimeSubtract(&v10, &range.start, &v9);
    otherRange.CMTime start = v13.duration;
    CMTimeRangeMake(&range, &v10, &otherRange.start);
    CMTimeRange v17 = range;
  }
  double v6 = [TVPTimeRange alloc];
  CMTimeRange v16 = v17;
  char v7 = [(TVPTimeRange *)v6 initWithCMTimeRange:&v16];

  return v7;
}

- (TVPTimeRange)seekableTimeRange
{
  long long v3 = [(TVPPlayer *)self cachedSeekableTimeRanges];
  memset(&v17, 0, sizeof(v17));
  +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v3];
  uint64_t v4 = [(TVPPlayer *)self currentMediaItem];
  int v5 = [v4 hasTrait:@"TVPMediaItemTraitIsScene"];

  if (v5)
  {
    memset(&v16, 0, sizeof(v16));
    [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    [(TVPPlayer *)self _currentMediaItemForwardPlaybackEndTime];
    CMTimeRangeFromTimeToTime(&v16, &start, &end);
    CMTimeRange range = v17;
    memset(&v13, 0, sizeof(v13));
    CMTimeRange otherRange = v16;
    CMTimeRangeGetIntersection(&v13, &range, &otherRange);
    [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
    *(_OWORD *)&range.start.value = *(_OWORD *)&v13.start.value;
    range.start.CMTimeEpoch epoch = v13.start.epoch;
    CMTimeSubtract(&v10, &range.start, &v9);
    otherRange.CMTime start = v13.duration;
    CMTimeRangeMake(&range, &v10, &otherRange.start);
    CMTimeRange v17 = range;
  }
  double v6 = [TVPTimeRange alloc];
  CMTimeRange v16 = v17;
  char v7 = [(TVPTimeRange *)v6 initWithCMTimeRange:&v16];

  return v7;
}

- (TVPDateRange)seekableDateRange
{
  if ([(TVPPlayer *)self _currentPlayerItemContainsDates])
  {
    long long v3 = [(TVPPlayer *)self cachedSeekableTimeRanges];
    memset(v9, 0, sizeof(v9));
    long long v8 = 0u;
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v3];
    *(_OWORD *)&v7.value = v8;
    v7.CMTimeEpoch epoch = *(void *)&v9[0];
    uint64_t v4 = [(TVPPlayer *)self _estimatedPlaybackDateForCMTime:&v7];
    CMTime v7 = *(CMTime *)((char *)v9 + 8);
    int v5 = [[TVPDateRange alloc] initWithStartDate:v4 duration:CMTimeGetSeconds(&v7)];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (double)forwardPlaybackEndTime
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(TVPPlayer *)self _currentMediaItemForwardPlaybackEndTime];
  double result = 0.0;
  if ((unsigned __int128)0 >> 96)
  {
    v3[0] = v3[1];
    return CMTimeGetSeconds(v3);
  }
  return result;
}

- (double)reversePlaybackEndTime
{
  memset(&v3[1], 0, sizeof(CMTime));
  [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
  double result = 0.0;
  if ((unsigned __int128)0 >> 96)
  {
    v3[0] = v3[1];
    return CMTimeGetSeconds(v3);
  }
  return result;
}

- (void)setMediaItemEndAction:(int64_t)a3
{
  if (self->_mediaItemEndAction != a3)
  {
    [(TVPPlayer *)self willChangeValueForKey:@"mediaItemEndAction"];
    self->_mediaItemEndAction = a3;
    [(TVPPlayer *)self didChangeValueForKey:@"mediaItemEndAction"];
    [(TVPPlayer *)self _updateAVPlayerActionAtItemEnd];
  }
}

- (int64_t)mediaItemEndAction
{
  return self->_mediaItemEndAction;
}

- (void)setMaximumBitRate:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_maximumBitRate != a3)
  {
    self->_maximumBitRate = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(TVPPlayer *)self AVQueuePlayer];
    int v5 = [v4 items];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setPreferredPeakBitRate:self->_maximumBitRate];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (double)maximumBitRate
{
  return self->_maximumBitRate;
}

- (void)playerDidHitBeginningOrEnd
{
  id v2 = [(TVPPlayer *)self stateMachine];
  [v2 postEvent:@"Hit beginning or end"];
}

- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer
{
  if (![(TVPPlayer *)self currentMediaItemIsStreaming]) {
    return 0;
  }
  long long v3 = [(TVPPlayer *)self currentPlayerItem];
  uint64_t v4 = v3;
  if (v3 && [v3 status] == 1) {
    char v5 = [v4 canPlayFastForward];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)seeking
{
  if ([(TVPPlayer *)self numOutstandingSeeks] > 0) {
    return 1;
  }
  uint64_t v4 = [(TVPPlayer *)self stateMachine];
  char v5 = [v4 currentState];
  char v6 = [v5 isEqualToString:@"Waiting for seek"];

  return v6;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  self->_preventsSleepDuringVideoPlayback = a3;
  uint64_t v4 = [(TVPPlayer *)self AVQueuePlayer];
  if (v4)
  {
    id v5 = v4;
    [v4 setPreventsDisplaySleepDuringVideoPlayback:self->_preventsSleepDuringVideoPlayback];
    uint64_t v4 = v5;
  }
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  return self->_preventsSleepDuringVideoPlayback;
}

- (void)addWeakReferenceToVideoView:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_videoViewWeakReferences, "addObject:");
  }
}

- (void)removeWeakReferenceToVideoView:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_videoViewWeakReferences, "removeObject:");
  }
}

- (void)setHighFrequencyElapsedTimeObserverBlock:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id highFrequencyElapsedTimeObserverBlock = self->_highFrequencyElapsedTimeObserverBlock;
  self->_id highFrequencyElapsedTimeObserverBlock = v4;

  if (self->_highFrequencyElapsedTimeObserverBlock)
  {
    [(TVPPlayer *)self _addHighFrequencyTimeObserverIfNecessary];
  }
  else
  {
    [(TVPPlayer *)self _removeHighFrequencyTimeObserverIfNecessary];
  }
}

- (int64_t)currentScanMode
{
  long long v3 = [(TVPPlayer *)self stateMachine];
  uint64_t v4 = [v3 currentState];

  if (([v4 isEqualToString:@"Scanning using AVPlayer"] & 1) != 0
    || [v4 isEqualToString:@"Scanning using AVPlayer driven by AVKit"])
  {
    if ([(TVPPlayer *)self currentMediaItemIsStreaming])
    {
      id v5 = [(TVPPlayer *)self currentPlayerItem];
      int v6 = [v5 canPlayFastForward];

      if (v6) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = 2;
      }
    }
    else
    {
      int64_t v7 = 2;
    }
  }
  else if (([v4 isEqualToString:@"Scanning using external images"] & 1) != 0 {
         || [v4 isEqualToString:@"Scanning using external images driven by AVKit"])
  }
  {
    int64_t v7 = 3;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setUpdatesBookmarks:(BOOL)a3
{
  if (self->_updatesBookmarks != a3)
  {
    self->_updatesBookmarks = a3;
    if (a3)
    {
      uint64_t v4 = [[TVPPlayerBookmarkMonitor alloc] initWithPlayer:self];
      [(TVPPlayer *)self setBookmarkMonitor:v4];
    }
    else
    {
      [(TVPPlayer *)self setBookmarkMonitor:0];
    }
  }
}

- (void)setSendsPlayerReports:(BOOL)a3
{
  if (self->_sendsPlayerReports != a3)
  {
    self->_sendsPlayerReports = a3;
    if (a3)
    {
      uint64_t v4 = [[TVPPlayerReporter alloc] initWithPlayer:self];
      [(TVPPlayer *)self setPlayerReporter:v4];
    }
    else
    {
      [(TVPPlayer *)self setPlayerReporter:0];
    }
  }
}

- (void)selectMediaArray:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPPlayer *)self currentPlayerItem];
  [(TVPPlayer *)self _selectMediaArray:v4 withItem:v5];
}

- (id)AVQueuePlayerCreateIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TVPPlayer *)self AVQueuePlayer];
  if (!v5)
  {
    id v5 = [(TVPPlayer *)self earlyAVQueuePlayer];
    if (!v5 && v3)
    {
      int v6 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Creating AVQueuePlayer earlier than normal upon request", v8, 2u);
      }
      id v5 = +[TVPPlayer _newAVQueuePlayer];
      [(TVPPlayer *)self setEarlyAVQueuePlayer:v5];
    }
  }
  return v5;
}

- (void)restartPlaybackWithState:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v8 = @"Post loading state key";
    v9[0] = a3;
    id v4 = NSDictionary;
    id v5 = a3;
    int v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    int v6 = 0;
  }
  int64_t v7 = [(TVPPlayer *)self stateMachine];
  [v7 postEvent:@"Restart playback" withContext:0 userInfo:v6];
}

- (void)_selectMediaArray:(id)a3 withItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    pendingSelectedMediaArray = [v7 asset];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v20 = 0;
          CMTimeRange v16 = [pendingSelectedMediaArray mediaSelectionGroupForPropertyList:v15 mediaSelectionOption:&v20];
          id v17 = v20;
          if (v16) {
            [v8 selectMediaOption:v17 inMediaSelectionGroup:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v18 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 134217984;
      uint64_t v27 = 0;
      _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, "Player item %p is not ready to receive the selectedMediaArray. Holding it until it is ready...", buf, 0xCu);
    }
    long long v19 = (NSArray *)v6;
    pendingSelectedMediaArray = self->_pendingSelectedMediaArray;
    self->_pendingSelectedMediaArray = v19;
  }
}

- (void)setAVQueuePlayer:(id)a3
{
  id v5 = (AVQueuePlayer *)a3;
  if (self->_AVQueuePlayer != v5)
  {
    -[TVPPlayer _removeObserversFromAVQueuePlayer:](self, "_removeObserversFromAVQueuePlayer:");
    [(TVPPlayer *)self _removePeriodicTimeObserverFromAVQueuePlayer:self->_AVQueuePlayer];
    [(TVPPlayer *)self _removeHighFrequencyTimeObserverIfNecessary];
    [(TVPPlayer *)self _removeBoundaryTimeObserversFromAVQueuePlayer:self->_AVQueuePlayer];
    [(TVPPlayer *)self _removePlaybackEndTimeBoundaryObservers];
    [self->_AVQueuePlayer removeAllItems];
    [(TVPPlayer *)self willChangeValueForKey:@"AVQueuePlayer"];
    [(TVPPlayer *)self willChangeValueForKey:@"avPlayer"];
    objc_storeStrong((id *)&self->_AVQueuePlayer, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"AVQueuePlayer"];
    [(TVPPlayer *)self didChangeValueForKey:@"avPlayer"];
    [(TVPPlayer *)self _updateVideoViewsWithAVQueuePlayer:self->_AVQueuePlayer];
    [(TVPPlayer *)self _addObserversToAVQueuePlayer:self->_AVQueuePlayer];
    [(TVPPlayer *)self _addPeriodicTimeObserverToAVQueuePlayer:self->_AVQueuePlayer];
    [(TVPPlayer *)self _addHighFrequencyTimeObserverIfNecessary];
    id v6 = [(TVPPlayer *)self boundaryTimeObserverInfos];
    uint64_t v7 = [v6 count];

    if (v7) {
      [(TVPPlayer *)self _addBoundaryTimeObserversToAVQueuePlayer:self->_AVQueuePlayer];
    }
    [self->_AVQueuePlayer setMinRateForAudioPlayback:0.0];
    if ([(TVPPlayer *)self _isScreenBeingRecorded])
    {
      uint64_t v8 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Screen is being recorded.  Muting AVQueuePlayer", v12, 2u);
      }
      [(TVPPlayer *)self setWasMutedPriorToScreenRecording:self->_muted];
      AVQueuePlayer = self->_AVQueuePlayer;
      BOOL muted = 1;
    }
    else
    {
      AVQueuePlayer = self->_AVQueuePlayer;
      BOOL muted = self->_muted;
    }
    [AVQueuePlayer setMuted:muted];
    *(float *)&double v11 = self->_volume;
    [self->_AVQueuePlayer setVolume:v11];
    [self->_AVQueuePlayer setAllowsExternalPlayback:self->_allowsExternalPlayback];
    if ([(TVPPlayer *)self limitsBandwidthForCellularAccess]) {
      [self->_AVQueuePlayer _setLimitsBandwidthForCellularAccess:1];
    }
    [self->_AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:[(TVPPlayer *)self preventsSleepDuringVideoPlayback]];
    [(TVPPlayer *)self _updateAVPlayerActionAtItemEnd];
  }
}

- (id)accessLog
{
  id v2 = [(TVPPlayer *)self currentPlayerItem];
  BOOL v3 = [v2 accessLog];

  return v3;
}

- (id)errorLog
{
  id v2 = [(TVPPlayer *)self currentPlayerItem];
  BOOL v3 = [v2 errorLog];

  return v3;
}

- (id)timedMetadata
{
  id v2 = [(TVPPlayer *)self currentPlayerItem];
  if ([v2 status] == 1)
  {
    BOOL v3 = [v2 timedMetadata];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)setCurrentPlayerItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = (TVPPlayerItem *)a3;
  currentPlayerItem = self->_currentPlayerItem;
  if (currentPlayerItem != v5)
  {
    p_currentPlayerItem = (id *)&self->_currentPlayerItem;
    if (currentPlayerItem)
    {
      uint64_t v8 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = *p_currentPlayerItem;
        int v13 = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem delegate to nil for %@", (uint8_t *)&v13, 0xCu);
      }
      [*p_currentPlayerItem setDelegate:0];
      id v10 = *p_currentPlayerItem;
    }
    else
    {
      id v10 = 0;
    }
    [(TVPPlayer *)self _removeObserversForPlayerItem:v10];
    [(TVPPlayerItem *)self->_currentPlayerItem cancelPendingSeeks];
    [(TVPPlayer *)self willChangeValueForKey:@"currentPlayerItem"];
    objc_storeStrong((id *)&self->_currentPlayerItem, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"currentPlayerItem"];
    [(TVPPlayer *)self _addObserversForPlayerItem:self->_currentPlayerItem];
    if (self->_currentPlayerItem)
    {
      double v11 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *p_currentPlayerItem;
        int v13 = 138412290;
        id v14 = v12;
        _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem delegate to self for %@", (uint8_t *)&v13, 0xCu);
      }
      [(TVPPlayerItem *)self->_currentPlayerItem setDelegate:self];
    }
  }
}

- (void)setCachedDuration:(id *)a3
{
  p_$95D729B680665BEAEFA1D6FCA8238556 cachedDuration = &self->_cachedDuration;
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 cachedDuration = self->_cachedDuration;
  if (CMTimeCompare(&time1, (CMTime *)&cachedDuration))
  {
    [(TVPPlayer *)self willChangeValueForKey:@"cachedDuration"];
    [(TVPPlayer *)self willChangeValueForKey:@"duration"];
    long long v6 = *(_OWORD *)&a3->var0;
    p_cachedDuration->CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&p_cachedDuration->value = v6;
    [(TVPPlayer *)self didChangeValueForKey:@"cachedDuration"];
    [(TVPPlayer *)self didChangeValueForKey:@"duration"];
  }
}

- (void)setCachedLoadedTimeRanges:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_cachedLoadedTimeRanges != v5)
  {
    long long v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"cachedLoadedTimeRanges"];
    [(TVPPlayer *)self willChangeValueForKey:@"bufferedTimeRange"];
    objc_storeStrong((id *)&self->_cachedLoadedTimeRanges, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"cachedLoadedTimeRanges"];
    [(TVPPlayer *)self didChangeValueForKey:@"bufferedTimeRange"];
    id v5 = v6;
  }
}

- (void)setCachedSeekableTimeRanges:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_cachedSeekableTimeRanges != v5)
  {
    long long v6 = v5;
    [(TVPPlayer *)self willChangeValueForKey:@"cachedSeekableTimeRanges"];
    [(TVPPlayer *)self willChangeValueForKey:@"seekableTimeRange"];
    [(TVPPlayer *)self willChangeValueForKey:@"seekableDateRange"];
    objc_storeStrong((id *)&self->_cachedSeekableTimeRanges, a3);
    [(TVPPlayer *)self didChangeValueForKey:@"cachedSeekableTimeRanges"];
    [(TVPPlayer *)self didChangeValueForKey:@"seekableTimeRange"];
    [(TVPPlayer *)self didChangeValueForKey:@"seekableDateRange"];
    id v5 = v6;
  }
}

- (void)setLimitReadAhead:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TVPPlayer *)self AVQueuePlayer];
  [v4 setResourceConservationLevelWhilePaused:v3];
}

- (BOOL)limitReadAhead
{
  id v2 = [(TVPPlayer *)self AVQueuePlayer];
  BOOL v3 = [v2 resourceConservationLevelWhilePaused] == 1;

  return v3;
}

- (void)setPlaylistInternal:(id)a3
{
  id v5 = (TVPPlaylist *)a3;
  if (self->_playlistInternal != v5)
  {
    long long v6 = v5;
    -[TVPPlayer _removeObserversForPlaylist:](self, "_removeObserversForPlaylist:");
    objc_storeStrong((id *)&self->_playlistInternal, a3);
    [(TVPPlayer *)self _addObserversForPlaylist:self->_playlistInternal];
    [(TVPPlayer *)self _updateAVPlayerActionAtItemEnd];
    [(TVPPlayer *)self setLoadingInitialItemInPlaylist:1];
    [(TVPPlayer *)self setInitialMediaItemHasCompletedInitialLoading:0];
    [(TVPPlayer *)self setCurrentDirectionOfPlaylistChange:0];
    id v5 = v6;
  }
}

- (void)setPostLoadingState:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (TVPPlaybackState *)a3;
  id v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Setting post loading state to %@", (uint8_t *)&v7, 0xCu);
  }
  postLoadingState = self->_postLoadingState;
  self->_postLoadingState = v4;
}

- (TVPMediaItemLoader)currentMediaItemLoader
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TVPPlayer *)self currentMediaItem];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(TVPPlayer *)self mediaItemLoaders];
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 mediaItem];
        int v10 = [v9 isEqualToMediaItem:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (TVPMediaItemLoader *)v5;
}

- (void)setTimeBeingSeekedTo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timeBeingSeekedTo.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_timeBeingSeekedTo.value = v3;
}

- (void)setMediaRemoteUpdatingEnabled:(BOOL)a3
{
  if (self->_mediaRemoteUpdatingEnabled != a3)
  {
    self->_mediaRemoteUpdatingEnabled = a3;
    [(TVPPlayer *)self _updateMediaRemoteManager];
  }
}

- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3
{
  if (self->_updatesMediaRemoteInfoAutomatically != a3)
  {
    self->_updatesMediaRemoteInfoAutomatically = a3;
    [(TVPPlayer *)self _updateMediaRemoteManager];
  }
}

- (void)setRespondsToRemoteControlEvents:(BOOL)a3
{
  if (self->_respondsToRemoteControlEvents != a3)
  {
    self->_respondsToRemoteControlEvents = a3;
    [(TVPPlayer *)self _updateMediaRemoteManager];
  }
}

- (void)setPlaybackHUDString:(id)a3
{
  id v4 = a3;
  id v5 = [(TVPPlayer *)self AVQueuePlayer];
  [v5 _setAncillaryPerformanceInformationForDisplay:v4];
}

- (void)setPreferredForwardBufferDuration:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3 >= 0.0 && self->_preferredForwardBufferDuration != a3)
  {
    self->_preferredForwardBufferDuration = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(TVPPlayer *)self AVQueuePlayer];
    id v5 = [v4 items];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setPreferredForwardBufferDuration:self->_preferredForwardBufferDuration];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (double)preferredForwardBufferDuration
{
  return self->_preferredForwardBufferDuration;
}

- (void)setPreferredMaximumResolution:(CGSize)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_preferredMaximumResolution.width != a3.width || self->_preferredMaximumResolution.height != a3.height)
  {
    self->_preferredMaximumResolution = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(TVPPlayer *)self AVQueuePlayer];
    uint64_t v6 = [v5 items];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setPreferredMaximumResolution:", self->_preferredMaximumResolution.width, self->_preferredMaximumResolution.height);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (CGSize)preferredMaximumResolution
{
  double width = self->_preferredMaximumResolution.width;
  double height = self->_preferredMaximumResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setReportingCategory:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_reportingCategory, a3);
  uint64_t v6 = [(TVPPlayer *)self AVQueuePlayer];
  uint64_t v7 = [v6 currentItem];

  if (v7)
  {
    uint64_t v8 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem reportingCategory to %@", (uint8_t *)&v9, 0xCu);
    }
    [v7 setReportingCategory:v5];
  }
}

- (NSString)reportingCategory
{
  return self->_reportingCategory;
}

- (void)setReportingValueWithString:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    id v10 = [(TVPPlayer *)self AVQueuePlayer];
    *(_DWORD *)id buf = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Setting reporting value %@ for key %@; player %@",
      buf,
      0x20u);
  }
  if (v7)
  {
    uint64_t v11 = [(TVPPlayer *)self reportingValues];
    long long v12 = v11;
    if (v6) {
      [v11 setObject:v6 forKey:v7];
    }
    else {
      [v11 removeObjectForKey:v7];
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v13 = [(TVPPlayer *)self AVQueuePlayer];
  long long v14 = [v13 items];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) setReportingValueWithString:v6 forKey:v7];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (void)setReportingValueWithNumber:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    id v10 = [(TVPPlayer *)self AVQueuePlayer];
    *(_DWORD *)id buf = 138412802;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    uint64_t v29 = v10;
    _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Setting reporting value %@ for key %@; player %@",
      buf,
      0x20u);
  }
  if (v7)
  {
    uint64_t v11 = [(TVPPlayer *)self reportingValues];
    long long v12 = v11;
    if (v6) {
      [v11 setObject:v6 forKey:v7];
    }
    else {
      [v11 removeObjectForKey:v7];
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v13 = [(TVPPlayer *)self AVQueuePlayer];
  long long v14 = [v13 items];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v18++) setReportingValueWithNumber:v6 forKey:v7];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (void)setPreferredMaximumResolutionForExpensiveNetworks:(CGSize)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_preferredMaximumResolutionForExpensiveNetworks.width != a3.width
    || self->_preferredMaximumResolutionForExpensiveNetworks.height != a3.height)
  {
    self->_preferredMaximumResolutionForExpensiveNetworks = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(TVPPlayer *)self AVQueuePlayer];
    id v6 = [v5 items];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setPreferredMaximumResolutionForExpensiveNetworks:", self->_preferredMaximumResolutionForExpensiveNetworks.width, self->_preferredMaximumResolutionForExpensiveNetworks.height);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (CGSize)preferredMaximumResolutionForExpensiveNetworks
{
  double width = self->_preferredMaximumResolutionForExpensiveNetworks.width;
  double height = self->_preferredMaximumResolutionForExpensiveNetworks.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPrefersSDRVideo:(BOOL)a3
{
  if (self->_prefersSDRVideo != a3) {
    self->_prefersSDRVideo = a3;
  }
}

- (BOOL)prefersSDRVideo
{
  return self->_prefersSDRVideo;
}

- (void)setLimitsBandwidthForCellularAccess:(BOOL)a3
{
  if (self->_limitsBandwidthForCellularAccess != a3)
  {
    self->_limitsBandwidthForCellularAccess = a3;
    id v4 = [(TVPPlayer *)self AVQueuePlayer];
    [v4 _setLimitsBandwidthForCellularAccess:self->_limitsBandwidthForCellularAccess];
  }
}

- (BOOL)limitsBandwidthForCellularAccess
{
  return self->_limitsBandwidthForCellularAccess;
}

- (void)setAllowsCellularUsage:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_allowsCellularUsage != a3)
  {
    BOOL v3 = a3;
    self->_allowsCellularUsage = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(TVPPlayer *)self mediaItemLoaders];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAllowsCellularUsage:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)allowsCellularUsage
{
  return self->_allowsCellularUsage;
}

- (void)setAllowsConstrainedNetworkUsage:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_allowsConstrainedNetworkUsage != a3)
  {
    BOOL v3 = a3;
    self->_allowsConstrainedNetworkUsage = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(TVPPlayer *)self mediaItemLoaders];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setAllowsConstrainedNetworkUsage:v3];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)allowsConstrainedNetworkUsage
{
  return self->_allowsConstrainedNetworkUsage;
}

- (int64_t)externalPlaybackType
{
  id v2 = [(TVPPlayer *)self AVQueuePlayer];
  uint64_t v3 = [v2 externalPlaybackType];

  if (v3 == 2) {
    return 2;
  }
  else {
    return v3 == 1;
  }
}

- (int64_t)loadingSubstate
{
  uint64_t v3 = [(TVPPlayer *)self state];
  id v4 = +[TVPPlaybackState stopped];

  if (v3 == v4) {
    return 0;
  }
  uint64_t v5 = [(TVPPlayer *)self state];
  uint64_t v6 = +[TVPPlaybackState loading];

  if (v5 != v6) {
    return 3;
  }
  uint64_t v8 = [(TVPPlayer *)self currentMediaItemLoader];
  long long v9 = [v8 state];

  if (([v9 isEqualToString:0x26EA1A338] & 1) != 0
    || ([v9 isEqualToString:0x26EA15E78] & 1) != 0)
  {
    int64_t v7 = 0;
  }
  else if ([v9 isEqualToString:0x26EA1A3F8])
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

+ (id)savedPreferredAudioLanguageCode
{
  return 0;
}

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 mediaItemLoader];
    int64_t v7 = [v6 mediaItem];

    uint64_t v8 = [(TVPPlayer *)self playlist];
    long long v9 = [v8 currentMediaItem];
    int v10 = [v7 isEqualToMediaItem:v9];

    long long v11 = [(TVPPlayer *)self playlist];
    long long v12 = v11;
    if (v10)
    {
      long long v13 = [v11 currentMediaItem];
LABEL_7:
      uint64_t v16 = v13;
      uint64_t v17 = [v13 mediaItemMetadataForProperty:@"TVPMediaItemMetadataPlaybackCoordinatorIdentifier"];

      goto LABEL_9;
    }
    uint64_t v14 = [v11 nextMediaItem];
    int v15 = [v7 isEqualToMediaItem:v14];

    if (v15)
    {
      long long v12 = [(TVPPlayer *)self playlist];
      long long v13 = [v12 nextMediaItem];
      goto LABEL_7;
    }
  }
  else
  {
    int64_t v7 = 0;
  }
  uint64_t v17 = 0;
LABEL_9:
  uint64_t v18 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    long long v21 = v17;
    __int16 v22 = 2112;
    long long v23 = v7;
    _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, "Delegate callback playbackCoordinator:identifierForPlayerItem: returning identifier %@ for media item %@", (uint8_t *)&v20, 0x16u);
  }

  return v17;
}

- (BOOL)playerItem:(id)a3 shouldSeekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 status] == 1)
  {
    CMTimeValue var0 = *MEMORY[0x263F01090];
    CMTimeScale var1 = *(_DWORD *)(MEMORY[0x263F01090] + 8);
    if (a4)
    {
      CMTimeValue var0 = a4->var0;
      CMTimeScale var1 = a4->var1;
      p_var2 = &a4->var2;
      p_var3 = &a4->var3;
    }
    else
    {
      p_var2 = (unsigned int *)(MEMORY[0x263F01090] + 12);
      p_var3 = (int64_t *)(MEMORY[0x263F01090] + 16);
    }
    CMTimeFlags v11 = *p_var2;
    CMTimeEpoch v12 = *p_var3;
    memset(&v26, 0, sizeof(v26));
    if (v8) {
      [v8 currentTime];
    }
    long long v13 = [v8 currentDate];
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v15 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      time.value = var0;
      time.timescale = var1;
      time.flags = v11;
      time.CMTimeEpoch epoch = v12;
      uint64_t v16 = v15;
      uint64_t v17 = (__CFString *)CMTimeCopyDescription(0, &time);
      CMTime time = v26;
      uint64_t v18 = v17;
      long long v19 = (__CFString *)CMTimeCopyDescription(0, &time);
      LODWORD(time.value) = 138412802;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v17;
      LOWORD(time.flags) = 2112;
      *(void *)((char *)&time.flags + 2) = v19;
      HIWORD(time.epoch) = 2112;
      __int16 v28 = v13;
      _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "playerItem shouldSeekToTime:%@ currentTime:%@ currentDate:%@", (uint8_t *)&time, 0x20u);
    }
    if ((v26.flags & 0x1D) == 1)
    {
      CMTime time = v26;
      int v20 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
      [v14 setObject:v20 forKey:@"TVPPlaybackTimePriorToSeekKey"];
    }
    if ((v11 & 0x1D) == 1)
    {
      time.value = var0;
      time.timescale = var1;
      time.flags = v11;
      time.CMTimeEpoch epoch = v12;
      long long v21 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
      [v14 setObject:v21 forKey:@"TVPPlaybackSeekTargetTimeKey"];
    }
    if (v13) {
      [v14 setObject:v13 forKey:@"TVPPlaybackDatePriorToSeekKey"];
    }
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      __int16 v22 = [MEMORY[0x263F08A00] defaultCenter];
      [v22 postNotificationName:@"TVPPlayerCurrentMediaItemWillSeekNotification" object:self userInfo:v14];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__TVPPlayer_playerItem_shouldSeekToTime_toleranceBefore_toleranceAfter___block_invoke;
      block[3] = &unk_264CC52C8;
      void block[4] = self;
      id v25 = v14;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }

  return 1;
}

void __72__TVPPlayer_playerItem_shouldSeekToTime_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"TVPPlayerCurrentMediaItemWillSeekNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  id v9 = a4;
  int64_t v7 = [(TVPPlayer *)self currentMediaItem];
  id v8 = v7;
  if (v9) {
    [v7 setMediaItemMetadata:v9 forProperty:@"TVPMediaItemMetadataDateRangeMetadataGroups"];
  }
  else {
    [v7 removeMediaItemMetadataForProperty:@"TVPMediaItemMetadataDateRangeMetadataGroups"];
  }
}

- (void)_subtitleSettingsDidChange
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateSubtitleOptionsAndSelection object:0];
  [(TVPPlayer *)self performSelector:sel_updateSubtitleOptionsAndSelection withObject:0 afterDelay:0.0];
}

- (void)_playerMutedDidChange
{
  [(TVPPlayer *)self willChangeValueForKey:@"muted"];
  [(TVPPlayer *)self didChangeValueForKey:@"muted"];
}

- (void)_addObserversForMediaItemLoader:(id)a3
{
  if (a3) {
    [a3 addObserver:self forKeyPath:@"state" options:1 context:__TVPMediaItemLoaderStateKVOContext_0];
  }
}

- (void)_removeObserversForMediaItemLoader:(id)a3
{
  if (a3) {
    [a3 removeObserver:self forKeyPath:@"state" context:__TVPMediaItemLoaderStateKVOContext_0];
  }
}

- (void)_addObserversToAVQueuePlayer:(id)a3
{
  if (a3)
  {
    uint64_t v4 = __AVPlayerCurrentItemKVOContext;
    id v5 = a3;
    [v5 addObserver:self forKeyPath:@"currentItem" options:9 context:v4];
    [v5 addObserver:self forKeyPath:@"timeControlStatus" options:7 context:__AVPlayerTimeControlStatusKVOContext];
    [v5 addObserver:self forKeyPath:@"outputObscuredDueToInsufficientExternalProtection" options:1 context:__AVPlayerOutputObscuredDueToInsufficientExternalProtectionKVOContext];
    [v5 addObserver:self forKeyPath:@"externalPlaybackActive" options:0 context:__AVPlayerExternalPlaybackActiveKVOContext];
    [v5 addObserver:self forKeyPath:@"muted" options:0 context:__AVPlayerMutedKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.status" options:3 context:__AVPlayerItemStatusKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.duration" options:1 context:__AVPlayerItemDurationKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.hasVideo" options:1 context:__AVPlayerItemHasVideoContext];
    [v5 addObserver:self forKeyPath:@"currentItem.presentationSize" options:1 context:__AVPlayerItemPresentationSizeContent];
    [v5 addObserver:self forKeyPath:@"currentItem.playbackLikelyToKeepUp" options:1 context:__AVPlayerItemLikelyToKeepUpKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.playbackBufferFull" options:1 context:__AVPlayerItemBufferFullKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.playbackBufferEmpty" options:1 context:__AVPlayerItemBufferEmptyKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.loadedTimeRanges" options:1 context:__AVPlayerItemLoadedTimeRangesKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.seekableTimeRanges" options:1 context:__AVPlayerItemSeekableTimeRangesKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.timedMetadata" options:0 context:__AVPlayerItemTimedMetadataKVOContext];
    [v5 addObserver:self forKeyPath:@"currentItem.tracks" options:3 context:__AVPlayerItemTracksKVOContext];
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel__avPlayerRateDidChange_ name:*MEMORY[0x263EFA118] object:v5];
  }
}

- (void)_removeObserversFromAVQueuePlayer:(id)a3
{
  if (a3)
  {
    uint64_t v4 = __AVPlayerCurrentItemKVOContext;
    id v5 = a3;
    [v5 removeObserver:self forKeyPath:@"currentItem" context:v4];
    [v5 removeObserver:self forKeyPath:@"timeControlStatus" context:__AVPlayerTimeControlStatusKVOContext];
    [v5 removeObserver:self forKeyPath:@"outputObscuredDueToInsufficientExternalProtection" context:__AVPlayerOutputObscuredDueToInsufficientExternalProtectionKVOContext];
    [v5 removeObserver:self forKeyPath:@"externalPlaybackActive" context:__AVPlayerExternalPlaybackActiveKVOContext];
    [v5 removeObserver:self forKeyPath:@"muted" context:__AVPlayerMutedKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.status" context:__AVPlayerItemStatusKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.duration" context:__AVPlayerItemDurationKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.hasVideo" context:__AVPlayerItemHasVideoContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.presentationSize" context:__AVPlayerItemPresentationSizeContent];
    [v5 removeObserver:self forKeyPath:@"currentItem.playbackLikelyToKeepUp" context:__AVPlayerItemLikelyToKeepUpKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.playbackBufferFull" context:__AVPlayerItemBufferFullKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.playbackBufferEmpty" context:__AVPlayerItemBufferEmptyKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.loadedTimeRanges" context:__AVPlayerItemLoadedTimeRangesKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.seekableTimeRanges" context:__AVPlayerItemSeekableTimeRangesKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.timedMetadata" context:__AVPlayerItemTimedMetadataKVOContext];
    [v5 removeObserver:self forKeyPath:@"currentItem.tracks" context:__AVPlayerItemTracksKVOContext];
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x263EFA118] object:v5];
  }
}

- (void)_addObserversForPlaylist:(id)a3
{
  if (a3)
  {
    uint64_t v4 = __TVPPlaylistEndActionKVOContext;
    id v5 = a3;
    [v5 addObserver:self forKeyPath:@"endAction" options:1 context:v4];
    [v5 addObserver:self forKeyPath:@"currentMediaItem" options:9 context:__TVPPlaylistCurrentMediaItemKVOContext];
    [v5 addObserver:self forKeyPath:@"nextMediaItem" options:1 context:__TVPPlaylistNextMediaItemKVOContext];
  }
}

- (void)_removeObserversForPlaylist:(id)a3
{
  if (a3)
  {
    uint64_t v4 = __TVPPlaylistEndActionKVOContext;
    id v5 = a3;
    [v5 removeObserver:self forKeyPath:@"endAction" context:v4];
    [v5 removeObserver:self forKeyPath:@"currentMediaItem" context:__TVPPlaylistCurrentMediaItemKVOContext];
    [v5 removeObserver:self forKeyPath:@"nextMediaItem" context:__TVPPlaylistNextMediaItemKVOContext];
  }
}

- (void)_addPeriodicTimeObserverToAVQueuePlayer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(TVPPlayer *)self periodicTimeObserverToken];
    if (!v5)
    {
      objc_initWeak(&location, self);
      memset(&v17, 0, sizeof(v17));
      CMTimeMakeWithSeconds(&v17, 1.0, 1000000);
      uint64_t v6 = MEMORY[0x263EF83A0];
      id v7 = MEMORY[0x263EF83A0];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke;
      v15[3] = &unk_264CC59B8;
      objc_copyWeak(&v16, &location);
      CMTime v14 = v17;
      id v8 = [v4 addPeriodicTimeObserverForInterval:&v14 queue:v6 usingBlock:v15];

      [(TVPPlayer *)self setPeriodicTimeObserverToken:v8];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    id v9 = [(TVPPlayer *)self timeJumpPeriodicObserverToken];
    if (!v9)
    {
      memset(&v17, 0, sizeof(v17));
      CMTimeMakeWithSeconds(&v17, 10000000.0, 1000);
      objc_initWeak(&location, self);
      uint64_t v10 = MEMORY[0x263EF83A0];
      id v11 = MEMORY[0x263EF83A0];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke_2;
      v12[3] = &unk_264CC59B8;
      objc_copyWeak(&v13, &location);
      CMTime v14 = v17;
      id v9 = [v4 addPeriodicTimeObserverForInterval:&v14 queue:v10 usingBlock:v12];

      [(TVPPlayer *)self setTimeJumpPeriodicObserverToken:v9];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke(uint64_t a1, long long *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 2);
  [WeakRetained _avPlayerTimeDidChangeTo:&v4];
}

void __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke_2(uint64_t a1)
{
  id v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Current player item time did jump", v5, 2u);
  }
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlayerTimeDidJumpNotification" object:WeakRetained];
}

- (void)_removePeriodicTimeObserverFromAVQueuePlayer:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    long long v4 = [(TVPPlayer *)self periodicTimeObserverToken];
    if (v4)
    {
      [v6 removeTimeObserver:v4];
      [(TVPPlayer *)self setPeriodicTimeObserverToken:0];
    }
    uint64_t v5 = [(TVPPlayer *)self timeJumpPeriodicObserverToken];
    if (v5)
    {
      [v6 removeTimeObserver:v5];
      [(TVPPlayer *)self setTimeJumpPeriodicObserverToken:0];
    }
  }
}

- (void)_addHighFrequencyTimeObserverIfNecessary
{
  uint64_t v3 = [(TVPPlayer *)self AVQueuePlayer];
  if (v3)
  {
    id v11 = (id)v3;
    uint64_t v4 = [(TVPPlayer *)self highFrequencyElapsedTimeObserverBlock];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = [(TVPPlayer *)self highFrequencyTimeObserverToken];

      if (!v6)
      {
        objc_initWeak(&location, self);
        id v7 = [(TVPPlayer *)self AVQueuePlayer];
        CMTimeMakeWithSeconds(&v14, 0.1, 1000000);
        uint64_t v8 = MEMORY[0x263EF83A0];
        id v9 = MEMORY[0x263EF83A0];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __53__TVPPlayer__addHighFrequencyTimeObserverIfNecessary__block_invoke;
        v12[3] = &unk_264CC59B8;
        objc_copyWeak(&v13, &location);
        uint64_t v10 = [v7 addPeriodicTimeObserverForInterval:&v14 queue:v8 usingBlock:v12];

        [(TVPPlayer *)self setHighFrequencyTimeObserverToken:v10];
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
    else
    {
    }
  }
}

void __53__TVPPlayer__addHighFrequencyTimeObserverIfNecessary__block_invoke(uint64_t a1, CMTime *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained highFrequencyElapsedTimeObserverBlock];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v7 = [v6 _statesThatReturnAVPlayerTime];
    id v8 = objc_loadWeakRetained(v3);
    id v9 = [v8 stateMachine];
    uint64_t v10 = [v9 currentState];
    int v11 = [v7 containsObject:v10];

    if (v11)
    {
      memset(&v27, 0, sizeof(v27));
      id v12 = objc_loadWeakRetained(v3);
      id v13 = v12;
      if (v12)
      {
        [v12 cachedDuration];
        CMTime time = *a2;
        [v13 _clampedElapsedTimeForTime:&time duration:v26];
      }
      else
      {
        memset(v26, 0, sizeof(v26));
        memset(&v27, 0, sizeof(v27));
      }

      id v14 = objc_loadWeakRetained(v3);
      int v15 = [v14 currentMediaItem];
      int v16 = [v15 hasTrait:@"TVPMediaItemTraitIsScene"];

      if (v16)
      {
        id v17 = objc_loadWeakRetained(v3);
        uint64_t v18 = v17;
        if (v17)
        {
          CMTime v24 = v27;
          [v17 _clampedSceneTimeForPlayerTime:&v24];
        }
        else
        {
          memset(&time, 0, sizeof(time));
        }
        CMTime v27 = time;
      }
      id v19 = objc_loadWeakRetained(v3);
      int v20 = v19;
      if (v19)
      {
        CMTime v24 = v27;
        [v19 _clampInfiniteTimeToSeekableRange:&v24];
      }
      else
      {
        memset(&time, 0, sizeof(time));
      }
      CMTime v27 = time;

      id v21 = objc_loadWeakRetained(v3);
      __int16 v22 = [v21 highFrequencyElapsedTimeObserverBlock];
      CMTime time = v27;
      Float64 Seconds = CMTimeGetSeconds(&time);
      v22[2](v22, Seconds);
    }
  }
}

- (void)_removeHighFrequencyTimeObserverIfNecessary
{
  uint64_t v3 = [(TVPPlayer *)self AVQueuePlayer];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = [(TVPPlayer *)self highFrequencyTimeObserverToken];

    if (v5)
    {
      id v6 = [(TVPPlayer *)self AVQueuePlayer];
      id v7 = [(TVPPlayer *)self highFrequencyTimeObserverToken];
      [v6 removeTimeObserver:v7];

      [(TVPPlayer *)self setHighFrequencyTimeObserverToken:0];
    }
  }
}

- (void)_addBoundaryTimeObserversToAVQueuePlayer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(TVPPlayer *)self boundaryTimeObserverInfos];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke;
    v6[3] = &unk_264CC59E0;
    id v7 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 tokenFromAVPlayer];

  if (!v7)
  {
    objc_initWeak(&location, v6);
    id v8 = *(void **)(a1 + 32);
    id v9 = [v6 times];
    uint64_t v10 = MEMORY[0x263EF83A0];
    id v11 = MEMORY[0x263EF83A0];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    int v15 = __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke_2;
    int v16 = &unk_264CC5600;
    objc_copyWeak(&v17, &location);
    id v12 = [v8 addBoundaryTimeObserverForTimes:v9 queue:v10 usingBlock:&v13];

    objc_msgSend(v6, "setTokenFromAVPlayer:", v12, v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained handler];

  id v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    id v2 = (void *)v3;
  }
}

- (void)_removeBoundaryTimeObserversFromAVQueuePlayer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(TVPPlayer *)self boundaryTimeObserverInfos];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __59__TVPPlayer__removeBoundaryTimeObserversFromAVQueuePlayer___block_invoke;
    v6[3] = &unk_264CC59E0;
    id v7 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

void __59__TVPPlayer__removeBoundaryTimeObserversFromAVQueuePlayer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v4 = [v5 tokenFromAVPlayer];
  if (v4)
  {
    [*(id *)(a1 + 32) removeTimeObserver:v4];
    [v5 setTokenFromAVPlayer:0];
  }
}

- (void)_addObserversForPlayerItem:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__currentPlayerItemDidHitBeginningOrEnd_ name:*MEMORY[0x263EFA050] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemAccessLogDidChange_ name:*MEMORY[0x263EFA098] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemErrorLogDidChange_ name:*MEMORY[0x263EFA0A0] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemDidStall_ name:*MEMORY[0x263EFA0B8] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemDidFailToPlayToEnd_ name:*MEMORY[0x263EFA060] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemMediaSelectionDidChange_ name:*MEMORY[0x263EFA090] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemReachedTimeToPauseBuffering_ name:*MEMORY[0x263EFA0C0] object:v5];
    [v6 addObserver:self selector:sel__currentPlayerItemReachedTimeToPausePlayback_ name:*MEMORY[0x263EFA0C8] object:v5];
  }
}

- (void)_removeObserversForPlayerItem:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x263EFA050] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA098] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA0A0] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA0B8] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA060] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA090] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA0C0] object:v5];
    [v6 removeObserver:self name:*MEMORY[0x263EFA0C8] object:v5];
  }
}

- (void)_addPlaybackEndTimeBoundaryObservers
{
  v35[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TVPPlayer *)self currentMediaItemLoader];
  int v4 = [v3 containsStreamingAVAsset];

  if (v4)
  {
    id v5 = [(TVPPlayer *)self playlist];
    id v6 = [v5 currentMediaItem];
    id v7 = [v6 mediaItemMetadataForProperty:@"TVPMediaItemMetadataForwardPlaybackEndTime"];

    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v7)
    {
      memset(&v33, 0, sizeof(v33));
      [v7 doubleValue];
      CMTimeMakeWithSeconds(&v33, v9, 1000000);
      objc_initWeak(&location, self);
      uint64_t v10 = [(TVPPlayer *)self AVQueuePlayer];
      CMTime v31 = v33;
      id v11 = [MEMORY[0x263F08D40] valueWithCMTime:&v31];
      v35[0] = v11;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
      id v13 = MEMORY[0x263EF83A0];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke;
      v29[3] = &unk_264CC5600;
      objc_copyWeak(&v30, &location);
      uint64_t v14 = [v10 addBoundaryTimeObserverForTimes:v12 queue:MEMORY[0x263EF83A0] usingBlock:v29];

      if (v14) {
        [v8 addObject:v14];
      }

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    int v15 = [(TVPPlayer *)self playlist];
    int v16 = [v15 currentMediaItem];
    id v17 = [v16 mediaItemMetadataForProperty:@"TVPMediaItemMetadataReversePlaybackEndTime"];

    if (v17)
    {
      memset(&v33, 0, sizeof(v33));
      [v17 doubleValue];
      CMTimeMakeWithSeconds(&v33, v18, 1000000);
      objc_initWeak(&location, self);
      id v19 = [(TVPPlayer *)self AVQueuePlayer];
      CMTime v31 = v33;
      int v20 = [MEMORY[0x263F08D40] valueWithCMTime:&v31];
      long long v34 = v20;
      id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      id v22 = MEMORY[0x263EF83A0];
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      CMTime v26 = __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke_509;
      CMTime v27 = &unk_264CC5600;
      objc_copyWeak(&v28, &location);
      long long v23 = [v19 addBoundaryTimeObserverForTimes:v21 queue:MEMORY[0x263EF83A0] usingBlock:&v24];

      if (v23) {
        objc_msgSend(v8, "addObject:", v23, v24, v25, v26, v27);
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    -[TVPPlayer setPlaybackEndTimeBoundaryObserverTokens:](self, "setPlaybackEndTimeBoundaryObserverTokens:", v8, v24, v25, v26, v27);
  }
}

void __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Boundary time observer for forward playback end time fired.", v11, 2u);
  }
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained stateMachine];
  id v6 = [v5 currentState];

  if (([v6 isEqualToString:@"Playing"] & 1) != 0
    || ([v6 isEqualToString:@"Scanning using AVPlayer"] & 1) != 0
    || ([v6 isEqualToString:@"Scanning using AVPlayer driven by AVKit"] & 1) != 0
    || ([v6 isEqualToString:@"Scanning using external images"] & 1) != 0
    || [v6 isEqualToString:@"Scanning using external images driven by AVKit"])
  {
    id v7 = objc_loadWeakRetained(v3);
    id v8 = [v7 stateMachine];
    id v12 = @"Requires manual AVQueuePlayer advance key";
    v13[0] = MEMORY[0x263EFFA88];
    Float64 v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v8 postEvent:@"Hit beginning or end" withContext:0 userInfo:v9];
  }
  else
  {
    uint64_t v10 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring forward playback boundary time observer since player isn't playing or scanning.", v11, 2u);
    }
  }
}

void __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke_509(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Boundary time observer for reverse playback end time fired.", v11, 2u);
  }
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained stateMachine];
  id v6 = [v5 currentState];

  if (([v6 isEqualToString:@"Scanning using AVPlayer"] & 1) != 0
    || ([v6 isEqualToString:@"Scanning using AVPlayer driven by AVKit"] & 1) != 0
    || ([v6 isEqualToString:@"Scanning using external images"] & 1) != 0
    || [v6 isEqualToString:@"Scanning using external images driven by AVKit"])
  {
    id v7 = objc_loadWeakRetained(v3);
    id v8 = [v7 stateMachine];
    id v12 = @"Reset to start time key";
    v13[0] = MEMORY[0x263EFFA88];
    Float64 v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v8 postEvent:@"Hit beginning or end" withContext:0 userInfo:v9];
  }
  else
  {
    uint64_t v10 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring reverse playback boundary time observer since player isn't scanning.", v11, 2u);
    }
  }
}

- (void)_removePlaybackEndTimeBoundaryObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(TVPPlayer *)self playbackEndTimeBoundaryObserverTokens];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        Float64 v9 = [(TVPPlayer *)self AVQueuePlayer];
        [v9 removeTimeObserver:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(TVPPlayer *)self setPlaybackEndTimeBoundaryObserverTokens:0];
}

- (void)_addObserversForMediaItem:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 addObserver:self selector:sel__currentMediaItemMetadataDidChange_ name:@"TVPMediaItemMetadataDidChangeNotification" object:v5];
  }
}

- (void)_removeObserversForMediaItem:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08A00];
    id v5 = a3;
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:self name:@"TVPMediaItemMetadataDidChangeNotification" object:v5];
  }
}

- (void)_mediaItemLoader:(id)a3 stateDidChangeTo:(id)a4
{
  v55[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:0x26EA1A378])
  {
    v54 = @"Media item loader key";
    v55[0] = v6;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
    Float64 v9 = [(TVPPlayer *)self stateMachine];
    [v9 postEvent:@"Media item loader did prepare item for loading" withContext:0 userInfo:v8];

    long long v10 = [v6 mediaItem];
    long long v11 = [v10 reportingDelegate];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      long long v12 = [v6 timingData];
      [v12 startTimeForPreparingForLoading];
      double v14 = v13;
      [v12 endTimeForPreparingForLoading];
      [v11 mediaItemDidPrepareForLoading:v10 timeTakenForOperation:self player:v15 - v14];
    }
    goto LABEL_31;
  }
  if ([v7 isEqualToString:0x26EA1A3B8])
  {
    uint64_t v8 = [v6 mediaItem];
    long long v10 = [v8 reportingDelegate];
    if (objc_opt_respondsToSelector())
    {
      int v16 = [v6 timingData];
      [v16 startTimeForLoadingAVAssetKeys];
      double v18 = v17;
      [v16 endTimeForLoadingAVAssetKeys];
      [v10 mediaItemDidLoadAVAssetKeys:v8 timeTakenForOperation:self player:v19 - v18];
    }
    int v20 = [(TVPPlayer *)self currentMediaItem];
    if ([v8 isEqualToMediaItem:v20])
    {
      [(TVPPlayer *)self cachedDuration];

      if (v45)
      {
LABEL_29:
        v52 = @"Media item loader key";
        id v53 = v6;
        long long v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1, v42, v43, v44);
        CMTime v27 = [(TVPPlayer *)self stateMachine];
        id v28 = v27;
        uint64_t v29 = @"Media item loader did load AVAsset keys";
LABEL_30:
        [v27 postEvent:v29 withContext:0 userInfo:v11];

LABEL_31:
        goto LABEL_32;
      }
      id v21 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Setting cached duration to value from AVAsset", buf, 2u);
      }
      id v22 = [v6 AVAsset];
      int v20 = v22;
      if (v22)
      {
        [v22 duration];
      }
      else
      {
        uint64_t v42 = 0;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
      }
      [(TVPPlayer *)self setCachedDuration:&v42];
    }

    goto LABEL_29;
  }
  if ([v7 isEqualToString:0x26EA1A3F8])
  {
    uint64_t v8 = [v6 mediaItem];
    long long v10 = [v8 reportingDelegate];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      long long v23 = [v6 timingData];
      [v23 startTimeForPreparingForPlaybackInitiation];
      double v25 = v24;
      [v23 endTimeForPreparingForPlaybackInitiation];
      [v10 mediaItemDidPrepareForPlaybackInitiation:v8 timeTakenForOperation:self player:v26 - v25];
    }
    long long v50 = @"Media item loader key";
    id v51 = v6;
    long long v11 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    CMTime v27 = [(TVPPlayer *)self stateMachine];
    id v28 = v27;
    uint64_t v29 = @"Media item did prepare for playback initiation";
    goto LABEL_30;
  }
  if ([v7 isEqualToString:0x26EA15E78])
  {
    id v30 = [v6 mediaItem];
    CMTime v31 = [(TVPPlayer *)self playlist];
    long long v32 = [v31 currentMediaItem];
    int v33 = [v30 isEqualToMediaItem:v32];

    if (v33)
    {
      long long v34 = [v6 error];
      long long v35 = [v6 mediaItem];
      uint64_t v8 = [(TVPPlayer *)self playbackErrorFromError:v34 forMediaItem:v35];

      long long v48 = @"Error key";
      uint64_t v49 = v8;
      long long v10 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      CMTime v36 = [(TVPPlayer *)self stateMachine];
      [v36 postEvent:@"Error did occur" withContext:0 userInfo:v10];

LABEL_32:
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v37 = [v6 mediaItem];
    long long v38 = [(TVPPlayer *)self playlist];
    long long v39 = [v38 nextMediaItem];
    int v40 = [v37 isEqualToMediaItem:v39];

    if (v40)
    {
      CMTime v41 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        id v47 = v6;
        _os_log_impl(&dword_236FC5000, v41, OS_LOG_TYPE_DEFAULT, "Cleaning up next item's media item loader that has failed: %@", buf, 0xCu);
      }
      [(TVPPlayer *)self _removeObserversForMediaItemLoader:v6];
      [v6 cleanupIfNecessary];
      uint64_t v8 = [(TVPPlayer *)self mediaItemLoaders];
      [v8 removeObject:v6];
      goto LABEL_33;
    }
  }
LABEL_34:
}

- (void)_playlistEndActionDidChange
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    id v5 = [(TVPPlayer *)self playlist];
    int v6 = 134217984;
    uint64_t v7 = [v5 endAction];
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Playlist end action did change to %ld", (uint8_t *)&v6, 0xCu);
  }
  [(TVPPlayer *)self _updateAVPlayerActionAtItemEnd];
}

- (void)_playlistCurrentMediaItemWillChangeWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"Changing media because AVFoundation advanced key"];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = [v4 objectForKey:@"TVPPlaylistDidHitBeginningKey"];
  uint64_t v8 = [v7 BOOLValue];

  Float64 v9 = [v4 objectForKey:@"TVPPlaylistDidHitEndKey"];
  uint64_t v10 = [v9 BOOLValue];

  long long v11 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = @"NO";
    if (v6) {
      double v13 = @"YES";
    }
    else {
      double v13 = @"NO";
    }
    if (v8) {
      double v14 = @"YES";
    }
    else {
      double v14 = @"NO";
    }
    *(_DWORD *)double v18 = 138412802;
    *(void *)&void v18[4] = v13;
    *(_WORD *)&v18[12] = 2112;
    *(void *)&v18[14] = v14;
    if (v10) {
      long long v12 = @"YES";
    }
    *(_WORD *)&v18[22] = 2112;
    double v19 = v12;
    _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Playlist's current media item will change.  Due to AVFoundation advancing? %@  Did hit beginning of playlist? %@  Did hit end of playlist? %@", v18, 0x20u);
  }
  double v15 = [(TVPPlayer *)self currentMediaItem];
  [(TVPPlayer *)self _removeObserversForMediaItem:v15];

  if ((v6 & 1) == 0)
  {
    int v16 = [v4 objectForKey:@"direction"];
    double v17 = [v4 objectForKey:@"TVPPlaybackCurrentMediaItemChangeReasonKey"];
    [(TVPPlayer *)self _postCurrentMediaItemWillChangeNotificationWithDirection:v16 reason:v17 didHitBeginningOfPlaylist:v8 didHitEndOfPlaylist:v10];
  }
}

- (void)_playlistCurrentMediaItemDidChangeWithContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"Changing media because AVFoundation advanced key"];
  int v6 = [v5 BOOLValue];

  uint64_t v7 = [v4 objectForKey:@"TVPPlaylistDidHitBeginningKey"];
  uint64_t v8 = [v7 BOOLValue];

  Float64 v9 = [v4 objectForKey:@"TVPPlaylistDidHitEndKey"];
  uint64_t v10 = [v9 BOOLValue];

  long long v11 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = v11;
    uint64_t v13 = [(TVPPlayer *)self currentMediaItem];
    double v14 = (void *)v13;
    double v15 = @"NO";
    if (v6) {
      int v16 = @"YES";
    }
    else {
      int v16 = @"NO";
    }
    *(_DWORD *)long long v23 = 138413058;
    *(void *)&v23[4] = v13;
    if (v8) {
      double v17 = @"YES";
    }
    else {
      double v17 = @"NO";
    }
    *(void *)&v23[14] = v16;
    *(_WORD *)&v23[12] = 2112;
    *(_WORD *)&v23[22] = 2112;
    if (v10) {
      double v15 = @"YES";
    }
    double v24 = v17;
    __int16 v25 = 2112;
    double v26 = v15;
    _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "Playlist's current media item did change to %@.  Due to AVFoundation advancing? %@  Did hit beginning of playlist? %@  Did hit end of playlist? %@", v23, 0x2Au);
  }
  double v18 = [(TVPPlayer *)self currentMediaItem];
  -[TVPPlayer setCurrentMediaItemIsStreaming:](self, "setCurrentMediaItemIsStreaming:", [v18 hasTrait:@"TVPMediaItemTraitIsStreaming"]);

  [(TVPPlayer *)self setCurrentMediaItemInitialLoadingComplete:0];
  [(TVPPlayer *)self setInitialMediaItemHasCompletedInitialLoading:0];
  [(TVPPlayer *)self _removePlaybackEndTimeBoundaryObservers];
  double v19 = [(TVPPlayer *)self currentMediaItem];
  [(TVPPlayer *)self _addObserversForMediaItem:v19];

  uint64_t v20 = [v4 objectForKey:@"direction"];
  id v21 = [v4 objectForKey:@"TVPPlaybackCurrentMediaItemChangeReasonKey"];
  [(TVPPlayer *)self _postCurrentMediaItemDidChangeNotificationWithDirection:v20 reason:v21 didHitBeginningOfPlaylist:v8 didHitEndOfPlaylist:v10];

  id v22 = [(TVPPlayer *)self stateMachine];
  [v22 postEvent:@"Playlist current media item did change" withContext:0 userInfo:v4];
}

- (void)_postCurrentMediaItemWillChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v17 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v12 = v11;
  if (v17) {
    [v11 setObject:v17 forKey:@"TVPPlaybackCurrentMediaItemChangeDirectionKey"];
  }
  if (v10) {
    [v12 setObject:v10 forKey:@"TVPPlaybackCurrentMediaItemChangeReasonKey"];
  }
  if (v7 || v6)
  {
    uint64_t v13 = TVPPlaybackCurrentMediaItemChangeDitHitBeginningOfPlaylistKey;
    if (!v7) {
      uint64_t v13 = TVPPlaybackCurrentMediaItemChangeDidHitEndOfPlaylistKey;
    }
    [v12 setObject:MEMORY[0x263EFFA88] forKey:*v13];
  }
  double v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"TVPPlaybackCurrentMediaItemWillChangeNotification" object:self userInfo:v12];

  double v15 = [(TVPPlayer *)self currentMediaItem];
  int v16 = [v15 reportingDelegate];
  if (objc_opt_respondsToSelector()) {
    [v16 mediaItemWillNoLongerBeCurrentItem:v15 player:self reason:v10];
  }
}

- (void)_postCurrentMediaItemDidChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v17 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v12 = v11;
  if (v17) {
    [v11 setObject:v17 forKey:@"TVPPlaybackCurrentMediaItemChangeDirectionKey"];
  }
  if (v10) {
    [v12 setObject:v10 forKey:@"TVPPlaybackCurrentMediaItemChangeReasonKey"];
  }
  if (v7 || v6)
  {
    uint64_t v13 = TVPPlaybackCurrentMediaItemChangeDitHitBeginningOfPlaylistKey;
    if (!v7) {
      uint64_t v13 = TVPPlaybackCurrentMediaItemChangeDidHitEndOfPlaylistKey;
    }
    [v12 setObject:MEMORY[0x263EFFA88] forKey:*v13];
  }
  double v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"TVPPlaybackCurrentMediaItemDidChangeNotification" object:self userInfo:v12];

  double v15 = [(TVPPlayer *)self currentMediaItem];
  int v16 = [v15 reportingDelegate];
  if (objc_opt_respondsToSelector()) {
    [v16 mediaItemDidBecomeCurrentItem:v15 player:self reason:v10];
  }
}

- (void)_playlistNextMediaItemDidChangeWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    BOOL v6 = [(TVPPlayer *)self playlist];
    BOOL v7 = [v6 nextMediaItem];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Playlist's next media item did change to %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [(TVPPlayer *)self stateMachine];
  [v8 postEvent:@"Playlist next media item did change"];
}

- (void)_avPlayerRateDidChangeTo:(float)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = a3;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "AVPlayer rate did change to %f", (uint8_t *)&v8, 0xCu);
  }
  if (![(TVPPlayer *)self modifyingAVPlayerRate])
  {
    BOOL v6 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Rate change was external", (uint8_t *)&v8, 2u);
    }
    if (a3 >= 0.5 && a3 <= 2.0)
    {
      BOOL v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 134217984;
        double v9 = a3;
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Rate used for playback was set to %f", (uint8_t *)&v8, 0xCu);
      }
      [(TVPPlayer *)self setRateUsedForPlayback:a3];
    }
  }
}

- (void)_timeControlStatusDidChangeTo:(int64_t)a3 oldStatusNum:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      if (a3 == 2)
      {
        int v8 = @"AVPlayerTimeControlStatusPlaying";
      }
      else if (a3 == 1)
      {
        int v8 = @"AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate";
      }
      else
      {
        int v8 = @"Unknown";
      }
    }
    else
    {
      int v8 = @"AVPlayerTimeControlStatusPaused";
    }
    double v9 = v7;
    uint64_t v10 = [(TVPPlayer *)self AVQueuePlayer];
    uint64_t v11 = [v10 reasonForWaitingToPlay];
    int v24 = 138412546;
    __int16 v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "AVPlayer timeControlStatus did change to %@.  reasonForWaiting is %@", (uint8_t *)&v24, 0x16u);
  }
  if (a3 == 2)
  {
    long long v12 = [(TVPPlayer *)self stateMachine];
    uint64_t v13 = [v12 currentState];
    int v14 = [v13 isEqualToString:@"Waiting for seek"];

    if (v14)
    {
      double v15 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Sending seek complete event because playback has started while waiting for a seek", (uint8_t *)&v24, 2u);
      }
      int v16 = [(TVPPlayer *)self stateMachine];
      [v16 postEvent:@"Seek completed"];
    }
    id v17 = [(TVPPlayer *)self stateMachine];
    double v18 = [v17 currentState];
    int v19 = [v18 isEqualToString:@"Waiting for sufficient buffer"];

    if (v19)
    {
      uint64_t v20 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "Assuming likelyToKeepUp is YES because playback has started", (uint8_t *)&v24, 2u);
      }
      id v21 = [(TVPPlayer *)self stateMachine];
      [v21 postEvent:@"Sufficient buffer did become available"];
    }
  }
  if (!v6 || [v6 integerValue] != a3)
  {
    id v22 = [(TVPPlayer *)self stateMachine];
    long long v23 = [NSNumber numberWithInteger:a3];
    [v22 postEvent:@"Time control status did change" withContext:v23];
  }
}

- (void)_outputObscuredDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(TVPPlayer *)self outputObscuredDueToInsufficientExternalProtection] != a3)
  {
    id v5 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      *(_DWORD *)id buf = 138412290;
      int v14 = v6;
      _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "outputObscuredDueToInsufficientExternalProtection did change to %@ due to AVPlayer KVO notification", buf, 0xCu);
    }
    [(TVPPlayer *)self setOutputObscuredDueToInsufficientExternalProtection:v3];
    if (v3 && [(TVPPlayer *)self externalPlaybackType] == 2)
    {
      BOOL v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Stopping with error because external playack type is TVOut", buf, 2u);
      }
      int v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TVPlaybackErrorDomain" code:807 userInfo:0];
      double v9 = [(TVPPlayer *)self stateMachine];
      uint64_t v11 = @"Error key";
      long long v12 = v8;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      [v9 postEvent:@"Error did occur" withContext:0 userInfo:v10];
    }
  }
}

- (void)_externalPlaybackActiveDidChange
{
  v13[1] = *MEMORY[0x263EF8340];
  BOOL v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "externalPlaybackActive did change", v11, 2u);
  }
  [(TVPPlayer *)self _logExternalPlaybackType];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"TVPPlayerExternalPlaybackTypeDidChangeNotification" object:self];

  if ([(TVPPlayer *)self externalPlaybackType] == 2)
  {
    id v5 = [(TVPPlayer *)self AVQueuePlayer];
    int v6 = [v5 outputObscuredDueToInsufficientExternalProtection];

    if (v6)
    {
      BOOL v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Stopping with error because external playack type is TVOut", v11, 2u);
      }
      int v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TVPlaybackErrorDomain" code:807 userInfo:0];
      double v9 = [(TVPPlayer *)self stateMachine];
      long long v12 = @"Error key";
      v13[0] = v8;
      uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [v9 postEvent:@"Error did occur" withContext:0 userInfo:v10];
    }
  }
}

- (void)_logExternalPlaybackType
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TVPPlayer *)self AVQueuePlayer];

  if (v3
    && ([(TVPPlayer *)self AVQueuePlayer],
        id v4 = objc_claimAutoreleasedReturnValue(),
        unint64_t v5 = [v4 externalPlaybackType],
        v4,
        v5 <= 2))
  {
    int v6 = off_264CC64B8[v5];
  }
  else
  {
    int v6 = @"unknown (no AVPlayer)";
  }
  BOOL v7 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    double v9 = v6;
    _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "externalPlaybackType is %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_avPlayerTimeDidChangeTo:(id *)a3
{
  [(TVPPlayer *)self cachedElapsedCMTime];
  double v6 = floor(CMTimeGetSeconds(&time));
  CMTime v26 = *(CMTime *)a3;
  if (v6 != floor(CMTimeGetSeconds(&v26)))
  {
    BOOL v7 = [(TVPPlayer *)self _statesThatReturnAVPlayerTime];
    int v8 = [(TVPPlayer *)self stateMachine];
    double v9 = [v8 currentState];
    int v10 = [v7 containsObject:v9];

    if (v10)
    {
      memset(&v26, 0, sizeof(v26));
      [(TVPPlayer *)self cachedDuration];
      CMTime v24 = (CMTime)*a3;
      [(TVPPlayer *)self _clampedElapsedTimeForTime:&v24 duration:v25];
      uint64_t v11 = [(TVPPlayer *)self currentPlayerItem];
      long long v12 = 0;
      if ([v11 status] == 1)
      {
        [(TVPPlayer *)self cachedDuration];
        if ((v23 & 1) != 0 && ([(TVPPlayer *)self cachedDuration], (v22 & 0x10) != 0))
        {
          long long v12 = [(TVPPlayer *)self _currentDateFromPlayerItem:v11];
        }
        else
        {
          long long v12 = 0;
        }
      }
      uint64_t v13 = [(TVPPlayer *)self stateMachine];
      int v14 = [v13 currentState];
      char v15 = [v14 isEqualToString:@"Scanning using AVPlayer"];
      if ((v15 & 1) == 0)
      {
        int v16 = [(TVPPlayer *)self stateMachine];
        BOOL v3 = [v16 currentState];
        if (![v3 isEqualToString:@"Scanning using AVPlayer driven by AVKit"])
        {

LABEL_16:
          CMTime v24 = v26;
          [(TVPPlayer *)self _notifyListenersOfElapsedTimeChange:&v24 playbackDate:v12 dueToTimeJump:0];
LABEL_17:

          goto LABEL_18;
        }
        id v21 = v16;
      }
      id v17 = v12;
      double v18 = v11;
      int v19 = [(TVPPlayer *)self currentInterstitialCollection];
      CMTime v24 = v26;
      uint64_t v20 = [v19 interstitialForTime:CMTimeGetSeconds(&v24)];

      if ((v15 & 1) == 0)
      {
      }
      uint64_t v11 = v18;
      long long v12 = v17;
      if (v20) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
LABEL_18:
  CMTime v26 = (CMTime)*a3;
  [(TVPPlayer *)self setCachedElapsedCMTime:&v26];
}

- (void)_currentPlayerItemWillChange
{
  BOOL v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "Current player item will change", v6, 2u);
  }
  [(TVPPlayer *)self setPlayerItemChangeIsHappening:1];
  if (![(TVPPlayer *)self modifyingAVPlayerQueue])
  {
    id v4 = [(TVPPlayer *)self mediaItemChangeReason];
    unint64_t v5 = [(TVPPlayer *)self playlist];
    -[TVPPlayer _postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:](self, "_postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:", &unk_26EA25C78, v4, 0, [v5 moreItemsAvailable:0] ^ 1);
  }
}

- (void)_currentPlayerItemDidChangeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item did change to %@", buf, 0xCu);
  }
  [(TVPPlayer *)self setPlayerItemChangeIsHappening:0];
  [(TVPPlayer *)self setCurrentPlayerItem:v4];
  [(TVPPlayer *)self setCurrentMediaItemHasDates:0];
  [(TVPPlayer *)self setChapterCollections:0];
  [(TVPPlayer *)self setCurrentChapterCollection:0];
  [(TVPPlayer *)self setCurrentChapter:0];
  [(TVPPlayer *)self setCurrentInterstitialCollection:0];
  [(TVPPlayer *)self setCurrentInterstitial:0];
  [(TVPPlayer *)self setAudioOptions:0];
  [(TVPPlayer *)self setSubtitleOptions:0];
  *(_OWORD *)id buf = *MEMORY[0x263F010E0];
  long long v15 = *(_OWORD *)buf;
  uint64_t v22 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v6 = v22;
  [(TVPPlayer *)self setTimeBeingSeekedTo:buf];
  [(TVPPlayer *)self setDateBeingSeekedTo:0];
  *(_OWORD *)id buf = v15;
  uint64_t v22 = v6;
  [(TVPPlayer *)self setTimeAtStartOfSeek:buf];
  [(TVPPlayer *)self setPlaybackDateAtStartOfSeek:0];
  BOOL v7 = [(TVPPlayer *)self externalImagePlayer];
  [v7 invalidate];

  [(TVPPlayer *)self setExternalImagePlayer:0];
  [(TVPPlayer *)self setCachedSelectedAudioOption:0];
  [(TVPPlayer *)self willChangeValueForKey:@"selectedAudioOption"];
  [(TVPPlayer *)self didChangeValueForKey:@"selectedAudioOption"];
  [(TVPPlayer *)self willChangeValueForKey:@"selectedSubtitleOption"];
  [(TVPPlayer *)self didChangeValueForKey:@"selectedSubtitleOption"];
  if (![(TVPPlayer *)self modifyingAVPlayerQueue])
  {
    int v8 = [(TVPPlayer *)self playlist];
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v9 setObject:MEMORY[0x263EFFA88] forKey:@"Changing media because AVFoundation advanced key"];
    int v10 = [(TVPPlayer *)self mediaItemChangeReason];

    if (v10)
    {
      uint64_t v11 = [(TVPPlayer *)self mediaItemChangeReason];
      [v9 setObject:v11 forKey:@"TVPPlaybackCurrentMediaItemChangeReasonKey"];

      [(TVPPlayer *)self setMediaItemChangeReason:0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke;
    block[3] = &unk_264CC52C8;
    id v19 = v8;
    id v20 = v9;
    id v12 = v9;
    id v13 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  if ([v4 status] == 2)
  {
    int v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Player item changed to an item that has already failed", buf, 2u);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke_555;
    v16[3] = &unk_264CC5600;
    objc_copyWeak(&v17, (id *)buf);
    dispatch_async(MEMORY[0x263EF83A0], v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeMedia:0 withContext:*(void *)(a1 + 40)];
}

void __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke_555(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained currentPlayerItem];
  uint64_t v4 = [v3 status];

  unint64_t v5 = sPlayerLogObject;
  BOOL v6 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v4 == 2)
  {
    if (v6)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item is still failed after item transition", buf, 2u);
    }
    id v7 = objc_loadWeakRetained(v1);
    [v7 _currentPlayerItemStatusDidChangeTo:2 from:0];
  }
  else if (v6)
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item is no longer failed", v8, 2u);
  }
}

- (void)_currentPlayerItemStatusDidChangeTo:(int64_t)a3 from:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = @"AVPlayerItemStatusFailed";
    if (a3 == 1) {
      int v8 = @"AVPlayerItemStatusReadyToPlay";
    }
    if (!a3) {
      int v8 = @"AVPlayerItemStatusUnknown";
    }
    *(_DWORD *)id buf = 138412290;
    CMTime v26 = v8;
    _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Current player item status did change to %@", buf, 0xCu);
  }
  BOOL v9 = [(TVPPlayer *)self playerItemChangeIsHappening];
  if (a3 == 2 && v9)
  {
    int v10 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)id buf = 0;
    uint64_t v11 = "Temporarily ignoring player item status change to AVPlayerItemStatusFailed since item transition is in progres"
          "s.  Will handle when transition completes";
LABEL_14:
    _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    return;
  }
  if (a3 == a4)
  {
    int v10 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)id buf = 0;
    uint64_t v11 = "Ignoring player item status change since it hasn't actually changed";
    goto LABEL_14;
  }
  id v12 = [(TVPPlayer *)self currentPlayerItem];
  [v12 setPreviousStatus:a4];

  if (a3 == 1)
  {
    id v13 = [(TVPPlayer *)self stateMachine];
    [v13 postEvent:@"Current player item status did become ready to play"];

    return;
  }
  if (a3 == 2)
  {
    int v14 = [(TVPPlayer *)self currentPlayerItem];
    long long v15 = [v14 error];
    int v16 = [(TVPPlayer *)self currentMediaItem];
    id v17 = [(TVPPlayer *)self playbackErrorFromError:v15 forMediaItem:v16];

    double v18 = [v17 domain];
    if ([v18 isEqualToString:*MEMORY[0x263EF98B0]])
    {
      uint64_t v19 = [v17 code];

      if (v19 == -11819)
      {
        id v20 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring player item failure due to media services reset.  Error from media item loader should be sent shortly.", buf, 2u);
        }
        goto LABEL_24;
      }
    }
    else
    {
    }
    id v21 = [(TVPPlayer *)self stateMachine];
    uint64_t v23 = @"Error key";
    CMTime v24 = v17;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v21 postEvent:@"Error did occur" withContext:0 userInfo:v22];

LABEL_24:
  }
}

- (void)_currentPlayerItemDurationDidChangeTo:(id *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v5 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
    BOOL v6 = v5;
    id v7 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&v8);
    LODWORD(v8.var0) = 138412290;
    *(int64_t *)((char *)&v8.var0 + 4) = (int64_t)v7;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Current player item duration did change to %@", (uint8_t *)&v8, 0xCu);
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  [(TVPPlayer *)self setCachedDuration:&v8];
}

- (void)_currentPlayerItemHasVideoDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item hasVideo did change to %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(TVPPlayer *)self currentMediaItem];
  int v8 = [v7 hasTrait:@"TVPMediaItemTraitTreatAsVideo"];

  if (v8)
  {
    uint64_t v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Treating as video since it has TVPMediaItemTraitTreatAsVideo", (uint8_t *)&v10, 2u);
    }
    BOOL v3 = 1;
  }
  [(TVPPlayer *)self setCurrentMediaItemHasVideoContent:v3];
}

- (void)_currentPlayerItemPresentationSizeDidChangeTo:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v6 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    v12.double width = width;
    v12.double height = height;
    int v8 = NSStringFromCGSize(v12);
    int v9 = 138412290;
    int v10 = v8;
    _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Current player item presentationSize did change to %@", (uint8_t *)&v9, 0xCu);
  }
  -[TVPPlayer setCurrentMediaItemPresentationSize:](self, "setCurrentMediaItemPresentationSize:", width, height);
}

- (void)_currentPlayerItemLikelyToKeepUpDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item playbackLikelyToKeepUp did change to %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    id v7 = [(TVPPlayer *)self stateMachine];
    [v7 postEvent:@"Sufficient buffer did become available"];
  }
}

- (void)_currentPlayerItemBufferFullDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item playbackBufferFull did change to %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    id v7 = [(TVPPlayer *)self stateMachine];
    [v7 postEvent:@"Sufficient buffer did become available"];
  }
}

- (void)_currentPlayerItemBufferEmptyDidChangeTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    *(_DWORD *)id buf = 138412290;
    int v16 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item playbackBufferEmpty did change to %@", buf, 0xCu);
  }
  if (v3)
  {
    id v7 = [(TVPPlayer *)self AVQueuePlayer];
    [v7 rate];
    double v9 = v8;

    uint64_t v10 = [(TVPPlayer *)self stateMachine];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:", v9, @"Rate key");
    int v14 = v11;
    CGSize v12 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v10 postEvent:@"Buffer did become empty" withContext:0 userInfo:v12];
  }
}

- (void)_currentPlayerItemDidHitBeginningOrEnd:(id)a3
{
  uint64_t v4 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Current player item did hit beginning or end", v6, 2u);
  }
  unint64_t v5 = [(TVPPlayer *)self stateMachine];
  [v5 postEvent:@"Hit beginning or end"];
}

- (void)_currentPlayerItemAccessLogDidChange:(id)a3
{
  uint64_t v4 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Current player item access log did change", v5, 2u);
  }
  [(TVPPlayer *)self willChangeValueForKey:@"accessLog"];
  [(TVPPlayer *)self didChangeValueForKey:@"accessLog"];
}

- (void)_currentPlayerItemErrorLogDidChange:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v5 = v4;
    BOOL v6 = [(TVPPlayer *)self errorLog];
    int v7 = 138412290;
    float v8 = v6;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item error log did change: %@", (uint8_t *)&v7, 0xCu);
  }
  [(TVPPlayer *)self willChangeValueForKey:@"errorLog"];
  [(TVPPlayer *)self didChangeValueForKey:@"errorLog"];
}

- (void)_currentPlayerItemDidStall:(id)a3
{
  uint64_t v4 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Current player item did stall", v6, 2u);
  }
  unint64_t v5 = [(TVPPlayer *)self stateMachine];
  [v5 postEvent:@"Current player item did stall"];
}

- (void)_currentPlayerItemDidFailToPlayToEnd:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGSize v12 = 0;
    _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current player item did fail to play to end", v12, 2u);
  }
  BOOL v6 = [v4 userInfo];
  int v7 = [v6 objectForKey:*MEMORY[0x263EFA058]];
  float v8 = [(TVPPlayer *)self currentMediaItem];
  uint64_t v9 = [(TVPPlayer *)self playbackErrorFromError:v7 forMediaItem:v8];

  uint64_t v13 = @"Error key";
  v14[0] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = [(TVPPlayer *)self stateMachine];
  [v11 postEvent:@"Error did occur" withContext:0 userInfo:v10];
}

- (void)_currentPlayerItemLoadedTimeRangesDidChangeTo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TVPPlayer *)self cachedLoadedTimeRanges];
  [(TVPPlayer *)self setCachedLoadedTimeRanges:v4];
  BOOL v6 = [(TVPPlayer *)self currentMediaItem];
  int v7 = [v6 mediaItemMetadataForProperty:@"TVPMediaItemMetadataForwardPlaybackEndTime"];

  if (v7)
  {
    memset(&v20, 0, sizeof(v20));
    [(TVPPlayer *)self elapsedTime];
    CMTimeMakeWithSeconds(&start, v8, 1000000);
    [v7 doubleValue];
    CMTimeMakeWithSeconds(&end, v9, 1000000);
    CMTimeRangeFromTimeToTime(&v20, &start, &end);
    memset(&v17, 0, sizeof(v17));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v4];
    CMTimeRange range = v17;
    memset(&v16, 0, sizeof(v16));
    CMTimeRange otherRange = v20;
    CMTimeRangeGetIntersection(&v16, &range, &otherRange);
    memset(&range, 0, sizeof(range));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v5];
    CMTimeRange v13 = range;
    memset(&otherRange, 0, sizeof(otherRange));
    CMTimeRange v12 = v20;
    CMTimeRangeGetIntersection(&otherRange, &v13, &v12);
    v13.CMTime start = otherRange.duration;
    v12.CMTime start = v20.duration;
    if (CMTimeCompare(&v13.start, &v12.start) < 0)
    {
      v13.CMTime start = v16.duration;
      v12.CMTime start = v20.duration;
      if ((CMTimeCompare(&v13.start, &v12.start) & 0x80000000) == 0)
      {
        uint64_t v10 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13.start.value) = 0;
          _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Sending \"Sufficient Buffer Did Become Available\" since entire scene is loaded", (uint8_t *)&v13, 2u);
        }
        [(TVPPlayer *)self setSceneCompletelyBuffered:1];
        uint64_t v11 = [(TVPPlayer *)self stateMachine];
        [v11 postEvent:@"Sufficient buffer did become available"];
      }
    }
    else
    {
      v13.CMTime start = v16.duration;
      v12.CMTime start = v20.duration;
      if (CMTimeCompare(&v13.start, &v12.start) < 0) {
        [(TVPPlayer *)self setSceneCompletelyBuffered:0];
      }
    }
  }
}

- (void)_currentPlayerItemSeekableTimeRangesDidChangeTo:(id)a3
{
  [(TVPPlayer *)self setCachedSeekableTimeRanges:a3];
  [(TVPPlayer *)self elapsedTime];
  CMTimeMakeWithSeconds(&v5, v4, 1000000);
  [(TVPPlayer *)self _updateIsLiveForElapsedTime:&v5];
}

- (void)_currentPlayerItemTimedMetadataDidChange
{
  [(TVPPlayer *)self willChangeValueForKey:@"timedMetadata"];
  [(TVPPlayer *)self didChangeValueForKey:@"timedMetadata"];
}

- (void)_currentPlayerItemTracksDidChangeTo:(id)a3 from:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  Float64 v8 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412546;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Current player item tracks did change.  Old tracks: %@ New tracks: %@", buf, 0x16u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  Float64 v9 = [(TVPPlayer *)self AVQueuePlayer];
  uint64_t v10 = [v9 items];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        CMTimeRange v16 = [v15 tracks];
        int v17 = [v6 isEqual:v16];

        if (v17)
        {
          if (![v7 count] && objc_msgSend(v6, "count"))
          {
            [(TVPPlayer *)self _configureSoundCheckForPlayerItem:v15 tracks:v6];
            [(TVPPlayer *)self _updateCurrentMediaItemVideoRangeForTracks:v6];
          }
          if ([v6 count]) {
            [(TVPPlayer *)self _updateCurrentMediaItemAudioInfoForPlayerItem:v15 tracks:v6];
          }
          goto LABEL_17;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  double v18 = [(TVPPlayer *)self currentMediaItem];
  uint64_t v19 = [v18 reportingDelegate];
  if (objc_opt_respondsToSelector())
  {
    if ([v6 count])
    {
      if ([v7 count])
      {
        if ([(TVPPlayer *)self currentMediaItemIsStreaming])
        {
          int v20 = [(TVPPlayer *)self _videoTrackIDFromTracks:v7];
          int v21 = [(TVPPlayer *)self _videoTrackIDFromTracks:v6];
          if (v20)
          {
            if (v21 && v20 != v21) {
              [v19 mediaItemDidSwitchVariantStreams:v18 player:self];
            }
          }
        }
      }
    }
  }
}

- (void)_currentPlayerItemMediaSelectionDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Current player item media selection did change", (uint8_t *)&v27, 2u);
  }
  [(TVPPlayer *)self willChangeValueForKey:@"selectedAudioOption"];
  [(TVPPlayer *)self didChangeValueForKey:@"selectedAudioOption"];
  [(TVPPlayer *)self willChangeValueForKey:@"selectedSubtitleOption"];
  [(TVPPlayer *)self didChangeValueForKey:@"selectedSubtitleOption"];
  id v7 = [(TVPPlayer *)self selectedAudioOption];
  if (v7
    || ([(TVPPlayer *)self cachedSelectedAudioOption],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    Float64 v8 = [(TVPPlayer *)self cachedSelectedAudioOption];
    char v9 = [v7 isEqual:v8];

    if (v7)
    {
      if (v9) {
        goto LABEL_20;
      }
    }
    else
    {

      if (v9) {
        goto LABEL_20;
      }
    }
    [(TVPPlayer *)self setCachedSelectedAudioOption:v7];
    uint64_t v10 = [(TVPPlayer *)self currentPlayerItem];
    uint64_t v11 = [v10 asset];
    uint64_t v12 = objc_msgSend(v11, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);
    uint64_t v13 = [v12 defaultOption];
    int v14 = [v7 avMediaSelectionOption];
    int v15 = [v13 isEqual:v14];

    CMTimeRange v16 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = v16;
      int v18 = [v7 hasAudioDescriptions];
      uint64_t v19 = @"NO";
      if (v18) {
        uint64_t v19 = @"YES";
      }
      int v27 = 138412290;
      id v28 = v19;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Setting player prefers audio descriptions %@", (uint8_t *)&v27, 0xCu);
    }
    -[TVPPlayer setPrefersAudioDescriptions:](self, "setPrefersAudioDescriptions:", [v7 hasAudioDescriptions]);
    int v20 = (void *)sPlayerLogObject;
    BOOL v21 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v21)
      {
        long long v22 = v20;
        long long v23 = [v7 languageCodeBCP47];
        int v27 = 138412290;
        id v28 = v23;
        _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "Setting player's preferred audio language code to nil since selected language option, %@, is the default", (uint8_t *)&v27, 0xCu);
      }
      [(TVPPlayer *)self setPreferredAudioLanguageCode:0];
    }
    else
    {
      if (v21)
      {
        long long v24 = v20;
        long long v25 = [v7 languageCodeBCP47];
        int v27 = 138412290;
        id v28 = v25;
        _os_log_impl(&dword_236FC5000, v24, OS_LOG_TYPE_DEFAULT, "Setting player's preferred audio language code to %@", (uint8_t *)&v27, 0xCu);
      }
      CMTime v26 = [v7 languageCodeBCP47];
      [(TVPPlayer *)self setPreferredAudioLanguageCode:v26];
    }
  }
LABEL_20:
}

- (void)_currentPlayerItemReachedTimeToPauseBuffering:(id)a3
{
  id v4 = [(TVPPlayer *)self currentMediaItem];
  if (v4)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"TVPPlayerItemReachedTimeToPauseBufferingNotification" object:v4];
  }
}

- (void)_currentPlayerItemReachedTimeToPausePlayback:(id)a3
{
  id v4 = [(TVPPlayer *)self currentMediaItem];
  if (v4)
  {
    BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"TVPPlayerItemReachedTimeToPausePlaybackNotification" object:v4];
  }
}

- (void)_currentMediaItemMetadataDidChange:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"TVPMediaItemMetadataChangesKey"];

  if ([v5 containsObject:@"TVPMediaItemMetadataChapterCollections"])
  {
    id v6 = [(TVPPlayer *)self currentMediaItem];
    id v7 = [v6 mediaItemMetadataForProperty:@"TVPMediaItemMetadataChapterCollections"];

    Float64 v8 = [MEMORY[0x263EFF980] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    char v9 = [(TVPPlayer *)self chapterCollections];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v56 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if ([v14 type] != 2) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v11);
    }

    [v8 addObjectsFromArray:v7];
    int v15 = [(TVPPlayer *)self currentChapterCollection];
    CMTimeRange v16 = [v15 name];

    id v17 = [v8 firstObject];
    if (v16)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v48 = v7;
      id v18 = v7;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        v46 = v17;
        id v47 = v5;
        uint64_t v21 = *(void *)v52;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v52 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = *(void **)(*((void *)&v51 + 1) + 8 * j);
            long long v24 = [v23 name];
            int v25 = [v24 isEqual:v16];

            if (v25)
            {
              id v17 = v23;

              id v5 = v47;
              goto LABEL_22;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v20) {
            continue;
          }
          break;
        }
        id v17 = v46;
        id v5 = v47;
      }
LABEL_22:

      id v7 = v48;
    }
    [(TVPPlayer *)self setChapterCollections:v8];
    [(TVPPlayer *)self setCurrentChapterCollection:v17];
  }
  if ([v5 containsObject:@"TVPMediaItemMetadataWebVTTStyles"])
  {
    CMTime v26 = [(TVPPlayer *)self currentMediaItem];
    int v27 = [v26 mediaItemMetadataForProperty:@"TVPMediaItemMetadataWebVTTStyles"];

    id v28 = [(TVPPlayer *)self currentPlayerItem];
    uint64_t v29 = [MEMORY[0x263EFA8B0] textStyleRulesFromPropertyList:v27];
    [v28 setTextStyleRules:v29];
  }
  if ([v5 containsObject:@"TVPMediaItemMetadataScrubPlayerItem"])
  {
    id v30 = [(TVPPlayer *)self currentMediaItem];
    uint64_t v31 = [v30 mediaItemMetadataForProperty:@"TVPMediaItemMetadataScrubPlayerItem"];

    long long v32 = [(TVPPlayer *)self currentPlayerItem];
    [(TVPPlayer *)self _setScrubPlayerItem:v31 onPlayerItem:v32];
  }
  if (([v5 containsObject:@"TVPMediaItemMetadataUpNextPresentationTime"] & 1) != 0
    || [v5 containsObject:@"TVPMediaItemMetadataUpNextAutomaticAcceptanceInterval"])
  {
    [(TVPPlayer *)self _populateCurrentPlayerItemWithUpNextMetadata];
  }
  if ([v5 containsObject:@"TVPMediaItemMetadataTimeToPauseBuffering"])
  {
    int v33 = [(TVPPlayer *)self currentMediaItem];
    CFDictionaryRef v34 = [v33 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTimeToPauseBuffering"];

    if (v34)
    {
      long long v35 = [(TVPPlayer *)self currentPlayerItem];
      CMTimeMakeFromDictionary(&v50, v34);
      [v35 setTimeToPauseBuffering:&v50];
    }
  }
  if ([v5 containsObject:@"TVPMediaItemMetadataTimeToPausePlayback"])
  {
    CMTime v36 = [(TVPPlayer *)self currentMediaItem];
    CFDictionaryRef v37 = [v36 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTimeToPausePlayback"];

    if (v37)
    {
      long long v38 = [(TVPPlayer *)self currentPlayerItem];
      CMTimeMakeFromDictionary(&v49, v37);
      [v38 setTimeToPausePlayback:&v49];
    }
  }
  if (_currentMediaItemMetadataDidChange__onceToken != -1) {
    dispatch_once(&_currentMediaItemMetadataDidChange__onceToken, &__block_literal_global_572);
  }
  uint64_t v39 = [(TVPPlayer *)self currentPlayerItem];
  if (v39)
  {
    int v40 = (void *)v39;
    uint64_t v41 = [(TVPPlayer *)self currentMediaItem];
    if (!v41)
    {
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v42 = (void *)v41;
    uint64_t v43 = [MEMORY[0x263EFFA08] setWithArray:v5];
    int v44 = [v43 intersectsSet:_currentMediaItemMetadataDidChange__metadataKeysUsedByAVKit];

    if (v44)
    {
      int v40 = [(TVPPlayer *)self currentPlayerItem];
      int v45 = [(TVPPlayer *)self currentMediaItem];
      [(TVPPlayer *)self _populatePlayerItem:v40 withMetadataFromMediaItem:v45];

      goto LABEL_45;
    }
  }
LABEL_46:
}

uint64_t __48__TVPPlayer__currentMediaItemMetadataDidChange___block_invoke()
{
  _currentMediaItemMetadataDidChange__metadataKeysUsedByAVKit = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"TVPMediaItemMetadataStoreItemIdentifier", @"TVPMediaItemMetadataTitle", @"TVPMediaItemMetadataSeriesTitle", @"TVPMediaItemMetadataSubtitle", @"TVPMediaItemMetadataLongDescription", @"TVPMediaItemMetadataContentRating", @"TVPMediaItemMetadataGenre", @"TVPMediaItemMetadataDateReleased", @"TVPMediaItemMetadataAlbum", @"TVPMediaItemMetadataTomatoPercentage", @"TVPMediaItemMetadataTomatoFreshness", @"TVPMediaItemMetadataArtworkURLString", @"TVPMediaItemMetadataArtworkImageProxy", @"TVPMediaItemMetadataInterstitialCollection", @"TVPMediaItemMetadataScrubImageVideoMediaItem", @"TVPMediaItemMetadataExternalImageConfig", @"TVPMediaItemMetadataExternalImageConfigURL",
                                                                  @"TVPMediaItemMetadataExternalIdentifier",
                                                                  @"TVPMediaItemMetadataExternalProfileIdentifier",
                                                                  @"TVPMediaItemMetadataExternalServiceIdentifier",
                                                                  @"TVPMediaItemMetadataPlaybackProgress",
                                                                  @"TVPMediaItemMetadataExactStartTime",
                                                                  @"TVPMediaItemMetadataExactEndTime",
                                                                  @"TVPMediaItemMetadataProgramScheduleStartTime",
                                                                  @"TVPMediaItemMetadataProgramScheduleEndTime",
                                                                  @"TVPMediaItemMetadataSportingVenueName",
                                                                  @"TVPMediaItemMetadataSportingVenueAddress",
                                                                  @"TVPMediaItemMetadataSportingLeagueName",
                                                                  @"TVPMediaItemMetadataSportingLeagueShortName",
                                                                  @"TVPMediaItemMetadataSportingEventType",
                                                                  @"TVPMediaItemMetadataCurrentEmbeddedSongAdamID",
                                                                  0);
  return MEMORY[0x270F9A758]();
}

- (void)_audioRouteChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __32__TVPPlayer__audioRouteChanged___block_invoke;
  v6[3] = &unk_264CC52C8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __32__TVPPlayer__audioRouteChanged___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) pausesOnRouteChange])
  {
    id v2 = [*(id *)(a1 + 32) state];
    uint64_t v3 = +[TVPPlaybackState playing];
    if (v2 == (void *)v3)
    {
    }
    else
    {
      id v4 = (void *)v3;
      id v5 = [*(id *)(a1 + 32) state];
      id v6 = +[TVPPlaybackState loading];

      if (v5 != v6) {
        return;
      }
    }
    id v7 = [*(id *)(a1 + 40) userInfo];
    Float64 v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EF9268]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 unsignedIntegerValue] == 2)
    {
      char v9 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Pausing for audio route change", v10, 2u);
      }
      [*(id *)(a1 + 32) pause];
    }
  }
}

- (void)_screenRecordingStateDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TVPPlayer__screenRecordingStateDidChange___block_invoke;
  block[3] = &unk_264CC5470;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__TVPPlayer__screenRecordingStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _isScreenBeingRecorded];
  uint64_t v3 = [*(id *)(a1 + 32) AVQueuePlayer];

  id v4 = sPlayerLogObject;
  BOOL v5 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v2)
    {
      if (v5)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Screen is being recorded.  Muting AVQueuePlayer", (uint8_t *)&v13, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setWasMutedPriorToScreenRecording:", objc_msgSend(*(id *)(a1 + 32), "muted"));
      id v6 = [*(id *)(a1 + 32) AVQueuePlayer];
      [v6 setMuted:1];
    }
    else
    {
      if (v5)
      {
        Float64 v8 = *(void **)(a1 + 32);
        char v9 = v4;
        int v10 = [v8 muted];
        uint64_t v11 = @"NO";
        if (v10) {
          uint64_t v11 = @"YES";
        }
        int v13 = 138412290;
        int v14 = v11;
        _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Screen is NOT being recorded.  Restoring previous mute value of %@", (uint8_t *)&v13, 0xCu);
      }
      uint64_t v12 = [*(id *)(a1 + 32) AVQueuePlayer];
      objc_msgSend(v12, "setMuted:", objc_msgSend(*(id *)(a1 + 32), "wasMutedPriorToScreenRecording"));
    }
  }
  else if (v5)
  {
    id v7 = @"NOT ";
    if (v2) {
      id v7 = &stru_26EA147D8;
    }
    int v13 = 138412290;
    int v14 = v7;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Screen is %@being recorded, but AVQueuePlayer does not exist yet.  Will handle when AVQueuePlayer is created.", (uint8_t *)&v13, 0xCu);
  }
}

- (void)_avPlayerRateDidChange:(id)a3
{
  id v4 = a3;
  id v7 = [v4 object];
  [v7 rate];
  -[TVPPlayer _avPlayerRateDidChangeTo:](self, "_avPlayerRateDidChangeTo:");
  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v6 = [v4 userInfo];

  [v5 postNotificationName:@"TVPPlaybackRateDidChangeNotification" object:self userInfo:v6];
}

+ (id)_newAVQueuePlayer
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_alloc_init(TVPBackgroundQueuePlayer);
  [(TVPBackgroundQueuePlayer *)v3 setUsesExternalPlaybackWhileExternalScreenIsActive:1];
  [(TVPBackgroundQueuePlayer *)v3 setAllowsOutOfBandTextTrackRendering:1];
  uint64_t v4 = [(id)objc_opt_class() savedPreferredAudioLanguageCode];
  BOOL v5 = (void *)v4;
  if (v4)
  {
    v10[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v6 = 0;
  }
  [a1 _updateAudioSelectionCriteriaForAVQueuePlayer:v3 mediaItemLoader:0 preferredAudioLanguageCodes:v6 prefersAudioDescriptions:0];
  id v7 = [MEMORY[0x263EFF960] preferredLanguages];
  Float64 v8 = (void *)[objc_alloc(MEMORY[0x263EFA848]) initWithPreferredLanguages:v7 preferredMediaCharacteristics:0];
  [(TVPBackgroundQueuePlayer *)v3 setAllowsLegibleFallbackForAllAudibleMediaSelections:1];
  [(TVPBackgroundQueuePlayer *)v3 setLegibleFallbackMediaSelectionCriteria:v8];

  return v3;
}

+ (id)_audioSelectionCriteriaForPreferredAudioLanguageCodes:(id)a3 mediaItemLoader:(id)a4 prefersAudioDescriptions:(BOOL)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = [MEMORY[0x263EFF960] preferredLanguages];
  int v10 = [v9 firstObject];

  if (a5
    || (uint64_t v11 = (void *)MAAudibleMediaPrefCopyPreferDescriptiveVideo(),
        int v12 = [v11 BOOLValue],
        v11,
        v12))
  {
    if (v10)
    {
      if (v7)
      {
        uint64_t v13 = [v7 arrayByAddingObject:v10];

        id v7 = (id)v13;
      }
      else
      {
        v47[0] = v10;
        id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
      }
    }
    id v14 = objc_alloc(MEMORY[0x263EFA848]);
    uint64_t v18 = *MEMORY[0x263EF9CA8];
    v46[0] = *MEMORY[0x263EF9CC0];
    v46[1] = v18;
    uint64_t v15 = (void *)MEMORY[0x263EFF8C0];
    CMTimeRange v16 = v46;
    uint64_t v17 = 2;
    goto LABEL_10;
  }
  if ([v7 count])
  {
    id v14 = objc_alloc(MEMORY[0x263EFA848]);
    uint64_t v42 = *MEMORY[0x263EF9CC0];
    uint64_t v15 = (void *)MEMORY[0x263EFF8C0];
    CMTimeRange v16 = &v42;
    uint64_t v17 = 1;
LABEL_10:
    uint64_t v19 = [v15 arrayWithObjects:v16 count:v17];
    uint64_t v20 = (void *)[v14 initWithPreferredLanguages:v7 preferredMediaCharacteristics:v19];
    goto LABEL_11;
  }
  long long v22 = [v8 mediaItem];
  int v23 = [v22 hasTrait:@"TVPMediaItemTraitIsLocal"];

  if (v23)
  {
    uint64_t v19 = [v8 AVAsset];
    long long v24 = [v19 assetCache];
    if (v24)
    {
      int v25 = objc_msgSend(v19, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);
      CMTime v26 = [v25 defaultOption];
      CMTime v36 = v24;
      [v24 mediaSelectionOptionsInMediaSelectionGroup:v25];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v39 != v30) {
              objc_enumerationMutation(v27);
            }
            if ([*(id *)(*((void *)&v38 + 1) + 8 * i) isEqual:v26])
            {

              int v33 = sPlayerLogObject;
              if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id buf = 0;
                _os_log_impl(&dword_236FC5000, v33, OS_LOG_TYPE_DEFAULT, "Default audio option is downloaded.  Will pick default audio option", buf, 2u);
              }

              goto LABEL_31;
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v45 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }

      long long v24 = v36;
    }
    long long v32 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v32, OS_LOG_TYPE_DEFAULT, "Default audio option is not downloaded.  Will let Core Media pick whatever it wants", buf, 2u);
    }

    uint64_t v20 = 0;
  }
  else
  {
LABEL_31:
    id v34 = objc_alloc(MEMORY[0x263EFA848]);
    int v44 = v10;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    uint64_t v43 = *MEMORY[0x263EF9CC0];
    long long v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    uint64_t v20 = (void *)[v34 initWithPrincipalMediaCharacteristics:&unk_26EA26038 preferredLanguages:v19 preferredMediaCharacteristics:v35];
  }
LABEL_11:

  return v20;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampedElapsedTimeForTime:(SEL)a3 duration:(id *)a4
{
  *retstr = *a4;
  if ((a4->var2 & 0x1D) == 1 && (a5->var2 & 0x1D) == 1)
  {
    CMTime time1 = *(CMTime *)a5;
    long long v9 = *MEMORY[0x263F010E0];
    *(_OWORD *)&time2.value = *MEMORY[0x263F010E0];
    CMTimeEpoch v7 = *(void *)(MEMORY[0x263F010E0] + 16);
    time2.CMTimeEpoch epoch = v7;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
    if ((int)self >= 1)
    {
      CMTime time2 = (CMTime)*retstr;
      *(_OWORD *)&v10.value = v9;
      v10.CMTimeEpoch epoch = v7;
      CMTimeMaximum(&time1, &time2, &v10);
      *(_OWORD *)&retstr->CMTimeValue var0 = *(_OWORD *)&time1.value;
      CMTimeEpoch epoch = time1.epoch;
      retstr->var3 = time1.epoch;
      *(_OWORD *)&time2.value = *(_OWORD *)&retstr->var0;
      time2.CMTimeEpoch epoch = epoch;
      CMTime v10 = (CMTime)*a5;
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMinimum(&time1, &time2, &v10);
      *(CMTime *)retstr = time1;
    }
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampedSceneTimeForPlayerTime:(SEL)a3
{
  memset(&v11[1], 0, sizeof(CMTime));
  [(TVPPlayer *)self _currentMediaItemReversePlaybackEndTime];
  memset(v11, 0, 24);
  [(TVPPlayer *)self _currentMediaItemForwardPlaybackEndTime];
  memset(&v10, 0, sizeof(v10));
  CMTime lhs = v11[0];
  CMTime rhs = v11[1];
  CMTimeSubtract(&v10, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  CMTime rhs = *(CMTime *)a4;
  CMTime v7 = v11[1];
  CMTimeSubtract(&lhs, &rhs, &v7);
  CMTime rhs = lhs;
  CMTime v7 = v10;
  return [(TVPPlayer *)self _clampedElapsedTimeForTime:&rhs duration:&v7];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampInfiniteTimeToSeekableRange:(SEL)a3
{
  *retstr = *a4;
  if ((~a4->var2 & 5) == 0 || (a4->var2 & 9) == 9)
  {
    CMTime v7 = [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self cachedSeekableTimeRanges];
    memset(&v12, 0, sizeof(v12));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v7];
    long long v8 = *(_OWORD *)&a4->var0;
    time.CMTimeEpoch epoch = a4->var3;
    CMTimeRange v9 = v12;
    *(_OWORD *)&time.value = v8;
    CMTimeClampToRange(&v11, &time, &v9);
    *(CMTime *)retstr = v11;
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_estimatedCMTimeForPlaybackDate:(SEL)a3 referenceTime:(id)a4 referenceDate:(id *)a5
{
  [a4 timeIntervalSinceDate:a6];
  CMTimeMakeWithSeconds(&rhs, v8, 1000000);
  CMTime v10 = *(CMTime *)a5;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &v10, &rhs);
}

- (id)_estimatedPlaybackDateForCMTime:(id *)a3
{
  BOOL v5 = [(TVPPlayer *)self currentPlayerItem];
  id v6 = v5;
  if ((a3->var2 & 0x1D) == 1
    && [v5 status] == 1
    && [(TVPPlayer *)self _currentPlayerItemContainsDates])
  {
    CMTime v7 = [(TVPPlayer *)self _currentDateFromPlayerItem:v6];
    if (v7)
    {
      memset(&v12, 0, sizeof(v12));
      if (v6) {
        [v6 currentTime];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      CMTime v10 = (CMTime)*a3;
      CMTimeSubtract(&v12, &v10, &rhs);
      CMTime v10 = v12;
      Float64 v8 = [v7 dateByAddingTimeInterval:CMTimeGetSeconds(&v10)];
    }
    else
    {
      Float64 v8 = 0;
    }
  }
  else
  {
    Float64 v8 = 0;
  }

  return v8;
}

- (void)_notifyListenersOfElapsedTimeChange:(id *)a3 playbackDate:(id)a4 dueToTimeJump:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  [(TVPPlayer *)self cachedDuration];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = *a3;
  [(TVPPlayer *)self _clampedElapsedTimeForTime:&v28 duration:v29];
  *(_OWORD *)&a3->CMTimeValue var0 = *(_OWORD *)&time.value;
  CMTimeEpoch epoch = time.epoch;
  a3->var3 = time.epoch;
  *(_OWORD *)&v28.CMTimeValue var0 = *(_OWORD *)&a3->var0;
  v28.var3 = epoch;
  [(TVPPlayer *)self _clampInfiniteTimeToSeekableRange:&v28];
  *(CMTime *)a3 = time;
  CMTime v10 = [(TVPPlayer *)self currentMediaItem];
  int v11 = [v10 hasTrait:@"TVPMediaItemTraitIsScene"];

  if (v11)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = *a3;
    [(TVPPlayer *)self _clampedSceneTimeForPlayerTime:&v28];
    *(CMTime *)a3 = time;
  }
  CMTime time = (CMTime)*a3;
  double Seconds = CMTimeGetSeconds(&time);
  uint64_t v13 = [(TVPPlayer *)self elapsedTimeObserverBlocks];
  id v14 = (void *)[v13 copy];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v15 = objc_msgSend(v14, "objectEnumerator", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * v19);
        [(TVPPlayer *)self rate];
        (*(void (**)(uint64_t, id, BOOL, double, double))(v20 + 16))(v20, v8, v5, Seconds, v21);
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v17);
  }

  long long v22 = [(TVPPlayer *)self currentMediaItem];
  int v23 = [v22 reportingDelegate];
  if (objc_opt_respondsToSelector()) {
    [v23 mediaItem:v22 elapsedTimeDidChangeTo:v8 playbackDateDidChangeTo:v5 dueToTimeJump:Seconds];
  }
  CMTime time = (CMTime)*a3;
  [(TVPPlayer *)self _updateIsLiveForElapsedTime:&time];
}

- (void)_updateAVPlayerActionAtItemEnd
{
  uint64_t v3 = [(TVPPlayer *)self AVQueuePlayer];
  if (v3)
  {
    uint64_t v4 = [(TVPPlayer *)self playlist];
    int64_t v5 = [(TVPPlayer *)self mediaItemEndAction];
    [(TVPPlayer *)self duration];
    if (v6 == 3.40282347e38)
    {
      CMTime v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Setting AVPlayer's actionAtItemEnd to AVPlayerActionAtItemEndNone since this is a live stream", v11, 2u);
      }
      goto LABEL_5;
    }
    if ([v4 moreItemsAvailable:0])
    {
      if (v5 != 2)
      {
        if (v5)
        {
LABEL_16:
          id v8 = v3;
          uint64_t v9 = 1;
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = [v4 endAction];
      if (v5 == 1 || v10 == 1) {
        goto LABEL_16;
      }
      if (v5 != 2)
      {
LABEL_15:
        id v8 = v3;
        uint64_t v9 = 0;
        goto LABEL_6;
      }
    }
LABEL_5:
    id v8 = v3;
    uint64_t v9 = 2;
LABEL_6:
    [v8 setActionAtItemEnd:v9];
  }
}

- (id)_statesThatReturnStartTime
{
  if (_statesThatReturnStartTime_onceToken != -1) {
    dispatch_once(&_statesThatReturnStartTime_onceToken, &__block_literal_global_588);
  }
  int v2 = (void *)_statesThatReturnStartTime_states;
  return v2;
}

uint64_t __39__TVPPlayer__statesThatReturnStartTime__block_invoke()
{
  _statesThatReturnStartTime_states = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Stopped", @"Waiting for media item to prepare for loading", @"Waiting for signal after preparing item", @"Waiting for AVAsset to load", @"Waiting for media item to prepare for playback initiation", @"Waiting for AVPlayerItem status to become ready to play", @"Waiting for more playlist items", 0);
  return MEMORY[0x270F9A758]();
}

- (id)_statesThatReturnAVPlayerTime
{
  if (_statesThatReturnAVPlayerTime_onceToken != -1) {
    dispatch_once(&_statesThatReturnAVPlayerTime_onceToken, &__block_literal_global_590);
  }
  int v2 = (void *)_statesThatReturnAVPlayerTime_states;
  return v2;
}

uint64_t __42__TVPPlayer__statesThatReturnAVPlayerTime__block_invoke()
{
  _statesThatReturnAVPlayerTime_states = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Waiting for sufficient buffer", @"Waiting for time control status to be done waiting", @"Playing", @"Paused", @"Scanning using AVPlayer", @"Scanning using AVPlayer driven by AVKit", @"Scrubbing using progressive jumping", 0);
  return MEMORY[0x270F9A758]();
}

- (id)_statesThatReturnSeekTime
{
  if (_statesThatReturnSeekTime_onceToken != -1) {
    dispatch_once(&_statesThatReturnSeekTime_onceToken, &__block_literal_global_592);
  }
  int v2 = (void *)_statesThatReturnSeekTime_states;
  return v2;
}

uint64_t __38__TVPPlayer__statesThatReturnSeekTime__block_invoke()
{
  _statesThatReturnSeekTime_states = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"Waiting for seek", @"Scrubbing using progressive jumping waiting for seek", 0);
  return MEMORY[0x270F9A758]();
}

- (void)_notifyOfBoundaryCrossingBetweenPreviousTime:(id *)a3 updatedTime:(id *)a4
{
  if ((a3->var2 & 0x1D) == 1 && (a4->var2 & 0x1D) == 1)
  {
    memset(&v14, 0, sizeof(v14));
    time1.CMTime start = (CMTime)*a3;
    CMTime time2 = *(CMTime *)a4;
    CMTimeMinimum(&v14, &time1.start, &time2);
    memset(&time2, 0, sizeof(time2));
    time1.CMTime start = (CMTime)*a3;
    CMTime start = (CMTime)*a4;
    CMTimeMaximum(&time2, &time1.start, &start);
    memset(&time1, 0, sizeof(time1));
    CMTime start = v14;
    CMTime end = time2;
    CMTimeRangeFromTimeToTime(&time1, &start, &end);
    CMTime v7 = [(TVPPlayer *)self boundaryTimeObserverInfos];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __70__TVPPlayer__notifyOfBoundaryCrossingBetweenPreviousTime_updatedTime___block_invoke;
    v8[3] = &__block_descriptor_80_e52_v32__0__NSUUID_8__TVPBoundaryTimeObserverInfo_16_B24l;
    CMTimeRange v9 = time1;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __70__TVPPlayer__notifyOfBoundaryCrossingBetweenPreviousTime_updatedTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v5 = [v4 times];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    CMTimeRange v9 = (_OWORD *)(a1 + 32);
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v11) {
          [v11 CMTimeValue];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        long long v12 = v9[1];
        *(_OWORD *)&v15.start.value = *v9;
        *(_OWORD *)&v15.start.CMTimeEpoch epoch = v12;
        *(_OWORD *)&v15.duration.timescale = v9[2];
        if (CMTimeRangeContainsTime(&v15, &time))
        {
          uint64_t v13 = [v4 handler];
          CMTime v14 = (void *)v13;
          if (v13) {
            (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
          }

          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (BOOL)_currentPlayerItemCanScanAtRate:(double)a3
{
  if (a3 != 0.0 && a3 != 1.0)
  {
    uint64_t v6 = [(TVPPlayer *)self currentPlayerItem];
    uint64_t v7 = v6;
    if (a3 > 0.0 && a3 < 1.0)
    {
      char v10 = [v6 canPlaySlowForward];
    }
    else
    {
      if (a3 >= 1.0 && a3 <= 2.0) {
        goto LABEL_27;
      }
      if (a3 <= 2.0)
      {
        if (a3 == -1.0)
        {
          char v10 = [v6 canPlayReverse];
        }
        else if (a3 <= -1.0 || a3 >= 0.0)
        {
          if (a3 >= -1.0)
          {
LABEL_27:
            BOOL v4 = 1;
            goto LABEL_28;
          }
          char v10 = [v6 canPlayFastReverse];
        }
        else
        {
          char v10 = [v6 canPlaySlowReverse];
        }
      }
      else
      {
        char v10 = [v6 canPlayFastForward];
      }
    }
    BOOL v4 = v10;
LABEL_28:

    return v4;
  }
  return 0;
}

- (void)_setState:(id)a3 updatedRate:(double)a4 notifyListeners:(BOOL)a5
{
}

- (void)_setState:(id)a3 updatedRate:(double)a4 reason:(id)a5 notifyListeners:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v39 = *MEMORY[0x263EF8340];
  int v11 = (TVPPlaybackState *)a3;
  id v29 = a5;
  p_state = &self->_state;
  if (self->_state != v11
    || (+[TVPPlaybackState scanning],
        $3CC8671D27C23BF42ADDB32F2B5E48AE v28 = (TVPPlaybackState *)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 == v11))
  {
    uint64_t v13 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      long long v38 = v11;
      _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Setting state to %@", buf, 0xCu);
    }
    CMTime v14 = *p_state;
    CMTimeRange v15 = v11;
    uint64_t v16 = v15;
    if (v6)
    {
      v35[0] = @"TVPPlaybackStateOldStateKey";
      v35[1] = @"TVPPlaybackStateNewStateKey";
      v36[0] = v14;
      v36[1] = v15;
      v35[2] = @"TVPPlaybackStateNewRateKey";
      long long v17 = [NSNumber numberWithDouble:a4];
      v36[2] = v17;
      long long v18 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

      long long v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v18];
      long long v20 = v19;
      if (v29) {
        [v19 setObject:v29 forKey:@"TVPPlaybackStateChangeReasonKey"];
      }
      id v21 = v20;
      uint64_t v22 = [MEMORY[0x263F08A00] defaultCenter];
      [v22 postNotificationName:@"TVPPlaybackStateWillChangeNotification" object:self userInfo:v21];

      int v23 = [(TVPPlayer *)self currentMediaItem];
      long long v24 = [v23 reportingDelegate];
      if (objc_opt_respondsToSelector()) {
        [v24 mediaItem:v23 willChangeFromPlaybackState:v14 toPlaybackState:v16 updatedRate:self player:a4];
      }
      [(TVPPlayer *)self willChangeValueForKey:@"rate", v29];

      objc_storeStrong((id *)&self->_state, a3);
      objc_initWeak((id *)buf, self);
      long long v25 = [(TVPPlayer *)self stateMachine];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __58__TVPPlayer__setState_updatedRate_reason_notifyListeners___block_invoke;
      void v30[3] = &unk_264CC5A28;
      objc_copyWeak(v34, (id *)buf);
      long long v26 = (TVPPlaybackState *)v21;
      uint64_t v31 = v26;
      uint64_t v32 = v14;
      int v33 = v16;
      v34[1] = *(id *)&a4;
      [v25 executeBlockAfterCurrentStateTransition:v30];

      objc_destroyWeak(v34);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      long long v27 = v15;
      long long v26 = *p_state;
      *p_state = v27;
    }
  }
}

void __58__TVPPlayer__setState_updatedRate_reason_notifyListeners___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [v2 postNotificationName:@"TVPPlaybackStateDidChangeNotification" object:WeakRetained userInfo:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  id v12 = [v5 currentMediaItem];

  BOOL v6 = [v12 reportingDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    double v9 = *(double *)(a1 + 64);
    id v10 = objc_loadWeakRetained((id *)(a1 + 56));
    [v6 mediaItem:v12 didChangeFromPlaybackState:v7 toPlaybackState:v8 updatedRate:v10 player:v9];
  }
  id v11 = objc_loadWeakRetained(v3);
  [v11 didChangeValueForKey:@"rate"];
}

- (int)_videoTrackIDFromTracks:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = *MEMORY[0x263EF9D48];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) assetTrack];
        if ([v10 statusOfValueForKey:@"mediaType" error:0] == 2)
        {
          id v11 = [v10 mediaType];
          if ([v11 isEqualToString:v8]
            && [v10 statusOfValueForKey:@"trackID" error:0] == 2)
          {
            int v6 = [v10 trackID];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)updateAudioSelectionCriteria
{
  id v9 = [(id)objc_opt_class() savedPreferredAudioLanguageCode];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(TVPPlayer *)self preferredAudioLanguageCode];

  if (v4)
  {
    uint64_t v5 = [(TVPPlayer *)self preferredAudioLanguageCode];
    [v3 addObject:v5];
  }
  if (v9) {
    [v3 addObject:v9];
  }
  int v6 = objc_opt_class();
  uint64_t v7 = [(TVPPlayer *)self AVQueuePlayer];
  uint64_t v8 = [(TVPPlayer *)self currentMediaItemLoader];
  objc_msgSend(v6, "_updateAudioSelectionCriteriaForAVQueuePlayer:mediaItemLoader:preferredAudioLanguageCodes:prefersAudioDescriptions:", v7, v8, v3, -[TVPPlayer prefersAudioDescriptions](self, "prefersAudioDescriptions"));
}

+ (void)_updateAudioSelectionCriteriaForAVQueuePlayer:(id)a3 mediaItemLoader:(id)a4 preferredAudioLanguageCodes:(id)a5 prefersAudioDescriptions:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (v9)
  {
    id v10 = a5;
    id v11 = a4;
    id v12 = objc_msgSend(v9, "tvp_cachedAudioSelectionCriteria");
    long long v13 = [(id)objc_opt_class() _audioSelectionCriteriaForPreferredAudioLanguageCodes:v10 mediaItemLoader:v11 prefersAudioDescriptions:v6];

    if (v12 != v13 && (objc_msgSend(v12, "tvp_isEqualToCriteria:", v13) & 1) == 0)
    {
      long long v14 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        long long v16 = v13;
        _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Setting audible media selection criteria to %@", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(v9, "setTvp_cachedAudioSelectionCriteria:", v13);
      [v9 setMediaSelectionCriteria:v13 forMediaCharacteristic:*MEMORY[0x263EF9C80]];
    }
  }
}

- (void)_resetAndReselectAudioOptions
{
  [(TVPPlayer *)self updateAudioSelectionCriteria];
  [(TVPPlayer *)self setAudioOptions:0];
  [(TVPPlayer *)self setSelectedAudioOption:0];
}

- (void)_updateSelectedSubtitleForFilteredOptions:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(TVPPlayer *)self selectedSubtitleOption];
  if (([v13 containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = [v13 firstObject];
    if (v5)
    {
      BOOL v6 = +[TVPSubtitleOption autoSubtitleOption];
      int v7 = [v4 isEqual:v6];

      if (v7)
      {
        uint64_t v8 = [v4 avMediaSelectionOption];
        id v9 = v8;
        if (v8 && ![v8 hasMediaCharacteristic:*MEMORY[0x263EF9C98]])
        {
          id v10 = [[TVPSubtitleOption alloc] initWithAVMediaSelectionOption:v9];
        }
        else
        {
          id v10 = +[TVPSubtitleOption offSubtitleOption];
        }
        id v11 = v10;
        if ([v13 containsObject:v10])
        {
          id v12 = v11;

          uint64_t v5 = v12;
        }
      }
    }
    else
    {
      uint64_t v5 = +[TVPSubtitleOption offSubtitleOption];
    }
    [(TVPPlayer *)self _setSelectedSubtitleOption:v5 userOverridesSystemSubtitleSettings:0];
  }
}

- (void)_setSelectedSubtitleOption:(id)a3 userOverridesSystemSubtitleSettings:(BOOL)a4
{
  BOOL v4 = a4;
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(TVPPlayer *)self currentPlayerItem];
  if ([v7 status] == 1)
  {
    uint64_t v8 = [v7 asset];
    uint64_t v9 = *MEMORY[0x263EF9CD0];
    id v10 = objc_msgSend(v8, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9CD0]);

    [(TVPPlayer *)self willChangeValueForKey:@"selectedSubtitleOption"];
    if (v6)
    {
      id v11 = +[TVPSubtitleOption offSubtitleOption];
      int v12 = [v6 isEqual:v11];

      if (v12
        || (+[TVPSubtitleOption autoSubtitleOption],
            id v13 = objc_claimAutoreleasedReturnValue(),
            int v14 = [v6 isEqual:v13],
            v13,
            v14))
      {
        [(TVPPlayer *)self setTemporarySubtitleOverrideType:0];
        int v15 = [(TVPPlayer *)self AVQueuePlayer];
        [v15 setMediaSelectionCriteria:0 forMediaCharacteristic:v9];

        MACaptionAppearancePrefSetDisplayType();
        MACaptionAppearancePrefSetPreferredLanguages();
        [v7 selectMediaOptionAutomaticallyInMediaSelectionGroup:v10];
      }
      else
      {
        uint64_t v16 = [v6 languageCodeFromLocale];
        uint64_t v17 = (void *)v16;
        if (v4)
        {
          MACaptionAppearancePrefSetDisplayType();
          MACaptionAppearancePrefSetPreferredLanguages();
          uint64_t v18 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v17];
          objc_msgSend(v18, "tvp_subtitleLanguageCode");
          long long v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v19) {
            MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v19);
          }

          long long v20 = 0;
          id v21 = 0;
        }
        else
        {
          if (v16)
          {
            id v22 = objc_alloc(MEMORY[0x263EFA848]);
            v28[0] = v17;
            int v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
            uint64_t v27 = *MEMORY[0x263EF9CC0];
            long long v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
            id v21 = (void *)[v22 initWithPreferredLanguages:v23 preferredMediaCharacteristics:v24];
          }
          else
          {
            id v21 = 0;
          }
          long long v20 = &unk_26EA25CD8;
        }
        [(TVPPlayer *)self setTemporarySubtitleOverrideType:v20];
        long long v25 = [(TVPPlayer *)self AVQueuePlayer];
        [v25 setMediaSelectionCriteria:v21 forMediaCharacteristic:v9];

        long long v26 = [v6 avMediaSelectionOption];
        [v7 selectMediaOption:v26 inMediaSelectionGroup:v10];
      }
    }
    else
    {
      [v7 selectMediaOption:0 inMediaSelectionGroup:v10];
    }
    [(TVPPlayer *)self didChangeValueForKey:@"selectedSubtitleOption"];
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentMediaItemForwardPlaybackEndTime
{
  long long v15 = 0uLL;
  CMTimeEpoch v16 = 0;
  [(TVPPlayer *)self cachedDuration];
  uint64_t v5 = [(TVPPlayer *)self currentMediaItem];
  id v6 = v5;
  *(void *)&retstr->CMTimeScale var1 = 0;
  retstr->var3 = 0;
  retstr->CMTimeValue var0 = 0;
  if ((~HIDWORD(v15) & 0x11) != 0)
  {
    uint64_t v9 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataForwardPlaybackEndTime"];
    int v7 = v9;
    if (v9)
    {
      [v9 doubleValue];
      CMTimeMakeWithSeconds(&v14.start, v10, 1000000);
      *(_OWORD *)&retstr->CMTimeValue var0 = *(_OWORD *)&v14.start.value;
      CMTimeEpoch epoch = v14.start.epoch;
    }
    else
    {
      *(_OWORD *)&retstr->CMTimeValue var0 = v15;
      CMTimeEpoch epoch = v16;
    }
  }
  else
  {
    int v7 = [(TVPPlayer *)self cachedSeekableTimeRanges];
    memset(&v14, 0, sizeof(v14));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v7];
    CMTimeRange v12 = v14;
    CMTimeRangeGetEnd(&v13, &v12);
    *(_OWORD *)&retstr->CMTimeValue var0 = *(_OWORD *)&v13.value;
    CMTimeEpoch epoch = v13.epoch;
  }
  retstr->var3 = epoch;

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentMediaItemReversePlaybackEndTime
{
  uint64_t v5 = [(TVPPlayer *)self currentMediaItem];
  *(void *)&retstr->CMTimeScale var1 = 0;
  retstr->var3 = 0;
  retstr->CMTimeValue var0 = 0;
  [(TVPPlayer *)self cachedDuration];
  if (v16)
  {
    [(TVPPlayer *)self cachedDuration];
    if ((v15 & 0x10) != 0)
    {
      int v7 = [(TVPPlayer *)self cachedSeekableTimeRanges];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
      +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v7];
      goto LABEL_7;
    }
  }
  id v6 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataReversePlaybackEndTime"];
  int v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    CMTimeMakeWithSeconds((CMTime *)&v12, v8, 1000000);
LABEL_7:
    *(_OWORD *)&retstr->CMTimeValue var0 = v12;
    int64_t v10 = v13;
    goto LABEL_8;
  }
  uint64_t v9 = MEMORY[0x263F010E0];
  *(_OWORD *)&retstr->CMTimeValue var0 = *MEMORY[0x263F010E0];
  int64_t v10 = *(void *)(v9 + 16);
LABEL_8:
  retstr->var3 = v10;

  return result;
}

- (void)_updateVideoViewsWithAVQueuePlayer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TVPPlayer *)self videoViewWeakReferences];
  id v6 = [v5 allObjects];

  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke;
  v12[3] = &unk_264CC5A50;
  void v12[4] = &v13;
  [v6 enumerateObjectsUsingBlock:v12];
  if (v14[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = objc_msgSend(v6, "objectAtIndex:");
    [v7 setAVPlayer:v4];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke_2;
  v9[3] = &unk_264CC5A78;
  id v11 = &v13;
  id v8 = v4;
  id v10 = v8;
  [v6 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(&v13, 8);
}

uint64_t __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isPrimarySubtitleDisplayer];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) != a3) {
    return [a2 setAVPlayer:*(void *)(result + 32)];
  }
  return result;
}

- (BOOL)_isPlaybackLikelyToKeepUp
{
  id v3 = [(TVPPlayer *)self currentPlayerItem];
  if ([v3 isPlaybackLikelyToKeepUp])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(TVPPlayer *)self currentPlayerItem];
    BOOL v4 = ([v5 isPlaybackBufferFull] & 1) != 0
      || [(TVPPlayer *)self sceneCompletelyBuffered];
  }
  return v4;
}

- (id)playbackErrorFromError:(id)a3 forMediaItem:(id)a4
{
  v74[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v15 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"TVPlaybackErrorDomain" code:801 userInfo:0];
    goto LABEL_47;
  }
  id v8 = [v6 domain];
  if ([v8 isEqualToString:*MEMORY[0x263F08570]]
    && ([v6 code] == -1009 || objc_msgSend(v6, "code") == -1018))
  {

    goto LABEL_8;
  }
  uint64_t v9 = [v6 domain];
  if ([v9 isEqualToString:@"SSErrorDomain"])
  {
    uint64_t v10 = [v6 code];

    if (v10 == 110)
    {
LABEL_8:
      uint64_t v73 = *MEMORY[0x263F08608];
      v74[0] = v6;
      id v11 = [NSDictionary dictionaryWithObjects:v74 forKeys:&v73 count:1];
      long long v12 = (void *)[v11 mutableCopy];

      uint64_t v13 = [v6 userInfo];
      long long v14 = [v13 objectForKey:*MEMORY[0x263F085A0]];

      if (v14)
      {
        if ([v14 integerValue])
        {
          if ([v14 integerValue] == 2)
          {
LABEL_38:
            uint64_t v36 = 834;
            goto LABEL_46;
          }
          goto LABEL_35;
        }
LABEL_45:
        unsigned int v41 = [v7 hasTrait:@"TVPMediaItemTraitCellularPlaybackProhibited"];
        uint64_t v42 = [NSNumber numberWithInteger:v41];
        [v12 setObject:v42 forKey:@"TVPlaybackCellularPlaybackProhibitedErrorReasonKey"];

        uint64_t v36 = 824;
        goto LABEL_46;
      }
      id v29 = +[TVPReachabilityMonitor sharedInstance];
      if ([v29 networkType] == 2)
      {
        if (![(TVPPlayer *)self allowsCellularUsage])
        {

          goto LABEL_43;
        }
        char v30 = [v7 hasTrait:@"TVPMediaItemTraitCellularPlaybackProhibited"];

        if (v30)
        {
LABEL_43:
          long long v40 = sPlayerLogObject;
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id buf = 0;
            _os_log_impl(&dword_236FC5000, v40, OS_LOG_TYPE_DEFAULT, "Network type is cellular and cellular playback is prohibited.  Assuming internet not connected error occurred due to cellular policy", buf, 2u);
          }
          goto LABEL_45;
        }
      }
      else
      {
      }
      if (![(TVPPlayer *)self allowsConstrainedNetworkUsage])
      {
        CFDictionaryRef v37 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_236FC5000, v37, OS_LOG_TYPE_DEFAULT, "Constrained network playback is prohibited. Assuming internet not connected error occurred due to constrained network policy", buf, 2u);
        }
        goto LABEL_38;
      }
LABEL_35:
      uint64_t v36 = 808;
LABEL_46:
      id v15 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"TVPlaybackErrorDomain" code:v36 userInfo:v12];

      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v16 = [v6 domain];
  int v17 = [v16 isEqualToString:*MEMORY[0x263EF98B0]];

  if (v17)
  {
    id v15 = v6;
    if ([v15 code] == -11835)
    {
      uint64_t v18 = [(TVPPlayer *)self currentMediaItem];
      int v19 = [v18 hasTrait:@"TVPMediaItemTraitIsHomeSharingContent"];

      if (v19)
      {
        uint64_t v71 = *MEMORY[0x263F08608];
        id v72 = v15;
        long long v20 = NSDictionary;
        id v21 = &v72;
        id v22 = &v71;
      }
      else
      {
        uint64_t v69 = *MEMORY[0x263F08608];
        id v70 = v15;
        long long v20 = NSDictionary;
        id v21 = &v70;
        id v22 = &v69;
      }
      long long v38 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
      uint64_t v39 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"TVPlaybackErrorDomain" code:811 userInfo:v38];

LABEL_41:
      id v15 = v39;
      goto LABEL_47;
    }
    if ([v15 code] == -11807) {
      goto LABEL_31;
    }
    uint64_t v31 = [v15 userInfo];
    uint64_t v32 = *MEMORY[0x263F08608];
    int v33 = [v31 objectForKey:*MEMORY[0x263F08608]];
    uint64_t v34 = [v33 code];

    if (v34 == -12541)
    {
LABEL_31:
      uint64_t v35 = [objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"TVPlaybackErrorDomain" code:825 userInfo:0];

LABEL_32:
      id v15 = (id)v35;
      goto LABEL_47;
    }
    if ([v15 code] == -11868)
    {
      id v44 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v67 = v32;
      id v68 = v15;
      int v45 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      v46 = v44;
      uint64_t v47 = 826;
LABEL_52:
      uint64_t v35 = [v46 initWithDomain:@"TVPlaybackErrorDomain" code:v47 userInfo:v45];

      goto LABEL_32;
    }
    if ([v15 code] == -11870)
    {
      id v48 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v65 = v32;
      id v66 = v15;
      CMTime v49 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      uint64_t v39 = (void *)[v48 initWithDomain:@"TVPlaybackErrorDomain" code:827 userInfo:v49];

      CMTime v50 = [(TVPPlayer *)self currentMediaItem];
      LOBYTE(v48) = objc_opt_respondsToSelector();

      if (v48)
      {
        long long v51 = [(TVPPlayer *)self currentMediaItem];
        long long v52 = [v51 replacementErrorForPlaybackError:v39];

        if (v52 && v52 != v39)
        {
          long long v53 = sPlayerLogObject;
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 138412546;
            id v62 = v39;
            __int16 v63 = 2112;
            id v64 = v52;
            _os_log_impl(&dword_236FC5000, v53, OS_LOG_TYPE_DEFAULT, "Media item replaced original error %@ with %@", buf, 0x16u);
          }
          id v54 = v52;

          uint64_t v39 = v54;
        }
      }
      goto LABEL_41;
    }
    long long v55 = [v15 userInfo];
    long long v56 = [v55 objectForKey:v32];
    uint64_t v57 = [v56 code];

    if ((v57 & 0xFFFFFFFFFFFFFFFBLL) == 0xFFFFFFFFFFFFBCB8)
    {
      id v58 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v59 = v32;
      id v60 = v15;
      int v45 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      v46 = v58;
      uint64_t v47 = 830;
      goto LABEL_52;
    }
  }
  else
  {
    int v23 = [(TVPPlayer *)self currentMediaItem];
    int v24 = objc_opt_respondsToSelector();

    id v15 = v6;
    if (v24)
    {
      long long v25 = [(TVPPlayer *)self currentMediaItem];
      id v26 = [v25 replacementErrorForPlaybackError:v15];

      if (v26 && v26 != v15)
      {
        uint64_t v27 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138412546;
          id v62 = v15;
          __int16 v63 = 2112;
          id v64 = v26;
          _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Media item replaced original error %@ with %@", buf, 0x16u);
        }
        id v28 = v26;

        id v15 = v28;
      }
    }
  }
LABEL_47:

  return v15;
}

- (id)beginCoordinatedPlaybackSuspensionWithReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVPPlayer *)self AVQueuePlayer];

  if (v5)
  {
    id v6 = [(TVPPlayer *)self AVQueuePlayer];
    id v7 = [v6 playbackCoordinator];
    id v8 = [v7 beginSuspensionForReason:v4];

    uint64_t v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Beginning coordinated playback suspension: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_236FC5000, v10, OS_LOG_TYPE_DEFAULT, "Unable to begin playback suspension because AVPlayer has not been created yet", (uint8_t *)&v12, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)endCoordinatedPlaybackSuspension:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = sPlayerLogObject;
  BOOL v5 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Ending coordinated playback suspension: %@", (uint8_t *)&v6, 0xCu);
    }
    [v3 end];
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_236FC5000, v4, OS_LOG_TYPE_DEFAULT, "Unable to end playback suspension because suspension is nil", (uint8_t *)&v6, 2u);
  }
}

- (id)_soundCheckNormalizationForMediaItem:(id)a3
{
  id v3 = [a3 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSoundCheckVolumeNormalization"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((int v4 = [v3 intValue]) != 0 ? (v6 = v4 == 0xFFFF) : (v6 = 1), v6))
  {
    id v7 = 0;
  }
  else
  {
    if (v4 < 1) {
      LODWORD(v5) = 1.0;
    }
    else {
      *(float *)&double v5 = sqrtf(1000.0 / (float)v4);
    }
    id v7 = [NSNumber numberWithFloat:v5];
  }

  return v7;
}

- (void)_updateIsLiveForElapsedTime:(id *)a3
{
  [(TVPPlayer *)self cachedDuration];
  if ((v14 & 1) == 0) {
    goto LABEL_5;
  }
  [(TVPPlayer *)self cachedDuration];
  if ((v13 & 0x10) == 0) {
    goto LABEL_5;
  }
  memset(&v12, 0, sizeof(v12));
  double v5 = [(TVPPlayer *)self cachedSeekableTimeRanges];
  +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v5];

  if ((a3->var2 & 1) == 0 || (v12.start.flags & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v6 = 0;
  if ((v12.duration.flags & 1) != 0 && !v12.duration.epoch && (v12.duration.value & 0x8000000000000000) == 0)
  {
    time1.CMTime start = v12.duration;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    if (!CMTimeCompare(&time1.start, &time2))
    {
LABEL_5:
      BOOL v6 = 0;
      goto LABEL_6;
    }
    memset(&time2, 0, sizeof(time2));
    CMTimeMakeWithSeconds(&time2, 10.0, 1000000);
    time1.CMTime start = v12.duration;
    CMTime v10 = time2;
    if (CMTimeCompare(&time1.start, &v10) < 1)
    {
      BOOL v6 = 1;
    }
    else
    {
      memset(&v10, 0, sizeof(v10));
      CMTimeRange time1 = v12;
      CMTimeRangeGetEnd(&lhs, &time1);
      time1.CMTime start = time2;
      CMTimeSubtract(&v10, &lhs, &time1.start);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
      time1.start.CMTimeEpoch epoch = a3->var3;
      CMTime v7 = v10;
      BOOL v6 = CMTimeCompare(&time1.start, &v7) >= 0;
    }
  }
LABEL_6:
  [(TVPPlayer *)self setIsLive:v6];
}

- (void)_enqueueAsyncDelegateOperation:(id)a3
{
  id v4 = a3;
  double v5 = [(TVPPlayer *)self asyncDelegateOperations];
  [v5 addObject:v4];

  BOOL v6 = [(TVPPlayer *)self asyncDelegateOperations];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    [(TVPPlayer *)self setAsyncDelegateInProgress:1];
    [(TVPPlayer *)self _processNextAsyncDelegateOperation];
  }
}

- (void)_processNextAsyncDelegateOperation
{
  uint64_t v2 = sTVPPlaybackPerfToken++;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  CMTime v3[2] = __47__TVPPlayer__processNextAsyncDelegateOperation__block_invoke;
  v3[3] = &unk_264CC54E8;
  v3[4] = self;
  v3[5] = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __47__TVPPlayer__processNextAsyncDelegateOperation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) asyncDelegateOperations];
  uint64_t v3 = [v2 count];

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    double v5 = [v4 asyncDelegateOperations];
    id v8 = [v5 firstObject];

    BOOL v6 = [v8 block];

    if (v6)
    {
      uint64_t v7 = [v8 block];
      v7[2]();
    }
  }
  else
  {
    [v4 setAsyncDelegateInProgress:0];
  }
}

- (void)_configureSoundCheckForPlayerItem:(id)a3 tracks:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = [a3 mediaItemLoader];
  uint64_t v7 = [v6 mediaItem];

  id v8 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSoundCheckDictionary"];
  if ([v8 count])
  {
    int v23 = v8;
    uint64_t v9 = (void *)[v8 mutableCopy];
    int v24 = v7;
    uint64_t v10 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSoundCheckMediaKind"];
    if (v10) {
      [v9 setObject:v10 forKey:*MEMORY[0x263EFC120]];
    }
    id v22 = (void *)v10;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v5;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      uint64_t v15 = *MEMORY[0x263EF9CE8];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          int v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v17, "isEnabled", v22))
          {
            uint64_t v18 = [v17 assetTrack];
            int v19 = [v18 mediaType];
            int v20 = [v19 isEqualToString:v15];

            if (v20)
            {
              id v21 = sPlayerLogObject;
              if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id buf = 138412290;
                uint64_t v31 = v9;
                _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Sound check: setting AVPlayerItemTrack loudnessInfo to %@", buf, 0xCu);
              }
              [v17 setLoudnessInfo:v9];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v13);
    }

    uint64_t v7 = v24;
    id v5 = v25;
    id v8 = v23;
  }
}

- (id)_currentDateFromPlayerItem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 status] == 1)
  {
    id v5 = [v4 currentDate];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_beingUsedForIFrameOnlyPlayback
{
  [(TVPPlayer *)self iFramePrefetchMaxSize];
  return v3 != *(double *)(MEMORY[0x263F001B0] + 8) || v2 != *MEMORY[0x263F001B0];
}

- (void)_logAccessLogEvents
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v3 = [(TVPPlayer *)self accessLog];
  id v4 = [v3 events];
  id v5 = [v4 lastObject];

  [v5 observedBitrate];
  if (v6 > 0.0)
  {
    uint64_t v7 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      [v5 observedBitrate];
      uint64_t v9 = -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      int v26 = 138412290;
      long long v27 = v9;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "network bandwidth: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  [v5 averageVideoBitrate];
  if (v10 > 0.0)
  {
    id v11 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v11;
      [v5 averageVideoBitrate];
      uint64_t v13 = -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      int v26 = 138412290;
      long long v27 = v13;
      _os_log_impl(&dword_236FC5000, v12, OS_LOG_TYPE_DEFAULT, "average bitrate video: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  [v5 averageAudioBitrate];
  if (v14 > 0.0)
  {
    uint64_t v15 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      [v5 averageAudioBitrate];
      int v17 = -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      int v26 = 138412290;
      long long v27 = v17;
      _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "average bitrate audio: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  [v5 indicatedBitrate];
  if (v18 > 0.0)
  {
    int v19 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = v19;
      [v5 indicatedBitrate];
      id v21 = -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      int v26 = 138412290;
      long long v27 = v21;
      _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, "indicated bitrate peak: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  [v5 indicatedAverageBitrate];
  if (v22 > 0.0)
  {
    int v23 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = v23;
      [v5 indicatedAverageBitrate];
      id v25 = -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      int v26 = 138412290;
      long long v27 = v25;
      _os_log_impl(&dword_236FC5000, v24, OS_LOG_TYPE_DEFAULT, "indicated bitrate avg: %@", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (id)_bitRateString:(double)a3
{
  double v3 = a3 / 1000.0;
  if (a3 / 1000.0 <= 1.0)
  {
    id v4 = @"bps";
  }
  else
  {
    a3 = v3 / 1000.0;
    if (v3 / 1000.0 <= 1.0)
    {
      id v4 = @"kbps";
      a3 = v3;
    }
    else
    {
      id v4 = @"Mbps";
    }
  }
  return (id)[NSString stringWithFormat:@"%0.2f%@", *(void *)&a3, v4];
}

- (id)_assetTracksOfType:(id)a3 fromTracks:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "assetTrack", (void)v17);
        if ([v13 statusOfValueForKey:@"mediaType" error:0] == 2)
        {
          double v14 = [v13 mediaType];
          int v15 = [v14 isEqualToString:v5];

          if (v15) {
            [v7 addObject:v13];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_descriptionForVideoResolutionClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"TVPVideoResolutionClassUnknown";
  }
  else {
    return off_264CC64D0[a3 - 1];
  }
}

- (id)_descriptionForVideoRange:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"TVPVideoRangeUnknown";
  }
  else {
    return off_264CC64E8[a3 - 1];
  }
}

- (void)_updateCurrentMediaItemAudioInfoForPlayerItem:(id)a3 tracks:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  val = self;
  id v6 = -[TVPPlayer _assetTracksOfType:fromTracks:](self, "_assetTracksOfType:fromTracks:", *MEMORY[0x263EF9CE8]);
  uint64_t v7 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v30[0] = @"enabled";
        v30[1] = @"formatDescriptions";
        uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v30, 2, v16);
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke;
        v24[3] = &unk_264CC5470;
        id v25 = v7;
        [v12 loadValuesAsynchronouslyForKeys:v13 completionHandler:v24];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  objc_initWeak(&location, val);
  double v14 = [(TVPPlayer *)val avAssetTrackInspectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_2;
  block[3] = &unk_264CC5750;
  id v21 = obj;
  id v15 = obj;
  objc_copyWeak(&v22, &location);
  dispatch_group_notify(v7, v14, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke(uint64_t a1)
{
}

void __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v28;
    uint64_t mChannelLayoutTag_low = -1;
    uint64_t v18 = *(void *)v28;
    id v19 = v1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v8 statusOfValueForKey:@"enabled" error:0] == 2
          && [v8 isEnabled]
          && [v8 statusOfValueForKey:@"formatDescriptions" error:0] == 2)
        {
          uint64_t v9 = [v8 formatDescriptions];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                double v14 = *(const opaqueCMFormatDescription **)(*((void *)&v23 + 1) + 8 * j);
                int64_t v15 = +[TVPPlayer _audioFormatForFormatDescription:v14];
                if (v15 > (uint64_t)v4) {
                  id v4 = (void *)v15;
                }
                size_t sizeOut = 0;
                FormatList = CMAudioFormatDescriptionGetFormatList(v14, &sizeOut);
                if (FormatList && mChannelLayoutTag_low <= LOWORD(FormatList->mChannelLayoutTag)) {
                  uint64_t mChannelLayoutTag_low = LOWORD(FormatList->mChannelLayoutTag);
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }

          uint64_t v5 = v18;
          id v1 = v19;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
    uint64_t mChannelLayoutTag_low = -1;
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_3;
  block[3] = &unk_264CC5AA0;
  objc_copyWeak(v21, (id *)(a1 + 40));
  v21[1] = v4;
  id v21[2] = (id)mChannelLayoutTag_low;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v21);
}

void __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained currentMediaItemAudioFormat] != *(void *)(a1 + 40))
    {
      id v4 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = v4;
        id v6 = [(id)objc_opt_class() _stringForAudioFormat:*(void *)(a1 + 40)];
        int v9 = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Audio format: %@", (uint8_t *)&v9, 0xCu);
      }
      [v3 setCurrentMediaItemAudioFormat:*(void *)(a1 + 40)];
    }
    if ([v3 currentMediaItemAudioChannels] != *(void *)(a1 + 48))
    {
      uint64_t v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void **)(a1 + 48);
        int v9 = 134217984;
        uint64_t v10 = v8;
        _os_log_impl(&dword_236FC5000, v7, OS_LOG_TYPE_DEFAULT, "Audio channels: %ld", (uint8_t *)&v9, 0xCu);
      }
      [v3 setCurrentMediaItemAudioChannels:*(void *)(a1 + 48)];
    }
  }
}

- (void)_updateCurrentMediaItemVideoRangeForTracks:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v14 = a3;
  val = self;
  id v4 = -[TVPPlayer _assetTracksOfType:fromTracks:](self, "_assetTracksOfType:fromTracks:", *MEMORY[0x263EF9D48]);
  uint64_t v5 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        dispatch_group_enter(v5);
        v27[0] = @"enabled";
        v27[1] = @"formatDescriptions";
        uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
        v21[0] = v8;
        v21[1] = 3221225472;
        id v21[2] = __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke;
        id v21[3] = &unk_264CC5470;
        id v22 = v5;
        [v10 loadValuesAsynchronouslyForKeys:v11 completionHandler:v21];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  objc_initWeak(&location, val);
  uint64_t v12 = [(TVPPlayer *)val avAssetTrackInspectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_2;
  block[3] = &unk_264CC5750;
  id v18 = obj;
  id v13 = obj;
  objc_copyWeak(&v19, &location);
  dispatch_group_notify(v5, v12, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke(uint64_t a1)
{
}

void __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = 0;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v7 statusOfValueForKey:@"enabled" error:0] == 2
          && [v7 isEnabled]
          && [v7 statusOfValueForKey:@"formatDescriptions" error:0] == 2)
        {
          uint64_t v8 = [v7 formatDescriptions];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v19;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v19 != v11) {
                  objc_enumerationMutation(v8);
                }
                int VideoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
              }
              int v4 = VideoDynamicRange;
              uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v10);
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_3;
  block[3] = &unk_264CC5AC8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  int v17 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v16);
}

void __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = [(id)objc_opt_class() tvpVideoRangeForVideoDynamicRange:*(unsigned int *)(a1 + 40)];
    [WeakRetained setCurrentMediaItemVideoRange:v3];
    int v4 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [WeakRetained _descriptionForVideoRange:v3];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_236FC5000, v5, OS_LOG_TYPE_DEFAULT, "Current video range: <%@>", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (int64_t)_audioFormatForFormatDescription:(opaqueCMFormatDescription *)a3
{
  signed int MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  int64_t result = 4;
  if (MediaSubType <= 1885692722)
  {
    if (MediaSubType > 1700997938)
    {
      if (MediaSubType == 1700997939) {
        return result;
      }
      if (MediaSubType != 1700998451)
      {
        int v6 = 1885547315;
        goto LABEL_16;
      }
LABEL_18:
      size_t sizeOut = 0;
      FormatList = CMAudioFormatDescriptionGetFormatList(a3, &sizeOut);
      if (!FormatList || sizeOut <= 0x2F) {
        goto LABEL_28;
      }
      int mFormatID = FormatList->mASBD.mFormatID;
      if (mFormatID <= 1885547314)
      {
        if (mFormatID == 1667574579) {
          return 4;
        }
        int v10 = 1700997939;
      }
      else
      {
        if (mFormatID == 1885547315 || mFormatID == 1902324531) {
          return 4;
        }
        int v10 = 2053319475;
      }
      if (mFormatID != v10) {
        goto LABEL_28;
      }
      return 4;
    }
    if (MediaSubType == 1667574579) {
      return result;
    }
    int v7 = 1667575091;
LABEL_12:
    if (MediaSubType != v7) {
      goto LABEL_28;
    }
    goto LABEL_18;
  }
  if (MediaSubType > 1902469938)
  {
    if (MediaSubType == 2053464883) {
      goto LABEL_18;
    }
    if (MediaSubType == 2053319475) {
      return result;
    }
    int v7 = 1902469939;
    goto LABEL_12;
  }
  if (MediaSubType == 1885692723) {
    goto LABEL_18;
  }
  int v6 = 1902324531;
LABEL_16:
  if (MediaSubType == v6) {
    return result;
  }
LABEL_28:
  signed int v11 = CMFormatDescriptionGetMediaSubType(a3);
  int64_t v12 = 4;
  int64_t result = 1;
  if (v11 > 1885430114)
  {
    if (v11 <= 1902207855)
    {
      if (v11 > 1885547314)
      {
        if (v11 > 1902207330)
        {
          if (v11 == 1902207331) {
            return result;
          }
          if (v11 != 1902207795)
          {
            int v13 = 1902207848;
            goto LABEL_81;
          }
          return 2;
        }
        if (v11 != 1885547315)
        {
          int v14 = 1885692723;
          goto LABEL_72;
        }
        return v12;
      }
      if (v11 <= 1885430631)
      {
        if (v11 == 1885430115) {
          return result;
        }
        int v15 = 1885430579;
LABEL_53:
        if (v11 != v15) {
          return 0;
        }
        return 2;
      }
      if (v11 == 1885430632) {
        return result;
      }
      int v13 = 1885430640;
      goto LABEL_81;
    }
    if (v11 > 2053202738)
    {
      if (v11 > 2053202799)
      {
        if (v11 == 2053202800) {
          return result;
        }
        if (v11 == 2053319475) {
          return v12;
        }
        int v14 = 2053464883;
LABEL_72:
        if (v11 == v14) {
          return 3;
        }
        return 0;
      }
      if (v11 == 2053202739) {
        return 2;
      }
      unsigned __int16 v18 = 25448;
      goto LABEL_80;
    }
    if (v11 <= 1902469938)
    {
      if (v11 == 1902207856) {
        return result;
      }
      int v16 = 1902324531;
      goto LABEL_76;
    }
    if (v11 != 1902469939)
    {
      unsigned __int16 v18 = 24931;
LABEL_80:
      int v13 = v18 | 0x7A610000;
      goto LABEL_81;
    }
    return 3;
  }
  if (v11 > 1667312946)
  {
    if (v11 <= 1667326831)
    {
      if (v11 > 1667326770)
      {
        if (v11 == 1667326771) {
          return 2;
        }
        unsigned __int16 v17 = 25448;
      }
      else
      {
        if (v11 == 1667312947) {
          return 2;
        }
        unsigned __int16 v17 = 24931;
      }
      int v13 = v17 | 0x63610000;
      goto LABEL_81;
    }
    if (v11 <= 1667575090)
    {
      if (v11 == 1667326832) {
        return result;
      }
      int v16 = 1667574579;
LABEL_76:
      if (v11 != v16) {
        return 0;
      }
      return v12;
    }
    if (v11 != 1667575091)
    {
      if (v11 != 1700997939)
      {
        int v14 = 1700998451;
        goto LABEL_72;
      }
      return v12;
    }
    return 3;
  }
  if (v11 > 1633772388)
  {
    if ((v11 - 1633772389) <= 0xB && ((1 << (v11 - 101)) & 0x80F) != 0) {
      return result;
    }
    int v15 = 1633889587;
    goto LABEL_53;
  }
  if (v11 == 1633771875) {
    return result;
  }
  int v13 = 1633772320;
LABEL_81:
  if (v11 != v13) {
    return 0;
  }
  return result;
}

+ (id)_stringForAudioFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_264CC6508[a3 - 1];
  }
}

- (BOOL)_getStringForTitleLabel:(id *)a3 subtitleLabel:(id *)a4 forMediaItem:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTitle"];
  uint64_t v9 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSeriesTitle"];
  int v10 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSubtitle"];

  if ([v9 length])
  {
    *a3 = v9;
    signed int v11 = v8;
  }
  else
  {
    if (![v8 length])
    {
      id v14 = v10;
      id v12 = 0;
      *a3 = v14;
      goto LABEL_6;
    }
    *a3 = v8;
    signed int v11 = v10;
  }
  id v12 = v11;
LABEL_6:
  *a4 = v12;

  return 1;
}

- (BOOL)_isScreenBeingRecorded
{
  return [MEMORY[0x263F1C920] _isProbablyBeingRecorded];
}

- (BOOL)_currentPlayerItemContainsDates
{
  uint64_t v3 = [(TVPPlayer *)self currentPlayerItem];
  if ([v3 status] == 1)
  {
    [(TVPPlayer *)self cachedDuration];
    if ((v9 & 1) != 0 && ([(TVPPlayer *)self cachedDuration], (v8 & 0x10) != 0))
    {
      BOOL v6 = 1;
    }
    else
    {
      int v4 = [(TVPPlayer *)self currentPlayerItem];
      uint64_t v5 = [v4 currentDate];
      BOOL v6 = v5 != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_populatePlayerItem:(id)a3 withMetadataFromMediaItem:(id)a4
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    v103 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStoreItemIdentifier"];
    if (v103 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v9 setIdentifier:*MEMORY[0x263EFA950]];
      [v9 setExtendedLanguageTag:@"und"];
      int v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v103, "longLongValue"));
      [v9 setValue:v10];

      [v8 addObject:v9];
    }
    v90 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExternalIdentifier"];
    if (v90)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v11 setIdentifier:*MEMORY[0x263EFA908]];
        [v11 setExtendedLanguageTag:@"und"];
        [v11 setValue:v90];
        [v8 addObject:v11];
      }
    }
    v89 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExternalProfileIdentifier"];
    if (v89)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v12 setIdentifier:*MEMORY[0x263EFA910]];
        [v12 setExtendedLanguageTag:@"und"];
        [v12 setValue:v89];
        [v8 addObject:v12];
      }
    }
    v88 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExternalServiceIdentifier"];
    if (v88)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v13 setIdentifier:*MEMORY[0x263EFA948]];
        [v13 setExtendedLanguageTag:@"und"];
        [v13 setValue:v88];
        [v8 addObject:v13];
      }
    }
    v87 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataBrandID"];
    if (v87)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v14 setIdentifier:*MEMORY[0x263EFA8F8]];
        [v14 setExtendedLanguageTag:@"und"];
        [v14 setValue:v87];
        [v8 addObject:v14];
      }
    }
    v86 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataPlaybackProgress"];
    if (v86)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v15 setIdentifier:*MEMORY[0x263EFA920]];
        [v15 setExtendedLanguageTag:@"und"];
        [v15 setValue:v86];
        [v8 addObject:v15];
      }
    }
    id v101 = objc_alloc_init(MEMORY[0x263F08A30]);
    v85 = [MEMORY[0x263EFF960] currentLocale];
    [v101 setLocale:v85];
    v93 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSeasonNumber"];
    if (v93)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v16 setIdentifier:*MEMORY[0x263EFA940]];
        [v16 setExtendedLanguageTag:@"und"];
        uint64_t v17 = [v101 stringFromNumber:v93];
        unsigned __int16 v18 = (void *)v17;
        if (v17) {
          long long v19 = (void *)v17;
        }
        else {
          long long v19 = v93;
        }
        [v16 setValue:v19];
        [v8 addObject:v16];
      }
    }
    v92 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataEpisodeNumber"];
    if (v92)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v20 setIdentifier:*MEMORY[0x263EFA900]];
        [v20 setExtendedLanguageTag:@"und"];
        uint64_t v21 = [v101 stringFromNumber:v92];
        long long v22 = (void *)v21;
        if (v21) {
          long long v23 = (void *)v21;
        }
        else {
          long long v23 = v92;
        }
        [v20 setValue:v23];
        [v8 addObject:v20];
      }
    }
    id v106 = 0;
    id v107 = 0;
    BOOL v24 = [(TVPPlayer *)self _getStringForTitleLabel:&v107 subtitleLabel:&v106 forMediaItem:v7];
    id v84 = v107;
    id v83 = v106;
    if (v24)
    {
      if ([v84 length])
      {
        id v25 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v25 setIdentifier:*MEMORY[0x263EF9D78]];
        [v25 setExtendedLanguageTag:@"und"];
        [v25 setValue:v84];
        [v8 addObject:v25];
      }
      if ([v83 length])
      {
        id v26 = objc_alloc_init(MEMORY[0x263EFA790]);
        [v26 setIdentifier:*MEMORY[0x263EF9E70]];
        [v26 setExtendedLanguageTag:@"und"];
        [v26 setValue:v83];
        [v8 addObject:v26];
      }
    }
    v100 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataLongDescription"];
    if ([v100 length])
    {
      id v27 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v27 setIdentifier:*MEMORY[0x263EF9D70]];
      [v27 setExtendedLanguageTag:@"und"];
      [v27 setValue:v100];
      [v8 addObject:v27];
    }
    uint64_t v28 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataContentRatingDisplayName"];
    if ([v28 length])
    {
      uint64_t v29 = v28;
    }
    else
    {
      uint64_t v30 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataContentRating"];

      uint64_t v29 = (void *)v30;
    }
    if (objc_msgSend(v29, "length", v29))
    {
      id v31 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v31 setIdentifier:*MEMORY[0x263EF9E60]];
      [v31 setExtendedLanguageTag:@"und"];
      [v31 setValue:v82];
      [v8 addObject:v31];
    }
    v99 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataGenre"];
    if ([v99 length])
    {
      id v32 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v32 setIdentifier:*MEMORY[0x263EF9E48]];
      [v32 setExtendedLanguageTag:@"und"];
      [v32 setValue:v99];
      [v8 addObject:v32];
    }
    v98 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataDateReleased"];
    if (v98)
    {
      id v33 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v33 setIdentifier:*MEMORY[0x263EF9E68]];
      [v33 setExtendedLanguageTag:@"und"];
      [v33 setValue:v98];
      [v8 addObject:v33];
    }
    v97 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataAlbum"];
    if ([v97 length])
    {
      id v34 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v34 setIdentifier:*MEMORY[0x263EF9D58]];
      [v34 setExtendedLanguageTag:@"und"];
      [v34 setValue:v97];
      [v8 addObject:v34];
    }
    v94 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTomatoPercentage"];
    v91 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataTomatoFreshness"];
    if (v94 && v91)
    {
      id v35 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v35 setIdentifier:*MEMORY[0x263EFA938]];
      [v35 setExtendedLanguageTag:@"und"];
      [v35 setValue:v94];
      id v36 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v36 setIdentifier:*MEMORY[0x263EFA930]];
      [v36 setExtendedLanguageTag:@"und"];
      [v36 setValue:v91];
      [v8 addObject:v35];
      [v8 addObject:v36];
    }
    v96 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataLocalizedScheduledTimeString"];
    if (v96)
    {
      id v37 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v37 setIdentifier:*MEMORY[0x263EFA928]];
      [v37 setExtendedLanguageTag:@"und"];
      [v37 setValue:v96];
      [v8 addObject:v37];
    }
    v95 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSportingLeagueShortName"];
    if ([v95 length])
    {
      id v38 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v38 setIdentifier:*MEMORY[0x263EFA918]];
      [v38 setExtendedLanguageTag:@"und"];
      [v38 setValue:v95];
      [v8 addObject:v38];
    }
    uint64_t v39 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExactStartTime"];
    long long v40 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v40 doubleForKey:@"ExactStartTimeOverrideInMS"];
    double v42 = v41;

    if (v42 > 0.0)
    {
      uint64_t v43 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v42 / 1000.0];
        *(_DWORD *)id buf = 138412290;
        v109 = v44;
        _os_log_impl(&dword_236FC5000, v43, OS_LOG_TYPE_DEFAULT, "Overriding exact start time with date %@", buf, 0xCu);
      }
      uint64_t v45 = [NSNumber numberWithDouble:v42];

      uint64_t v39 = (void *)v45;
    }
    if (v39)
    {
      v46 = (void *)MEMORY[0x263EFF910];
      [v39 doubleValue];
      id v48 = [v46 dateWithTimeIntervalSince1970:v47 / 1000.0];
      CMTime v49 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        CMTime v50 = [(TVPPlayer *)self seekableDateRange];
        id v51 = [v50 startDate];
        *(_DWORD *)id buf = 138412546;
        v109 = v48;
        __int16 v110 = 2112;
        id v111 = v51;
        _os_log_impl(&dword_236FC5000, v49, OS_LOG_TYPE_DEFAULT, "Setting approximate start date %@ with seekable start date %@", buf, 0x16u);
      }
      id v52 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v52 setIdentifier:*MEMORY[0x263EFA8F0]];
      [v52 setExtendedLanguageTag:@"und"];
      [v52 setValue:v48];
      [v8 addObject:v52];
    }
    else
    {
      id v48 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_236FC5000, v48, OS_LOG_TYPE_DEFAULT, "Not setting approximate start date because none was provided", buf, 2u);
      }
    }

    long long v53 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataExactEndTime"];
    id v54 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v54 doubleForKey:@"ExactEndTimeOverrideInMS"];
    double v56 = v55;

    if (v56 > 0.0)
    {
      uint64_t v57 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        id v58 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v56 / 1000.0];
        *(_DWORD *)id buf = 138412290;
        v109 = v58;
        _os_log_impl(&dword_236FC5000, v57, OS_LOG_TYPE_DEFAULT, "Overriding exact end time with date %@", buf, 0xCu);
      }
      uint64_t v59 = [NSNumber numberWithDouble:v56];

      long long v53 = (void *)v59;
    }
    if (v53)
    {
      id v60 = (void *)MEMORY[0x263EFF910];
      [v53 doubleValue];
      id v62 = [v60 dateWithTimeIntervalSince1970:v61 / 1000.0];
      __int16 v63 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = [(TVPPlayer *)self seekableDateRange];
        id v65 = [v64 endDate];
        *(_DWORD *)id buf = 138412546;
        v109 = v62;
        __int16 v110 = 2112;
        id v111 = v65;
        _os_log_impl(&dword_236FC5000, v63, OS_LOG_TYPE_DEFAULT, "Setting approximate end date %@ with seekable end date %@", buf, 0x16u);
      }
      id v66 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v66 setIdentifier:*MEMORY[0x263EFA8E8]];
      [v66 setExtendedLanguageTag:@"und"];
      [v66 setValue:v62];
      [v8 addObject:v66];
    }
    else
    {
      id v62 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_236FC5000, v62, OS_LOG_TYPE_DEFAULT, "Not setting approximate end date because none was provided", buf, 2u);
      }
    }

    uint64_t v67 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataArtworkURLString"];
    if (![v67 length])
    {
      id v68 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataArtworkURLFormat"];
      if ([v68 length])
      {
        uint64_t v69 = objc_msgSend(objc_alloc(MEMORY[0x263F7C960]), "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v68, 0, @"jpeg", 195.547, 110.0, 0.0);
        id v70 = [MEMORY[0x263F7C978] imageURLWithDescription:v69];
        uint64_t v71 = [v70 absoluteString];

        uint64_t v67 = (void *)v71;
      }
    }
    if ([v67 length])
    {
      id v72 = +[TVPReachabilityMonitor sharedInstance];
      int v73 = [v72 isNetworkReachable];

      if (v73)
      {
        id v74 = v67;
        id v75 = objc_alloc(MEMORY[0x263F7C970]);
        v76 = [NSURL URLWithString:v74];
        v77 = (void *)[v75 initWithURL:v76 headers:0 identifier:v74 decrypter:0];

        id v78 = objc_alloc(MEMORY[0x263F7C958]);
        v79 = [MEMORY[0x263F7C968] sharedInstance];
        v80 = (void *)[v78 initWithObject:v77 imageLoader:v79 groupType:0];

        if (v80) {
          goto LABEL_86;
        }
      }
    }
    v80 = [v7 mediaItemMetadataForProperty:@"TVPMediaItemMetadataArtworkImageProxy"];
    if (v80)
    {
LABEL_86:
      [v5 setPosterProxy:v80];
      objc_initWeak((id *)buf, v5);
      v104[0] = MEMORY[0x263EF8330];
      v104[1] = 3221225472;
      v104[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke;
      v104[3] = &unk_264CC5128;
      objc_copyWeak(&v105, (id *)buf);
      [v80 setCompletionHandler:v104];
      [v80 load];
      objc_destroyWeak(&v105);
      objc_destroyWeak((id *)buf);
    }
    v81 = (id)sPlayerLogObject;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v81, OS_LOG_TYPE_DEFAULT, "Updating player item external metadata", buf, 2u);
    }

    [v5 setExternalMetadata:v8];
  }
}

void __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v6 = a2;
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_2;
  block[3] = &unk_264CC5B40;
  char v12 = a4;
  id v10 = v6;
  id v8 = v6;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
}

void __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    if (v2)
    {
      uint64_t v3 = [v2 uiImage];
      id v4 = objc_alloc_init(MEMORY[0x263F1C688]);
      [v4 setPreferredRange:1];
      id v5 = objc_alloc(MEMORY[0x263F1C680]);
      [v3 size];
      id v6 = objc_msgSend(v5, "initWithSize:format:", v4);
      id v7 = [*(id *)(a1 + 32) imageType];
      if (!v7)
      {
        id v9 = 0;
        char v12 = 0;
LABEL_12:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_5;
        block[3] = &unk_264CC5B18;
        objc_copyWeak(&v18, (id *)(a1 + 40));
        id v16 = v12;
        id v17 = v9;
        id v13 = v9;
        id v14 = v12;
        dispatch_async(MEMORY[0x263EF83A0], block);

        objc_destroyWeak(&v18);
        return;
      }
      id v8 = [MEMORY[0x263F1D920] typeWithIdentifier:v7];
      if ([v8 conformsToType:*MEMORY[0x263F1DC08]])
      {
        id v9 = (id)*MEMORY[0x263F00F38];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        id v21[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_3;
        id v21[3] = &unk_264CC5AF0;
        id v10 = &v22;
        id v22 = v3;
        uint64_t v11 = [v6 PNGDataWithActions:v21];
      }
      else
      {
        if (![v8 conformsToType:*MEMORY[0x263F1DB40]])
        {
          id v9 = 0;
          char v12 = 0;
          goto LABEL_11;
        }
        id v9 = (id)*MEMORY[0x263F00F28];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_4;
        v19[3] = &unk_264CC5AF0;
        id v10 = &v20;
        id v20 = v3;
        uint64_t v11 = [v6 JPEGDataWithCompressionQuality:v19 actions:1.0];
      }
      char v12 = (void *)v11;

LABEL_11:
      goto LABEL_12;
    }
  }
}

uint64_t __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

uint64_t __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

void __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = objc_alloc_init(MEMORY[0x263EFA790]);
    if ([*(id *)(a1 + 32) length])
    {
      [v3 setIdentifier:*MEMORY[0x263EF9D68]];
      [v3 setExtendedLanguageTag:@"und"];
      [v3 setValue:*(void *)(a1 + 32)];
      [v3 setDataType:*(void *)(a1 + 40)];
      id v4 = (void *)MEMORY[0x263EFF980];
      id v5 = [v7 externalMetadata];
      id v6 = [v4 arrayWithArray:v5];

      [v6 addObject:v3];
      [v7 setExternalMetadata:v6];
      [v7 setPosterProxy:0];
    }
    id WeakRetained = v7;
  }
}

- (void)_registerStateMachineHandlers
{
  v525[5] = *MEMORY[0x263EF8340];
  id v3 = [(TVPPlayer *)self stateMachine];
  objc_initWeak(&v499, self);
  v497[0] = MEMORY[0x263EF8330];
  v497[1] = 3221225472;
  v497[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke;
  v497[3] = &unk_264CC5B90;
  objc_copyWeak(&v498, &v499);
  v189 = (id *)MEMORY[0x237E144A0](v497);
  v495[0] = MEMORY[0x263EF8330];
  v495[1] = 3221225472;
  v495[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3;
  v495[3] = &unk_264CC5BE0;
  objc_copyWeak(&v496, &v499);
  v184 = (id *)MEMORY[0x237E144A0](v495);
  v493[0] = MEMORY[0x263EF8330];
  v493[1] = 3221225472;
  v493[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5;
  v493[3] = &unk_264CC5BE0;
  objc_copyWeak(&v494, &v499);
  v183 = (id *)MEMORY[0x237E144A0](v493);
  v491[0] = MEMORY[0x263EF8330];
  v491[1] = 3221225472;
  v491[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7;
  v491[3] = &unk_264CC5C30;
  objc_copyWeak(&v492, &v499);
  id location = (id *)MEMORY[0x237E144A0](v491);
  v489[0] = MEMORY[0x263EF8330];
  v489[1] = 3221225472;
  v489[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9;
  v489[3] = &unk_264CC5C58;
  objc_copyWeak(&v490, &v499);
  id v4 = (void *)MEMORY[0x237E144A0](v489);
  v487[0] = MEMORY[0x263EF8330];
  v487[1] = 3221225472;
  v487[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_710;
  v487[3] = &unk_264CC5C80;
  objc_copyWeak(&v488, &v499);
  v178 = (id *)MEMORY[0x237E144A0](v487);
  v485[0] = MEMORY[0x263EF8330];
  v485[1] = 3221225472;
  v485[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_712;
  v485[3] = &unk_264CC5CA8;
  objc_copyWeak(&v486, &v499);
  id v5 = (void *)MEMORY[0x237E144A0](v485);
  v483[0] = MEMORY[0x263EF8330];
  v483[1] = 3221225472;
  v483[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_714;
  v483[3] = &unk_264CC5CD0;
  objc_copyWeak(&v484, &v499);
  id v6 = (void *)MEMORY[0x237E144A0](v483);
  v477[0] = MEMORY[0x263EF8330];
  v477[1] = 3221225472;
  v477[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_716;
  v477[3] = &unk_264CC5CF8;
  id v7 = v3;
  id v478 = v7;
  objc_copyWeak(&v482, &v499);
  id v185 = v4;
  id v479 = v185;
  id v157 = v5;
  id v480 = v157;
  id v158 = v6;
  id v481 = v158;
  v181 = (id *)MEMORY[0x237E144A0](v477);
  v475[0] = MEMORY[0x263EF8330];
  v475[1] = 3221225472;
  v475[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_721;
  v475[3] = &unk_264CC5600;
  objc_copyWeak(&v476, &v499);
  id v8 = (void *)MEMORY[0x237E144A0](v475);
  v473[0] = MEMORY[0x263EF8330];
  v473[1] = 3221225472;
  v473[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_722;
  v473[3] = &unk_264CC5600;
  objc_copyWeak(&v474, &v499);
  id v9 = (void *)MEMORY[0x237E144A0](v473);
  v471[0] = MEMORY[0x263EF8330];
  v471[1] = 3221225472;
  v471[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_723;
  v471[3] = &unk_264CC5D20;
  objc_copyWeak(&v472, &v499);
  id v10 = (void *)MEMORY[0x237E144A0](v471);
  v468[0] = MEMORY[0x263EF8330];
  v468[1] = 3221225472;
  v468[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_735;
  v468[3] = &unk_264CC5D48;
  objc_copyWeak(&v470, &v499);
  v176 = v10;
  v469 = v176;
  v177 = (id *)MEMORY[0x237E144A0](v468);
  v465[0] = MEMORY[0x263EF8330];
  v465[1] = 3221225472;
  v465[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_737;
  v465[3] = &unk_264CC5DE8;
  objc_copyWeak(&v467, &v499);
  id v11 = v7;
  id v466 = v11;
  char v12 = (void *)MEMORY[0x237E144A0](v465);
  v463[0] = MEMORY[0x263EF8330];
  v463[1] = 3221225472;
  v463[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_747;
  v463[3] = &unk_264CC5E60;
  objc_copyWeak(&v464, &v499);
  id v13 = (void *)MEMORY[0x237E144A0](v463);
  v461[0] = MEMORY[0x263EF8330];
  v461[1] = 3221225472;
  v461[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_752;
  v461[3] = &unk_264CC5ED8;
  objc_copyWeak(&v462, &v499);
  id v14 = (void *)MEMORY[0x237E144A0](v461);
  v459[0] = MEMORY[0x263EF8330];
  v459[1] = 3221225472;
  v459[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_757;
  v459[3] = &unk_264CC5F28;
  objc_copyWeak(&v460, &v499);
  v179 = (id *)MEMORY[0x237E144A0](v459);
  v457[0] = MEMORY[0x263EF8330];
  v457[1] = 3221225472;
  v457[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_761;
  v457[3] = &unk_264CC5F78;
  objc_copyWeak(&v458, &v499);
  v180 = (id *)MEMORY[0x237E144A0](v457);
  v455[0] = MEMORY[0x263EF8330];
  v455[1] = 3221225472;
  v455[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_765;
  v455[3] = &unk_264CC5FC8;
  objc_copyWeak(&v456, &v499);
  id v15 = (void *)MEMORY[0x237E144A0](v455);
  v452[0] = MEMORY[0x263EF8330];
  v452[1] = 3221225472;
  v452[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_769;
  v452[3] = &unk_264CC5FF0;
  objc_copyWeak(&v454, &v499);
  v170 = v12;
  v453 = v170;
  id v16 = (void *)MEMORY[0x237E144A0](v452);
  v446[0] = MEMORY[0x263EF8330];
  v446[1] = 3221225472;
  v446[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_771;
  v446[3] = &unk_264CC6018;
  objc_copyWeak(&v451, &v499);
  v168 = v14;
  v447 = v168;
  id v159 = v16;
  id v448 = v159;
  id v166 = v13;
  id v449 = v166;
  id v17 = v15;
  id v450 = v17;
  v182 = (id *)MEMORY[0x237E144A0](v446);
  v444[0] = MEMORY[0x263EF8330];
  v444[1] = 3221225472;
  v444[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_773;
  v444[3] = &unk_264CC6040;
  objc_copyWeak(&v445, &v499);
  v175 = (id *)MEMORY[0x237E144A0](v444);
  v442[0] = MEMORY[0x263EF8330];
  v442[1] = 3221225472;
  v442[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_780;
  v442[3] = &unk_264CC6068;
  objc_copyWeak(&v443, &v499);
  v174 = (id *)MEMORY[0x237E144A0](v442);
  v440[0] = MEMORY[0x263EF8330];
  v440[1] = 3221225472;
  v440[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_783;
  v440[3] = &unk_264CC5600;
  objc_copyWeak(&v441, &v499);
  id v18 = (void *)MEMORY[0x237E144A0](v440);
  v435[0] = MEMORY[0x263EF8330];
  v435[1] = 3221225472;
  v435[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_785;
  v435[3] = &unk_264CC6090;
  id v164 = v8;
  id v436 = v164;
  id v19 = v9;
  id v437 = v19;
  objc_copyWeak(&v439, &v499);
  id v20 = v18;
  id v438 = v20;
  uint64_t v21 = (void *)MEMORY[0x237E144A0](v435);
  v430[0] = MEMORY[0x263EF8330];
  v430[1] = 3221225472;
  v430[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_787;
  v430[3] = &unk_264CC60B8;
  objc_copyWeak(&v434, &v499);
  id v162 = v20;
  id v432 = v162;
  id v22 = v11;
  id v431 = v22;
  id v23 = v21;
  id v433 = v23;
  BOOL v24 = (void *)MEMORY[0x237E144A0](v430);
  v427[0] = MEMORY[0x263EF8330];
  v427[1] = 3221225472;
  v427[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_790;
  v427[3] = &unk_264CC60E0;
  objc_copyWeak(&v429, &v499);
  id v25 = v22;
  id v428 = v25;
  id v26 = (void *)MEMORY[0x237E144A0](v427);
  v421[0] = MEMORY[0x263EF8330];
  v421[1] = 3221225472;
  v421[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_804;
  v421[3] = &unk_264CC6108;
  objc_copyWeak(&v426, &v499);
  id v27 = v23;
  id v423 = v27;
  id v160 = v24;
  id v424 = v160;
  id v28 = v25;
  id v422 = v28;
  id v29 = v26;
  id v425 = v29;
  v169 = (id *)MEMORY[0x237E144A0](v421);
  v418[0] = MEMORY[0x263EF8330];
  v418[1] = 3221225472;
  v418[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_807;
  v418[3] = &unk_264CC6150;
  objc_copyWeak(&v420, &v499);
  v172 = (id *)v29;
  v419 = v172;
  uint64_t v30 = (void *)MEMORY[0x237E144A0](v418);
  v416[0] = MEMORY[0x263EF8330];
  v416[1] = 3221225472;
  v416[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_810;
  v416[3] = &unk_264CC56F0;
  id v31 = v27;
  id v417 = v31;
  [v28 registerDefaultHandlerForEvent:@"Stop" withBlock:v416];
  v411[0] = MEMORY[0x263EF8330];
  v411[1] = 3221225472;
  v411[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_812;
  v411[3] = &unk_264CC6178;
  objc_copyWeak(&v415, &v499);
  id v32 = v28;
  id v412 = v32;
  v171 = (id *)v19;
  v413 = v171;
  id v161 = v31;
  id v414 = v161;
  [v32 registerDefaultHandlerForEvent:@"Set playlist" withBlock:v411];
  v408[0] = MEMORY[0x263EF8330];
  v408[1] = 3221225472;
  v408[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_814;
  v408[3] = &unk_264CC56A0;
  objc_copyWeak(&v410, &v499);
  id v33 = v32;
  id v409 = v33;
  [v33 registerHandlerForEvent:@"Continue loading current item" onState:@"Waiting for signal after preparing item" withBlock:v408];
  v405[0] = MEMORY[0x263EF8330];
  v405[1] = 3221225472;
  v405[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_816;
  v405[3] = &unk_264CC61A0;
  id v34 = v189;
  v406 = v34;
  id v35 = v30;
  id v407 = v35;
  [v33 registerHandlerForEvent:@"Play" onState:@"Stopped" withBlock:v405];
  v525[0] = @"Waiting for media item to prepare for loading";
  v525[1] = @"Waiting for AVAsset to load";
  v525[2] = @"Waiting for media item to prepare for playback initiation";
  v525[3] = @"Waiting for more playlist items";
  v525[4] = @"Waiting for signal after preparing item";
  id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v525 count:5];
  v400[0] = MEMORY[0x263EF8330];
  v400[1] = 3221225472;
  v400[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_817;
  v400[3] = &unk_264CC61C8;
  objc_copyWeak(&v404, &v499);
  id v37 = v17;
  id v401 = v37;
  id v38 = v185;
  id v402 = v38;
  uint64_t v39 = v34;
  v403 = v39;
  [v33 registerHandlerForEvent:@"Play" onStates:v36 withBlock:v400];

  v524[0] = @"Waiting for AVPlayerItem status to become ready to play";
  v524[1] = @"Waiting for sufficient buffer";
  v524[2] = @"Waiting for time control status to be done waiting";
  v524[3] = @"Waiting for seek";
  long long v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v524 count:4];
  v395[0] = MEMORY[0x263EF8330];
  v395[1] = 3221225472;
  v395[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_819;
  v395[3] = &unk_264CC61C8;
  objc_copyWeak(&v399, &v499);
  id v41 = v37;
  id v396 = v41;
  id v42 = v38;
  id v397 = v42;
  uint64_t v43 = v39;
  v398 = v43;
  [v33 registerHandlerForEvent:@"Play" onStates:v40 withBlock:v395];

  v523[0] = @"Playing";
  v523[1] = @"Paused";
  v523[2] = @"Scanning using AVPlayer";
  v523[3] = @"Scanning using AVPlayer driven by AVKit";
  id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v523 count:4];
  v390[0] = MEMORY[0x263EF8330];
  v390[1] = 3221225472;
  v390[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_821;
  v390[3] = &unk_264CC61C8;
  objc_copyWeak(&v394, &v499);
  id v155 = v41;
  id v391 = v155;
  id v45 = v42;
  id v392 = v45;
  v46 = v43;
  v393 = v46;
  [v33 registerHandlerForEvent:@"Play" onStates:v44 withBlock:v390];

  v387[0] = MEMORY[0x263EF8330];
  v387[1] = 3221225472;
  v387[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_826;
  v387[3] = &unk_264CC6218;
  double v47 = v182;
  v388 = v47;
  objc_copyWeak(&v389, &v499);
  [v33 registerHandlerForEvent:@"Play" onState:@"Scanning using external images" withBlock:v387];
  v385[0] = MEMORY[0x263EF8330];
  v385[1] = 3221225472;
  v385[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_827;
  v385[3] = &unk_264CC5650;
  objc_copyWeak(&v386, &v499);
  [v33 registerHandlerForEvent:@"Play" onState:@"Scanning using external images driven by AVKit" withBlock:v385];
  v382[0] = MEMORY[0x263EF8330];
  v382[1] = 3221225472;
  v382[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_828;
  v382[3] = &unk_264CC55D8;
  objc_copyWeak(&v384, &v499);
  id v48 = v45;
  id v383 = v48;
  [v33 registerHandlerForEvent:@"Play" onState:@"Scrubbing using progressive jumping" withBlock:v382];
  v379[0] = MEMORY[0x263EF8330];
  v379[1] = 3221225472;
  v379[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_830;
  v379[3] = &unk_264CC55D8;
  objc_copyWeak(&v381, &v499);
  id v49 = v48;
  id v380 = v49;
  [v33 registerHandlerForEvent:@"Play" onState:@"Scrubbing using progressive jumping waiting for seek" withBlock:v379];
  v375[0] = MEMORY[0x263EF8330];
  v375[1] = 3221225472;
  v375[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_831;
  v375[3] = &unk_264CC6240;
  id v50 = v49;
  id v376 = v50;
  objc_copyWeak(&v378, &v499);
  v150 = v46;
  v377 = v150;
  [v33 registerDefaultHandlerForEvent:@"Play" withBlock:v375];
  v372[0] = MEMORY[0x263EF8330];
  v372[1] = 3221225472;
  v372[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_832;
  v372[3] = &unk_264CC61A0;
  id v51 = v184;
  v373 = v51;
  id v156 = v35;
  id v374 = v156;
  [v33 registerHandlerForEvent:@"Pause" onState:@"Stopped" withBlock:v372];
  v522[0] = @"Waiting for media item to prepare for loading";
  v522[1] = @"Waiting for AVAsset to load";
  v522[2] = @"Waiting for media item to prepare for playback initiation";
  v522[3] = @"Waiting for AVPlayerItem status to become ready to play";
  v522[4] = @"Waiting for sufficient buffer";
  v522[5] = @"Waiting for time control status to be done waiting";
  v522[6] = @"Waiting for seek";
  v522[7] = @"Waiting for more playlist items";
  v522[8] = @"Waiting for signal after preparing item";
  id v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v522 count:9];
  v367[0] = MEMORY[0x263EF8330];
  v367[1] = 3221225472;
  v367[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_833;
  v367[3] = &unk_264CC6268;
  long long v53 = v180;
  v368 = v53;
  objc_copyWeak(&v371, &v499);
  id v54 = v50;
  id v369 = v54;
  double v55 = v51;
  v370 = v55;
  [v33 registerHandlerForEvent:@"Pause" onStates:v52 withBlock:v367];

  v521[0] = @"Paused";
  v521[1] = @"Playing";
  v521[2] = @"Scanning using AVPlayer";
  v521[3] = @"Scanning using AVPlayer driven by AVKit";
  double v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v521 count:4];
  v363[0] = MEMORY[0x263EF8330];
  v363[1] = 3221225472;
  v363[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_834;
  v363[3] = &unk_264CC6290;
  v154 = v53;
  v364 = v154;
  id v57 = v54;
  id v365 = v57;
  id v58 = v55;
  v366 = v58;
  [v33 registerHandlerForEvent:@"Pause" onStates:v56 withBlock:v363];

  v360[0] = MEMORY[0x263EF8330];
  v360[1] = 3221225472;
  v360[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_835;
  v360[3] = &unk_264CC6218;
  v186 = v47;
  v361 = v186;
  objc_copyWeak(&v362, &v499);
  [v33 registerHandlerForEvent:@"Pause" onState:@"Scanning using external images" withBlock:v360];
  v358[0] = MEMORY[0x263EF8330];
  v358[1] = 3221225472;
  v358[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_836;
  v358[3] = &unk_264CC5650;
  objc_copyWeak(&v359, &v499);
  [v33 registerHandlerForEvent:@"Pause" onState:@"Scanning using external images driven by AVKit" withBlock:v358];
  v355[0] = MEMORY[0x263EF8330];
  v355[1] = 3221225472;
  v355[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_837;
  v355[3] = &unk_264CC55D8;
  objc_copyWeak(&v357, &v499);
  id v59 = v57;
  id v356 = v59;
  [v33 registerHandlerForEvent:@"Pause" onState:@"Scrubbing using progressive jumping" withBlock:v355];
  v352[0] = MEMORY[0x263EF8330];
  v352[1] = 3221225472;
  v352[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_839;
  v352[3] = &unk_264CC55D8;
  objc_copyWeak(&v354, &v499);
  id v60 = v59;
  id v353 = v60;
  [v33 registerHandlerForEvent:@"Pause" onState:@"Scrubbing using progressive jumping waiting for seek" withBlock:v352];
  v349[0] = MEMORY[0x263EF8330];
  v349[1] = 3221225472;
  v349[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_840;
  v349[3] = &unk_264CC61A0;
  v190 = (id *)v60;
  v350 = v190;
  v148 = v58;
  v351 = v148;
  [v33 registerDefaultHandlerForEvent:@"Pause" withBlock:v349];
  v520[0] = @"Playing";
  v520[1] = @"Scanning using AVPlayer";
  v520[2] = @"Scanning using AVPlayer driven by AVKit";
  double v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v520 count:3];
  v344[0] = MEMORY[0x263EF8330];
  v344[1] = 3221225472;
  v344[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_841;
  v344[3] = &unk_264CC62B8;
  id v62 = v179;
  v345 = v62;
  __int16 v63 = v181;
  v346 = v63;
  objc_copyWeak(&v348, &v499);
  id v64 = v183;
  v347 = v64;
  [v33 registerHandlerForEvent:@"Scan with rate" onStates:v61 withBlock:v344];

  v339[0] = MEMORY[0x263EF8330];
  v339[1] = 3221225472;
  v339[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_842;
  v339[3] = &unk_264CC62B8;
  id v65 = v62;
  v340 = v65;
  id v66 = v63;
  v341 = v66;
  objc_copyWeak(&v343, &v499);
  uint64_t v67 = v64;
  v342 = v67;
  [v33 registerHandlerForEvent:@"Scan with rate" onState:@"Paused" withBlock:v339];
  v519[0] = @"Waiting for sufficient buffer";
  v519[1] = @"Waiting for time control status to be done waiting";
  id v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v519 count:2];
  v334[0] = MEMORY[0x263EF8330];
  v334[1] = 3221225472;
  v334[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_843;
  v334[3] = &unk_264CC6268;
  uint64_t v69 = v65;
  v335 = v69;
  objc_copyWeak(&v338, &v499);
  id v70 = v66;
  v336 = v70;
  uint64_t v71 = v67;
  v337 = v71;
  [v33 registerHandlerForEvent:@"Scan with rate" onStates:v68 withBlock:v334];

  v518[0] = @"Scanning using external images";
  v518[1] = @"Scanning using external images driven by AVKit";
  id v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v518 count:2];
  v329[0] = MEMORY[0x263EF8330];
  v329[1] = 3221225472;
  v329[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_844;
  v329[3] = &unk_264CC62B8;
  int v73 = v69;
  v330 = v73;
  id v74 = v70;
  v331 = v74;
  objc_copyWeak(&v333, &v499);
  id v75 = v71;
  v332 = v75;
  [v33 registerHandlerForEvent:@"Scan with rate" onStates:v72 withBlock:v329];

  v327[0] = MEMORY[0x263EF8330];
  v327[1] = 3221225472;
  v327[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_845;
  v327[3] = &unk_264CC56F0;
  v76 = v75;
  v328 = v76;
  [v33 registerHandlerForEvent:@"Scan with rate" onState:@"Waiting for AVKit seek after finishing external image scanning" withBlock:v327];
  v322[0] = MEMORY[0x263EF8330];
  v322[1] = 3221225472;
  v322[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_846;
  v322[3] = &unk_264CC6268;
  v153 = v73;
  v323 = v153;
  objc_copyWeak(&v326, &v499);
  v77 = v74;
  v324 = v77;
  id v78 = v76;
  v325 = v78;
  [v33 registerHandlerForEvent:@"Scan with rate" onState:@"Waiting for seek" withBlock:v322];
  v320[0] = MEMORY[0x263EF8330];
  v320[1] = 3221225472;
  v320[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_847;
  v320[3] = &unk_264CC56F0;
  v143 = v78;
  v321 = v143;
  [v33 registerDefaultHandlerForEvent:@"Scan with rate" withBlock:v320];
  v317[0] = MEMORY[0x263EF8330];
  v317[1] = 3221225472;
  v317[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_848;
  v317[3] = &unk_264CC56A0;
  objc_copyWeak(&v319, &v499);
  id v79 = v33;
  id v318 = v79;
  [v79 registerHandlerForEvent:@"Media item loader did prepare item for loading" onState:@"Waiting for media item to prepare for loading" withBlock:v317];
  v314[0] = MEMORY[0x263EF8330];
  v314[1] = 3221225472;
  v314[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_850;
  v314[3] = &unk_264CC56A0;
  objc_copyWeak(&v316, &v499);
  id v80 = v79;
  id v315 = v80;
  [v80 registerHandlerForEvent:@"Media item loader did load AVAsset keys" onState:@"Waiting for AVAsset to load" withBlock:v314];
  v517[0] = @"Paused";
  v517[1] = @"Playing";
  v517[2] = @"Scanning using AVPlayer";
  v517[3] = @"Scanning using AVPlayer driven by AVKit";
  v517[4] = @"Scanning using external images";
  v517[5] = @"Scanning using external images driven by AVKit";
  v517[6] = @"Waiting for AVKit seek after finishing external image scanning";
  v517[7] = @"Scrubbing using progressive jumping";
  v517[8] = @"Scrubbing using progressive jumping waiting for seek";
  v517[9] = @"Waiting for seek";
  v517[10] = @"Waiting for sufficient buffer";
  v517[11] = @"Waiting for time control status to be done waiting";
  v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v517 count:12];
  v312[0] = MEMORY[0x263EF8330];
  v312[1] = 3221225472;
  v312[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_12;
  v312[3] = &unk_264CC5650;
  objc_copyWeak(&v313, &v499);
  [v80 registerHandlerForEvent:@"Media item loader did load AVAsset keys" onStates:v81 withBlock:v312];

  v306[0] = MEMORY[0x263EF8330];
  v306[1] = 3221225472;
  v306[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_13;
  v306[3] = &unk_264CC62E0;
  objc_copyWeak(&v311, &v499);
  v146 = v176;
  v308 = v146;
  id v82 = v80;
  id v307 = v82;
  id v83 = v190;
  v309 = v83;
  id v84 = v177;
  v310 = v84;
  [v82 registerHandlerForEvent:@"Media item did prepare for playback initiation" onState:@"Waiting for media item to prepare for playback initiation" withBlock:v306];
  v516[0] = @"Paused";
  v516[1] = @"Playing";
  v516[2] = @"Scanning using AVPlayer";
  v516[3] = @"Scanning using AVPlayer driven by AVKit";
  v516[4] = @"Scanning using external images";
  v516[5] = @"Scanning using external images driven by AVKit";
  v516[6] = @"Waiting for AVKit seek after finishing external image scanning";
  v516[7] = @"Scrubbing using progressive jumping";
  v516[8] = @"Scrubbing using progressive jumping waiting for seek";
  v516[9] = @"Waiting for seek";
  v516[10] = @"Waiting for sufficient buffer";
  v516[11] = @"Waiting for time control status to be done waiting";
  v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v516 count:12];
  v303[0] = MEMORY[0x263EF8330];
  v303[1] = 3221225472;
  v303[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_854;
  v303[3] = &unk_264CC55D8;
  objc_copyWeak(&v305, &v499);
  v147 = v84;
  v304 = v147;
  [v82 registerHandlerForEvent:@"Media item did prepare for playback initiation" onStates:v85 withBlock:v303];

  v296[0] = MEMORY[0x263EF8330];
  v296[1] = 3221225472;
  v296[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_855;
  v296[3] = &unk_264CC6330;
  objc_copyWeak(&v302, &v499);
  v144 = v171;
  v298 = v144;
  v151 = v175;
  v299 = v151;
  v152 = v174;
  v300 = v152;
  id v86 = v82;
  id v297 = v86;
  v87 = v172;
  v301 = v87;
  [v86 registerHandlerForEvent:@"Current player item status did become ready to play" onState:@"Waiting for AVPlayerItem status to become ready to play" withBlock:v296];
  v293[0] = MEMORY[0x263EF8330];
  v293[1] = 3221225472;
  v293[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_867;
  v293[3] = &unk_264CC56A0;
  objc_copyWeak(&v295, &v499);
  id v88 = v86;
  id v294 = v88;
  [v88 registerHandlerForEvent:@"Sufficient buffer did become available" onState:@"Waiting for sufficient buffer" withBlock:v293];
  v290[0] = MEMORY[0x263EF8330];
  v290[1] = 3221225472;
  v290[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_872;
  v290[3] = &unk_264CC55D8;
  objc_copyWeak(&v292, &v499);
  v89 = v178;
  v291 = v89;
  [v88 registerHandlerForEvent:@"Time control status did change" onState:@"Waiting for time control status to be done waiting" withBlock:v290];
  v287[0] = MEMORY[0x263EF8330];
  v287[1] = 3221225472;
  v287[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_875;
  v287[3] = &unk_264CC56A0;
  objc_copyWeak(&v289, &v499);
  id v90 = v88;
  id v288 = v90;
  [v90 registerHandlerForEvent:@"Time control status did change" onState:@"Playing" withBlock:v287];
  v284[0] = MEMORY[0x263EF8330];
  v284[1] = 3221225472;
  v284[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_877;
  v284[3] = &unk_264CC55D8;
  objc_copyWeak(&v286, &v499);
  v141 = v89;
  v285 = v141;
  [v90 registerHandlerForEvent:@"Time control status did change" onState:@"Paused" withBlock:v284];
  v515[0] = @"Scanning using AVPlayer";
  v515[1] = @"Scanning using AVPlayer driven by AVKit";
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v515 count:2];
  v282[0] = MEMORY[0x263EF8330];
  v282[1] = 3221225472;
  v282[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_878;
  v282[3] = &unk_264CC5650;
  objc_copyWeak(&v283, &v499);
  [v90 registerHandlerForEvent:@"Time control status did change" onStates:v91 withBlock:v282];

  v514[0] = @"Scanning using AVPlayer";
  v514[1] = @"Scanning using AVPlayer driven by AVKit";
  v92 = [MEMORY[0x263EFF8C0] arrayWithObjects:v514 count:2];
  v278[0] = MEMORY[0x263EF8330];
  v278[1] = 3221225472;
  v278[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_879;
  v278[3] = &unk_264CC6358;
  objc_copyWeak(&v281, &v499);
  v142 = v77;
  v280 = v142;
  id v93 = v90;
  id v279 = v93;
  [v93 registerHandlerForEvent:@"Buffer did become empty" onStates:v92 withBlock:v278];

  v513[0] = @"Playing";
  v513[1] = @"Paused";
  v513[2] = @"Waiting for sufficient buffer";
  v513[3] = @"Waiting for time control status to be done waiting";
  v94 = [MEMORY[0x263EFF8C0] arrayWithObjects:v513 count:4];
  v275[0] = MEMORY[0x263EF8330];
  v275[1] = 3221225472;
  v275[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_880;
  v275[3] = &unk_264CC6380;
  id v95 = v93;
  id v276 = v95;
  objc_copyWeak(&v277, &v499);
  [v95 registerHandlerForEvent:@"Hit beginning or end" onStates:v94 withBlock:v275];

  v512[0] = @"Scanning using AVPlayer";
  v512[1] = @"Scanning using AVPlayer driven by AVKit";
  v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v512 count:2];
  v272[0] = MEMORY[0x263EF8330];
  v272[1] = 3221225472;
  v272[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_884;
  v272[3] = &unk_264CC55D8;
  objc_copyWeak(&v274, &v499);
  v97 = v83;
  v273 = v97;
  [v95 registerHandlerForEvent:@"Hit beginning or end" onStates:v96 withBlock:v272];

  v511[0] = @"Scanning using external images";
  v511[1] = @"Scanning using external images driven by AVKit";
  v98 = [MEMORY[0x263EFF8C0] arrayWithObjects:v511 count:2];
  v269[0] = MEMORY[0x263EF8330];
  v269[1] = 3221225472;
  v269[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_889;
  v269[3] = &unk_264CC55D8;
  objc_copyWeak(&v271, &v499);
  v191 = v186;
  v270 = v191;
  [v95 registerHandlerForEvent:@"Hit beginning or end" onStates:v98 withBlock:v269];

  v510[0] = @"Scrubbing using progressive jumping";
  v510[1] = @"Scrubbing using progressive jumping waiting for seek";
  v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v510 count:2];
  v266[0] = MEMORY[0x263EF8330];
  v266[1] = 3221225472;
  v266[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_890;
  v266[3] = &unk_264CC55D8;
  objc_copyWeak(&v268, &v499);
  v100 = v170;
  v267 = v100;
  [v95 registerHandlerForEvent:@"Hit beginning or end" onStates:v99 withBlock:v266];

  v509[0] = @"Playing";
  v509[1] = @"Scanning using AVPlayer";
  v509[2] = @"Scanning using AVPlayer driven by AVKit";
  v509[3] = @"Scanning using external images";
  v509[4] = @"Scanning using external images driven by AVKit";
  v509[5] = @"Waiting for AVKit seek after finishing external image scanning";
  v509[6] = @"Scrubbing using progressive jumping";
  v509[7] = @"Scrubbing using progressive jumping waiting for seek";
  id v101 = [MEMORY[0x263EFF8C0] arrayWithObjects:v509 count:8];
  v264[0] = MEMORY[0x263EF8330];
  v264[1] = 3221225472;
  v264[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_892;
  v264[3] = &unk_264CC56F0;
  v102 = v169;
  v265 = v102;
  [v95 registerHandlerForEvent:@"Playlist current media item did change" onStates:v101 withBlock:v264];

  v262[0] = MEMORY[0x263EF8330];
  v262[1] = 3221225472;
  v262[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_893;
  v262[3] = &unk_264CC56F0;
  v103 = v102;
  v263 = v103;
  [v95 registerHandlerForEvent:@"Playlist current media item did change" onState:@"Paused" withBlock:v262];
  v508[0] = @"Waiting for media item to prepare for loading";
  v508[1] = @"Waiting for AVAsset to load";
  v508[2] = @"Waiting for signal after preparing item";
  v508[3] = @"Waiting for media item to prepare for playback initiation";
  v508[4] = @"Waiting for AVPlayerItem status to become ready to play";
  v508[5] = @"Waiting for sufficient buffer";
  v508[6] = @"Waiting for time control status to be done waiting";
  v508[7] = @"Waiting for seek";
  v508[8] = @"Waiting for more playlist items";
  v104 = [MEMORY[0x263EFF8C0] arrayWithObjects:v508 count:9];
  v259[0] = MEMORY[0x263EF8330];
  v259[1] = 3221225472;
  v259[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_894;
  v259[3] = &unk_264CC6218;
  v149 = v103;
  v260 = v149;
  objc_copyWeak(&v261, &v499);
  [v95 registerHandlerForEvent:@"Playlist current media item did change" onStates:v104 withBlock:v259];

  v507[0] = @"Paused";
  v507[1] = @"Playing";
  v507[2] = @"Scanning using AVPlayer";
  v507[3] = @"Scanning using AVPlayer driven by AVKit";
  v507[4] = @"Scanning using external images";
  v507[5] = @"Scanning using external images driven by AVKit";
  v507[6] = @"Waiting for AVKit seek after finishing external image scanning";
  v507[7] = @"Scrubbing using progressive jumping";
  v507[8] = @"Scrubbing using progressive jumping waiting for seek";
  v507[9] = @"Waiting for seek";
  v507[10] = @"Waiting for sufficient buffer";
  v507[11] = @"Waiting for time control status to be done waiting";
  id v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v507 count:12];
  v256[0] = MEMORY[0x263EF8330];
  v256[1] = 3221225472;
  v256[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_895;
  v256[3] = &unk_264CC55D8;
  objc_copyWeak(&v258, &v499);
  v145 = v87;
  v257 = v145;
  [v95 registerHandlerForEvent:@"Playlist next media item did change" onStates:v105 withBlock:v256];

  v253[0] = MEMORY[0x263EF8330];
  v253[1] = 3221225472;
  v253[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_897;
  v253[3] = &unk_264CC6218;
  v187 = v97;
  v254 = v187;
  objc_copyWeak(&v255, &v499);
  [v95 registerHandlerForEvent:@"Rate used for playback did change" onState:@"Playing" withBlock:v253];
  v506[0] = @"Stopped";
  v506[1] = @"Waiting for media item to prepare for loading";
  v506[2] = @"Waiting for signal after preparing item";
  v506[3] = @"Waiting for AVAsset to load";
  v506[4] = @"Waiting for media item to prepare for playback initiation";
  v506[5] = @"Waiting for more playlist items";
  id v106 = [MEMORY[0x263EFF8C0] arrayWithObjects:v506 count:6];
  v247[0] = MEMORY[0x263EF8330];
  v247[1] = 3221225472;
  v247[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_898;
  v247[3] = &unk_264CC62E0;
  objc_copyWeak(&v252, &v499);
  id v107 = v166;
  id v249 = v107;
  id v108 = v95;
  id v248 = v108;
  v109 = location;
  v250 = v109;
  __int16 v110 = v168;
  v251 = v110;
  [v108 registerHandlerForEvent:@"Set elapsed time or date" onStates:v106 withBlock:v247];

  v241[0] = MEMORY[0x263EF8330];
  v241[1] = 3221225472;
  v241[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_901;
  v241[3] = &unk_264CC62E0;
  objc_copyWeak(&v246, &v499);
  id v111 = v110;
  v243 = v111;
  id v112 = v108;
  id v242 = v112;
  v113 = v109;
  v244 = v113;
  id v114 = v107;
  id v245 = v114;
  [v112 registerHandlerForEvent:@"Set elapsed time or date" onState:@"Waiting for AVPlayerItem status to become ready to play" withBlock:v241];
  v505[0] = @"Playing";
  v505[1] = @"Paused";
  v505[2] = @"Scanning using AVPlayer";
  v505[3] = @"Scanning using AVPlayer driven by AVKit";
  v505[4] = @"Waiting for sufficient buffer";
  v505[5] = @"Waiting for time control status to be done waiting";
  v115 = [MEMORY[0x263EFF8C0] arrayWithObjects:v505 count:6];
  v235[0] = MEMORY[0x263EF8330];
  v235[1] = 3221225472;
  v235[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_904;
  v235[3] = &unk_264CC63F8;
  id v116 = v114;
  id v236 = v116;
  v117 = v111;
  v237 = v117;
  objc_copyWeak(&v240, &v499);
  v118 = v100;
  v238 = v118;
  v119 = v113;
  v239 = v119;
  [v112 registerHandlerForEvent:@"Set elapsed time or date" onStates:v115 withBlock:v235];

  v504[0] = @"Scanning using external images";
  v504[1] = @"Scanning using external images driven by AVKit";
  v120 = [MEMORY[0x263EFF8C0] arrayWithObjects:v504 count:2];
  v230[0] = MEMORY[0x263EF8330];
  v230[1] = 3221225472;
  v230[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_905;
  v230[3] = &unk_264CC6420;
  id v121 = v116;
  id v232 = v121;
  v122 = v117;
  v233 = v122;
  objc_copyWeak(&v234, &v499);
  id v123 = v112;
  id v231 = v123;
  [v123 registerHandlerForEvent:@"Set elapsed time or date" onStates:v120 withBlock:v230];

  v226[0] = MEMORY[0x263EF8330];
  v226[1] = 3221225472;
  v226[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_906;
  v226[3] = &unk_264CC6240;
  v167 = v191;
  v227 = v167;
  objc_copyWeak(&v229, &v499);
  v124 = v119;
  v228 = v124;
  [v123 registerHandlerForEvent:@"Set elapsed time or date" onState:@"Waiting for AVKit seek after finishing external image scanning" withBlock:v226];
  v503 = @"Waiting for seek";
  v125 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v503 count:1];
  v220[0] = MEMORY[0x263EF8330];
  v220[1] = 3221225472;
  v220[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_12_907;
  v220[3] = &unk_264CC63F8;
  id v139 = v121;
  id v221 = v139;
  v140 = v122;
  v222 = v140;
  objc_copyWeak(&v225, &v499);
  v126 = v118;
  v223 = v126;
  v127 = v124;
  v224 = v127;
  [v123 registerHandlerForEvent:@"Set elapsed time or date" onStates:v125 withBlock:v220];

  v502[0] = @"Scrubbing using progressive jumping";
  v502[1] = @"Scrubbing using progressive jumping waiting for seek";
  v128 = [MEMORY[0x263EFF8C0] arrayWithObjects:v502 count:2];
  v217[0] = MEMORY[0x263EF8330];
  v217[1] = 3221225472;
  v217[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_13_908;
  v217[3] = &unk_264CC6218;
  v138 = v126;
  v218 = v138;
  objc_copyWeak(&v219, &v499);
  [v123 registerHandlerForEvent:@"Set elapsed time or date" onStates:v128 withBlock:v217];

  v215[0] = MEMORY[0x263EF8330];
  v215[1] = 3221225472;
  v215[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14_909;
  v215[3] = &unk_264CC56F0;
  v137 = v127;
  v216 = v137;
  [v123 registerDefaultHandlerForEvent:@"Set elapsed time or date" withBlock:v215];
  v213[0] = MEMORY[0x263EF8330];
  v213[1] = 3221225472;
  v213[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_15_910;
  v213[3] = &unk_264CC5650;
  objc_copyWeak(&v214, &v499);
  [v123 registerHandlerForEvent:@"Seek completed" onState:@"Waiting for seek" withBlock:v213];
  v211[0] = MEMORY[0x263EF8330];
  v211[1] = 3221225472;
  v211[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_911;
  v211[3] = &unk_264CC5650;
  objc_copyWeak(&v212, &v499);
  [v123 registerHandlerForEvent:@"Seek completed" onState:@"Scrubbing using progressive jumping waiting for seek" withBlock:v211];
  v209[0] = MEMORY[0x263EF8330];
  v209[1] = 3221225472;
  v209[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_912;
  v209[3] = &unk_264CC5650;
  objc_copyWeak(&v210, &v499);
  [v123 registerHandlerForEvent:@"Interstitial boundary crossed" onState:@"Playing" withBlock:v209];
  v501[0] = @"Scanning using AVPlayer";
  v501[1] = @"Scanning using AVPlayer driven by AVKit";
  v501[2] = @"Scanning using external images";
  v501[3] = @"Scanning using external images driven by AVKit";
  v129 = [MEMORY[0x263EFF8C0] arrayWithObjects:v501 count:4];
  v207[0] = MEMORY[0x263EF8330];
  v207[1] = 3221225472;
  v207[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_914;
  v207[3] = &unk_264CC5650;
  objc_copyWeak(&v208, &v499);
  [v123 registerHandlerForEvent:@"Interstitial boundary crossed" onStates:v129 withBlock:v207];

  [v123 registerHandlerForEvent:@"Error did occur" onState:@"Stopped" withBlock:&__block_literal_global_918];
  v201[0] = MEMORY[0x263EF8330];
  v201[1] = 3221225472;
  v201[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919;
  v201[3] = &unk_264CC6470;
  objc_copyWeak(&v206, &v499);
  id v130 = v164;
  id v203 = v130;
  id v131 = v162;
  id v204 = v131;
  id v132 = v123;
  id v202 = v132;
  id v165 = v161;
  id v205 = v165;
  [v132 registerDefaultHandlerForEvent:@"Error did occur" withBlock:v201];
  v500[0] = @"Playing";
  v500[1] = @"Waiting for sufficient buffer";
  v500[2] = @"Waiting for time control status to be done waiting";
  v133 = [MEMORY[0x263EFF8C0] arrayWithObjects:v500 count:3];
  v198[0] = MEMORY[0x263EF8330];
  v198[1] = 3221225472;
  v198[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_935;
  v198[3] = &unk_264CC56A0;
  objc_copyWeak(&v200, &v499);
  id v134 = v132;
  id v199 = v134;
  [v134 registerHandlerForEvent:@"Current player item did stall" onStates:v133 withBlock:v198];

  v192[0] = MEMORY[0x263EF8330];
  v192[1] = 3221225472;
  v192[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_939;
  v192[3] = &unk_264CC6498;
  objc_copyWeak(&v197, &v499);
  v163 = v187;
  v194 = v163;
  id v188 = v130;
  id v195 = v188;
  id v135 = v131;
  id v196 = v135;
  id v136 = v134;
  id v193 = v136;
  [v136 registerDefaultHandlerForEvent:@"Restart playback" withBlock:v192];

  objc_destroyWeak(&v197);
  objc_destroyWeak(&v200);

  objc_destroyWeak(&v206);
  objc_destroyWeak(&v208);
  objc_destroyWeak(&v210);
  objc_destroyWeak(&v212);
  objc_destroyWeak(&v214);

  objc_destroyWeak(&v219);
  objc_destroyWeak(&v225);

  objc_destroyWeak(&v229);
  objc_destroyWeak(&v234);

  objc_destroyWeak(&v240);
  objc_destroyWeak(&v246);

  objc_destroyWeak(&v252);
  objc_destroyWeak(&v255);

  objc_destroyWeak(&v258);
  objc_destroyWeak(&v261);

  objc_destroyWeak(&v268);
  objc_destroyWeak(&v271);

  objc_destroyWeak(&v274);
  objc_destroyWeak(&v277);

  objc_destroyWeak(&v281);
  objc_destroyWeak(&v283);

  objc_destroyWeak(&v286);
  objc_destroyWeak(&v289);

  objc_destroyWeak(&v292);
  objc_destroyWeak(&v295);

  objc_destroyWeak(&v302);
  objc_destroyWeak(&v305);

  objc_destroyWeak(&v311);
  objc_destroyWeak(&v313);

  objc_destroyWeak(&v316);
  objc_destroyWeak(&v319);

  objc_destroyWeak(&v326);
  objc_destroyWeak(&v333);

  objc_destroyWeak(&v338);
  objc_destroyWeak(&v343);

  objc_destroyWeak(&v348);
  objc_destroyWeak(&v354);

  objc_destroyWeak(&v357);
  objc_destroyWeak(&v359);
  objc_destroyWeak(&v362);

  objc_destroyWeak(&v371);
  objc_destroyWeak(&v378);

  objc_destroyWeak(&v381);
  objc_destroyWeak(&v384);
  objc_destroyWeak(&v386);
  objc_destroyWeak(&v389);

  objc_destroyWeak(&v394);
  objc_destroyWeak(&v399);

  objc_destroyWeak(&v404);
  objc_destroyWeak(&v410);

  objc_destroyWeak(&v415);
  objc_destroyWeak(&v420);

  objc_destroyWeak(&v426);
  objc_destroyWeak(&v429);

  objc_destroyWeak(&v434);
  objc_destroyWeak(&v439);

  objc_destroyWeak(&v441);
  objc_destroyWeak(&v443);

  objc_destroyWeak(&v445);
  objc_destroyWeak(&v451);

  objc_destroyWeak(&v454);
  objc_destroyWeak(&v456);

  objc_destroyWeak(&v458);
  objc_destroyWeak(&v460);

  objc_destroyWeak(&v462);
  objc_destroyWeak(&v464);

  objc_destroyWeak(&v467);
  objc_destroyWeak(&v470);

  objc_destroyWeak(&v472);
  objc_destroyWeak(&v474);

  objc_destroyWeak(&v476);
  objc_destroyWeak(&v482);

  objc_destroyWeak(&v484);
  objc_destroyWeak(&v486);

  objc_destroyWeak(&v488);
  objc_destroyWeak(&v490);

  objc_destroyWeak(&v492);
  objc_destroyWeak(&v494);

  objc_destroyWeak(&v496);
  objc_destroyWeak(&v498);
  objc_destroyWeak(&v499);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v10 = [WeakRetained stateMachine];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    CMTime v11[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2;
    v11[3] = &unk_264CC5B68;
    id v13 = v7;
    char v14 = a3;
    id v12 = v8;
    [v10 executeBlockAfterCurrentStateTransition:v11];
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [WeakRetained stateMachine];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4;
    v8[3] = &unk_264CC5BB8;
    id v9 = v5;
    char v10 = a3;
    [v7 executeBlockAfterCurrentStateTransition:v8];
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [WeakRetained stateMachine];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6;
    v8[3] = &unk_264CC5BB8;
    id v9 = v5;
    char v10 = a3;
    [v7 executeBlockAfterCurrentStateTransition:v8];
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v13 = [WeakRetained stateMachine];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    void v14[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8;
    v14[3] = &unk_264CC5C08;
    id v17 = v9;
    char v18 = a3;
    id v15 = v10;
    id v16 = v11;
    [v13 executeBlockAfterCurrentStateTransition:v14];
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9(uint64_t a1, float a2, Float64 a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = [WeakRetained AVQueuePlayer];

  if (!v7)
  {
    uint64_t v18 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)id buf = 0;
    id v19 = "Unable to set rate since AVQueuePlayer is nil";
    id v20 = v18;
    uint32_t v21 = 2;
LABEL_11:
    _os_log_impl(&dword_236FC5000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    return;
  }
  id v8 = objc_loadWeakRetained(v5);
  id v9 = [v8 AVQueuePlayer];
  [v9 rate];
  float v11 = v10;

  if (v11 == a2)
  {
    uint64_t v22 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)id buf = 134217984;
    double v27 = a2;
    id v19 = "Not setting rate to %f since it's already the player's rate";
    id v20 = v22;
    uint32_t v21 = 12;
    goto LABEL_11;
  }
  id v12 = objc_loadWeakRetained(v5);
  [v12 setModifyingAVPlayerRate:1];

  id v13 = sPlayerLogObject;
  BOOL v14 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (a3 <= 0.0)
  {
    if (v14)
    {
      *(_DWORD *)id buf = 134217984;
      double v27 = a2;
      _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Setting AVPlayer rate to %f", buf, 0xCu);
    }
    id v15 = objc_loadWeakRetained(v5);
    id v16 = [v15 AVQueuePlayer];
    *(float *)&double v23 = a2;
    [v16 setRate:v23];
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)id buf = 134218240;
      double v27 = a2;
      __int16 v28 = 2048;
      Float64 v29 = a3;
      _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Setting AVPlayer rate to %f with volume ramp duration of %f", buf, 0x16u);
    }
    id v15 = objc_loadWeakRetained(v5);
    id v16 = [v15 AVQueuePlayer];
    CMTimeMakeWithSeconds(&v25, a3, 1000000);
    *(float *)&double v17 = a2;
    [v16 setRate:&v25 withVolumeRampDuration:v17];
  }

  id v24 = objc_loadWeakRetained(v5);
  [v24 setModifyingAVPlayerRate:0];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_710(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateMediaRemoteManager];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateAVPlayerActionAtItemEnd];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = +[TVPPlaybackState playing];
  id v6 = objc_loadWeakRetained(v1);
  [v6 rateUsedForPlayback];
  objc_msgSend(v4, "_setState:updatedRate:notifyListeners:", v5, 1);

  return @"Playing";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_712(uint64_t a1, CMTime *a2, CMTime *a3, void *a4, double a5)
{
  id v9 = a4;
  if (a5 <= 0.0)
  {
    if (a5 < 0.0)
    {
      memset(&time, 0, sizeof(time));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v13 = WeakRetained;
      if (WeakRetained) {
        [WeakRetained _currentMediaItemReversePlaybackEndTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }

      CMTime time1 = *a2;
      CMTime v49 = time;
      if (CMTimeCompare(&time1, &v49) <= 0)
      {
LABEL_9:
        *a2 = time;
        BOOL v14 = (id *)(a1 + 32);
        id v15 = objc_loadWeakRetained(v14);
        id v16 = [v15 AVKitExternalImageScanningUpdateBlock];

        if (v16)
        {
          id v17 = objc_loadWeakRetained(v14);
          CMTime time = *a2;
          [v17 setLastTimeSentToAVKitImageHandler:&time];

          id v18 = objc_loadWeakRetained(v14);
          id v19 = [v18 AVKitExternalImageScanningUpdateBlock];
          id v20 = objc_loadWeakRetained(v14);
          uint32_t v21 = [v20 externalImagePlayer];
          uint64_t v22 = [v21 currentImage];
          double v23 = (void (*)(void *, CMTime *, void *))v19[2];
          CMTime time = *a2;
          v23(v19, &time, v22);
        }
        id v24 = (void (**)(void, double))objc_loadWeakRetained(v14);
        CMTime v25 = [v24 stateMachine];
        [v25 postEvent:@"Hit beginning or end"];

        goto LABEL_26;
      }
    }
  }
  else
  {
    memset(&time, 0, sizeof(time));
    id v10 = objc_loadWeakRetained((id *)(a1 + 32));
    float v11 = v10;
    if (v10) {
      [v10 _currentMediaItemForwardPlaybackEndTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }

    CMTime time1 = *a2;
    CMTime v49 = time;
    if ((CMTimeCompare(&time1, &v49) & 0x80000000) == 0) {
      goto LABEL_9;
    }
  }
  id v26 = (id *)(a1 + 32);
  id v27 = objc_loadWeakRetained(v26);
  CMTime time = *a3;
  CMTime time1 = *a2;
  [v27 _notifyOfBoundaryCrossingBetweenPreviousTime:&time updatedTime:&time1];

  CMTime time = *a2;
  double v28 = floor(CMTimeGetSeconds(&time));
  CMTime time = *a3;
  if (v28 != floor(CMTimeGetSeconds(&time)))
  {
    id v29 = objc_loadWeakRetained(v26);
    uint64_t v30 = [v29 currentInterstitialCollection];
    CMTime time = *a2;
    id v31 = [v30 interstitialForTime:CMTimeGetSeconds(&time)];

    if (!v31)
    {
      id v32 = objc_loadWeakRetained(v26);
      CMTime time = *a2;
      [v32 _notifyListenersOfElapsedTimeChange:&time playbackDate:v9 dueToTimeJump:0];
    }
    id v33 = objc_loadWeakRetained(v26);
    id v34 = [v33 AVKitExternalImageScanningUpdateBlock];

    if (v34)
    {
      id v35 = objc_loadWeakRetained(v26);
      CMTime time = *a2;
      [v35 setLastTimeSentToAVKitImageHandler:&time];

      id v36 = objc_loadWeakRetained(v26);
      id v37 = [v36 AVKitExternalImageScanningUpdateBlock];
      id v38 = objc_loadWeakRetained(v26);
      uint64_t v39 = [v38 externalImagePlayer];
      long long v40 = [v39 currentImage];
      id v41 = (void (*)(void *, CMTime *, void *))v37[2];
      CMTime time = *a2;
      v41(v37, &time, v40);
    }
  }
  id v42 = objc_loadWeakRetained(v26);
  id v24 = [v42 highFrequencyElapsedTimeObserverBlock];

  if (v24)
  {
    id v43 = objc_loadWeakRetained(v26);
    id v44 = [v43 currentMediaItem];
    int v45 = [v44 hasTrait:@"TVPMediaItemTraitIsScene"];

    if (v45)
    {
      id v46 = objc_loadWeakRetained(v26);
      double v47 = v46;
      if (v46)
      {
        CMTime time1 = *a2;
        [v46 _clampedSceneTimeForPlayerTime:&time1];
      }
      else
      {
        memset(&time, 0, sizeof(time));
      }
      *a2 = time;
    }
    CMTime time = *a2;
    Float64 Seconds = CMTimeGetSeconds(&time);
    v24[2](v24, Seconds);
  }
LABEL_26:
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_714(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v8 = @"TVPPlayerStillImageKey";
    v9[0] = v3;
    id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 postNotificationName:@"TVPPlayerStillImageDidChangeNotification" object:WeakRetained userInfo:v5];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_716(uint64_t a1, uint64_t a2, char a3, int a4, double a5)
{
  if (a5 == 0.0 || a5 == 1.0)
  {
    id v8 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring scan request because requested rate is 0.0 or 1.0", buf, 2u);
    }
    id v9 = [*(id *)(a1 + 32) currentState];
  }
  else
  {
    id v13 = (id *)(a1 + 64);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    int v15 = [WeakRetained currentMediaItemHasVideoContent];

    if (!v15)
    {
      double v23 = objc_alloc_init(TVPProgressiveJumpingScrubber);
      if (a5 <= 0.0) {
        double v24 = -1.0;
      }
      else {
        double v24 = 1.0;
      }
      id v25 = objc_loadWeakRetained((id *)(a1 + 64));
      [(TVPProgressiveJumpingScrubber *)v23 setPlayer:v25];

      id v26 = objc_loadWeakRetained(v13);
      [v26 setProgressiveJumpingScrubber:v23];

      [(TVPProgressiveJumpingScrubber *)v23 startScrubWithRate:v24];
      id v27 = objc_loadWeakRetained(v13);
      double v28 = +[TVPPlaybackState scanning];
      [v27 _setState:v28 updatedRate:1 notifyListeners:v24];

      id v9 = @"Scrubbing using progressive jumping";
      goto LABEL_33;
    }
    id v16 = objc_loadWeakRetained((id *)(a1 + 64));
    id v17 = [v16 AVQueuePlayer];
    [v17 setActionAtItemEnd:1];

    if ((a3 & 1) == 0)
    {
      id v18 = objc_loadWeakRetained((id *)(a1 + 64));
      if ([v18 _currentPlayerItemCanScanAtRate:a5])
      {
        id v19 = objc_loadWeakRetained((id *)(a1 + 64));
        id v20 = [v19 currentInterstitialCollection];

        if (!v20)
        {
          uint32_t v21 = sPlayerLogObject;
          BOOL v22 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
          if (a4)
          {
            if (v22)
            {
              *(_WORD *)id buf = 0;
              _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, not setting player rate since AVKit will do it for us", buf, 2u);
            }
            id v9 = @"Scanning using AVPlayer driven by AVKit";
          }
          else
          {
            if (v22)
            {
              *(_WORD *)id buf = 0;
              _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, calling _setAVPlayerRate", buf, 2u);
            }
            float v48 = a5;
            (*(void (**)(float, double))(*(void *)(a1 + 40) + 16))(v48, 0.0);
            id v9 = @"Scanning using AVPlayer";
          }
          id v49 = objc_loadWeakRetained((id *)(a1 + 64));
          id v50 = +[TVPPlaybackState scanning];
          [v49 _setState:v50 updatedRate:1 notifyListeners:a5];

          goto LABEL_33;
        }
      }
      else
      {
      }
    }
    id v29 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v30 = [v29 externalImagePlayer];

    if (!v30)
    {
      id v31 = objc_loadWeakRetained((id *)(a1 + 64));
      id v32 = [v31 currentPlayerItem];

      *(_OWORD *)id buf = *MEMORY[0x263F010E0];
      uint64_t v60 = *(void *)(MEMORY[0x263F010E0] + 16);
      id v33 = objc_loadWeakRetained((id *)(a1 + 64));
      int v34 = [v33 _currentPlayerItemContainsDates];

      if (v34)
      {
        if (v32)
        {
          [v32 currentTime];
        }
        else
        {
          long long v57 = 0uLL;
          uint64_t v58 = 0;
        }
        *(_OWORD *)id buf = v57;
        uint64_t v60 = v58;
        id v36 = objc_loadWeakRetained((id *)(a1 + 64));
        id v35 = [v36 _currentDateFromPlayerItem:v32];
      }
      else
      {
        id v35 = 0;
      }
      id v37 = [TVPExternalImagePlayer alloc];
      id v38 = objc_loadWeakRetained((id *)(a1 + 64));
      uint64_t v39 = [v38 currentMediaItem];
      long long v57 = *(_OWORD *)buf;
      uint64_t v58 = v60;
      uint64_t v30 = [(TVPExternalImagePlayer *)v37 initWithMediaItem:v39 referenceTime:&v57 forDate:v35];

      [(TVPExternalImagePlayer *)v30 setElapsedTimeUpdateBlock:*(void *)(a1 + 48)];
      [(TVPExternalImagePlayer *)v30 setImageUpdateBlock:*(void *)(a1 + 56)];
      id v40 = objc_loadWeakRetained((id *)(a1 + 64));
      [v40 setExternalImagePlayer:v30];

      id v41 = objc_loadWeakRetained((id *)(a1 + 64));
      id v42 = [v41 AVQueuePlayer];
      [v42 setResourceConservationLevelWhilePaused:1];

      uint64_t v51 = MEMORY[0x263EF8330];
      uint64_t v52 = 3221225472;
      long long v53 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_718;
      id v54 = &unk_264CC5BB8;
      char v56 = a4;
      id v43 = *(void **)(a1 + 32);
      id v55 = *(id *)(a1 + 40);
      [v43 executeBlockAfterCurrentStateTransition:&v51];
    }
    *(_OWORD *)id buf = *(_OWORD *)a2;
    uint64_t v60 = *(void *)(a2 + 16);
    -[TVPExternalImagePlayer setElapsedTime:](v30, "setElapsedTime:", buf, v51, v52, v53, v54);
    [(TVPExternalImagePlayer *)v30 setRate:a5];
    id v44 = objc_loadWeakRetained((id *)(a1 + 64));
    int v45 = +[TVPPlaybackState scanning];
    [v44 _setState:v45 updatedRate:1 notifyListeners:a5];

    id v46 = @"Scanning using external images";
    if (a4) {
      id v46 = @"Scanning using external images driven by AVKit";
    }
    id v9 = v46;
  }
LABEL_33:
  return v9;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_718(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = sPlayerLogObject;
  BOOL v4 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, not setting player rate during external image player startup since AVKit will do it for us", v5, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, calling _setAVPlayerRate during external image player startup", buf, 2u);
    }
    (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_721(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    goto LABEL_8;
  }
  [WeakRetained cachedDuration];
  if ((v23 & 0x100000000) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (!v4)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;

    goto LABEL_8;
  }
  [v4 cachedDuration];

  if ((v20 & 0x1000000000) != 0)
  {
    id v6 = objc_loadWeakRetained(v1);
    [v6 setStartDate:0];

    id v7 = objc_loadWeakRetained(v1);
    long long v17 = *MEMORY[0x263F010E0];
    uint64_t v18 = *(void *)(MEMORY[0x263F010E0] + 16);
    [v7 setStartTime:&v17];
    goto LABEL_13;
  }
LABEL_9:
  id v8 = objc_loadWeakRetained(v1);
  id v7 = [v8 playbackDate];

  id v9 = objc_loadWeakRetained(v1);
  id v10 = v9;
  if (v7)
  {
    [v9 setStartDate:v7];

    id v11 = objc_loadWeakRetained(v1);
    long long v17 = *MEMORY[0x263F010E0];
    uint64_t v18 = *(void *)(MEMORY[0x263F010E0] + 16);
    [v11 setStartTime:&v17];
  }
  else
  {
    [v9 elapsedTime];
    Float64 v13 = v12;

    id v14 = objc_loadWeakRetained(v1);
    CMTimeMakeWithSeconds(&v16, v13, 1000000);
    [v14 setStartTime:&v16];

    id v11 = objc_loadWeakRetained(v1);
    [v11 setStartDate:0];
  }

LABEL_13:
  id v15 = objc_loadWeakRetained(v1);
  [v15 setStartPosition:0.0];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_722(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setStartDate:0];

  id v3 = objc_loadWeakRetained(v1);
  long long v8 = *MEMORY[0x263F010E0];
  long long v7 = v8;
  uint64_t v9 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v4 = v9;
  [v3 setStartTime:&v8];

  id v5 = objc_loadWeakRetained(v1);
  long long v8 = v7;
  uint64_t v9 = v4;
  [v5 setStartingSeekPrecision:&v8];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setStartPosition:0.0];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_723(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = [WeakRetained playlist];
  uint64_t v9 = v8;
  if (a3) {
    [v8 nextMediaItem];
  }
  else {
  id v10 = [v8 currentMediaItem];
  }

  id v11 = objc_loadWeakRetained(v6);
  double v12 = [v11 playerItemFromCacheManager];

  if (v12)
  {
    id v13 = objc_loadWeakRetained(v6);
    id v14 = [v13 playerItemFromCacheManager];

    id v15 = objc_loadWeakRetained(v6);
    [v15 setPlayerItemFromCacheManager:0];
  }
  else
  {
    id v14 = (void *)[v5 newPlayerItem];
  }
  id v16 = objc_loadWeakRetained(v6);
  [v16 _populatePlayerItem:v14 withMetadataFromMediaItem:v10];

  id v17 = objc_loadWeakRetained(v6);
  [v17 maximumBitRate];
  double v19 = v18;

  if (v19 != 3.40282347e38)
  {
    id v20 = objc_loadWeakRetained(v6);
    [v20 maximumBitRate];
    objc_msgSend(v14, "setPreferredPeakBitRate:");
  }
  id v21 = objc_loadWeakRetained(v6);
  [v21 preferredMaximumResolution];
  double v23 = v22;
  double v25 = v24;
  double v27 = *MEMORY[0x263F001B0];
  double v26 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v23 != v27 || v25 != v26)
  {
    id v28 = objc_loadWeakRetained(v6);
    [v28 preferredMaximumResolution];
    objc_msgSend(v14, "setPreferredMaximumResolution:");
  }
  id v29 = objc_loadWeakRetained(v6);
  [v29 preferredMaximumResolutionForExpensiveNetworks];
  double v31 = v30;
  double v33 = v32;

  if (v31 != v27 || v33 != v26)
  {
    id v34 = objc_loadWeakRetained(v6);
    [v34 preferredMaximumResolutionForExpensiveNetworks];
    objc_msgSend(v14, "setPreferredMaximumResolutionForExpensiveNetworks:");
  }
  id v35 = objc_loadWeakRetained(v6);
  id v36 = [v35 reportingCategory];

  if (v36)
  {
    id v37 = (id)sPlayerLogObject;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = objc_loadWeakRetained(v6);
      id v39 = [v38 reportingCategory];
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v39;
      _os_log_impl(&dword_236FC5000, v37, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem reportingCategory to %@", (uint8_t *)&buf, 0xCu);
    }
    id v40 = objc_loadWeakRetained(v6);
    id v41 = [v40 reportingCategory];
    [v14 setReportingCategory:v41];
  }
  id v42 = objc_loadWeakRetained(v6);
  [v42 preferredForwardBufferDuration];
  double v44 = v43;

  if (v44 > 0.0)
  {
    id v45 = objc_loadWeakRetained(v6);
    [v45 preferredForwardBufferDuration];
    objc_msgSend(v14, "setPreferredForwardBufferDuration:");
  }
  id v46 = objc_loadWeakRetained(v6);
  if ([v46 _beingUsedForIFrameOnlyPlayback]) {
    uint64_t v47 = 0;
  }
  else {
    uint64_t v47 = [v10 hasTrait:@"TVPMediaItemTraitMinimizeNetworkUsageWhilePaused"] ^ 1;
  }
  [v14 setCanUseNetworkResourcesForLiveStreamingWhilePaused:v47];

  memset(&v150, 0, sizeof(v150));
  id v48 = objc_loadWeakRetained(v6);
  id v49 = v48;
  if (v48) {
    [v48 startTime];
  }
  else {
    memset(&v150, 0, sizeof(v150));
  }

  memset(&v149, 0, sizeof(v149));
  id v50 = objc_loadWeakRetained(v6);
  if ([v50 _beingUsedForIFrameOnlyPlayback])
  {
    CMTimeMakeWithSeconds(&v149, 10.0, 1000000);
  }
  else
  {
    id v51 = objc_loadWeakRetained(v6);
    uint64_t v52 = v51;
    if (v51) {
      [v51 startingSeekPrecision];
    }
    else {
      memset(&v149, 0, sizeof(v149));
    }
  }
  id v53 = objc_loadWeakRetained(v6);
  [v53 startPosition];
  Float64 v55 = v54;

  id v56 = objc_loadWeakRetained(v6);
  uint64_t v57 = [v56 startDate];

  if (!v57)
  {
    uint64_t v57 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStartDate"];
  }
  if (v55 != 0.0)
  {
    memset(&buf, 0, sizeof(buf));
    uint64_t v58 = [v14 asset];
    id v59 = v58;
    if (v58) {
      [v58 duration];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }

    if ((buf.flags & 0x1D) == 1)
    {
      CMTime time = buf;
      CMTimeMultiplyByFloat64(&time2, &time, v55);
      CMTime v150 = time2;
    }
  }
  id location = v6;
  CMTime buf = v150;
  *(_OWORD *)&time2.value = *MEMORY[0x263F010E0];
  long long v140 = *(_OWORD *)&time2.value;
  CMTimeEpoch v60 = *(void *)(MEMORY[0x263F010E0] + 16);
  time2.CMTimeEpoch epoch = v60;
  int32_t v61 = CMTimeCompare(&buf, &time2);
  long long v62 = v140;
  v138 = v10;
  id v139 = (void *)v57;
  if (!v61)
  {
    __int16 v63 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStartTime"];
    id v64 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataStartTimeIsRelativeToMainContent"];
    int v65 = [v64 BOOLValue];

    id v66 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v67 = [v66 stringForKey:@"MovieAndTVShowStartLocationSetting.v2"];

    if (v67 && [v67 isEqualToString:@"Beginning"])
    {
      *(_OWORD *)&v150.value = v140;
      v150.CMTimeEpoch epoch = v60;
    }
    else if (v65)
    {
      id v68 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataFeatureStartTime"];
      [v63 doubleValue];
      double v70 = v69;
      [v68 doubleValue];
      double v72 = v70 + v71;
      CMTimeMakeWithSeconds(&buf, v72, 1000000);
      CMTime v150 = buf;
      int v73 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        id v74 = [NSNumber numberWithDouble:v72];
        LODWORD(buf.value) = 138412802;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v63;
        LOWORD(buf.flags) = 2112;
        *(void *)((char *)&buf.flags + 2) = v68;
        HIWORD(buf.epoch) = 2112;
        v153 = v74;
        _os_log_impl(&dword_236FC5000, v73, OS_LOG_TYPE_DEFAULT, "Using main content relative start time of %@.  Main content start time is %@; translating to absolute start time of %@",
          (uint8_t *)&buf,
          0x20u);

        id v10 = v138;
      }
    }
    else if (v63)
    {
      [v63 floatValue];
      CMTimeMakeWithSeconds(&buf, v75, 1000000);
      CMTime v150 = buf;
    }

    uint64_t v57 = (uint64_t)v139;
    long long v62 = v140;
  }
  CMTime buf = v150;
  *(_OWORD *)&time2.value = v62;
  time2.CMTimeEpoch epoch = v60;
  if (CMTimeCompare(&buf, &time2))
  {
    v76 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v77 = [v76 BOOLForKey:@"DisableResume"];

    id v78 = (id)sPlayerLogObject;
    BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT);
    if (v77)
    {
      if (v79)
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_236FC5000, v78, OS_LOG_TYPE_DEFAULT, "Ignoring start time since DisableResume pref key is YES", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      if (v79)
      {
        CMTime buf = v150;
        id v80 = (id)CMTimeCopyDescription(0, &buf);
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v80;
        _os_log_impl(&dword_236FC5000, v78, OS_LOG_TYPE_DEFAULT, "Prior to enqueueing item, seeking player item to %@", (uint8_t *)&buf, 0xCu);
      }
      CMTime buf = v150;
      CMTime time2 = v149;
      CMTime time = v149;
      [v14 seekToTime:&buf toleranceBefore:&time2 toleranceAfter:&time completionHandler:0];
    }
  }
  else if (v57)
  {
    [v14 setInitialDate:v57];
  }
  id v81 = objc_loadWeakRetained(location);
  char v82 = [v81 interactive];

  if ((v82 & 1) == 0)
  {
    *(_OWORD *)&buf.value = v140;
    buf.CMTimeEpoch epoch = v60;
    [v14 setMaximumTrailingBufferDuration:&buf];
  }
  id v83 = location;
  id v84 = objc_loadWeakRetained(location);
  [v84 iFramePrefetchMaxSize];
  double v86 = v85;
  double v88 = v87;

  if (v86 != v27 || v88 != v26)
  {
    id v89 = objc_loadWeakRetained(location);
    [v89 iFramePrefetchMaxSize];
    objc_msgSend(v14, "setIFramePrefetchTargetDimensions:");
  }
  id v90 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataForwardPlaybackEndTime"];
  v91 = v90;
  if (v90)
  {
    memset(&buf, 0, sizeof(buf));
    [v90 doubleValue];
    CMTimeMakeWithSeconds(&buf, v92, 1000000);
    CMTime time2 = buf;
    [v14 setForwardPlaybackEndTime:&time2];
  }
  v137 = v91;
  id v93 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataReversePlaybackEndTime"];
  v94 = v93;
  if (v93)
  {
    memset(&buf, 0, sizeof(buf));
    [v93 doubleValue];
    CMTimeMakeWithSeconds(&buf, v95, 1000000);
    CMTime time2 = buf;
    [v14 setReversePlaybackEndTime:&time2];
  }
  id v136 = v94;
  uint64_t v96 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSoundCheckMediaKind"];
  if (v96)
  {
    v97 = (id)sPlayerLogObject;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = v96;
      _os_log_impl(&dword_236FC5000, v97, OS_LOG_TYPE_DEFAULT, "Sound check: setting player item mediaKind to %@", (uint8_t *)&buf, 0xCu);
    }

    [v14 setMediaKind:v96];
  }
  id v134 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSoundCheckDictionary"];
  id v135 = (void *)v96;
  if (![v134 count])
  {
    id v99 = objc_loadWeakRetained(location);
    v98 = [v99 _soundCheckNormalizationForMediaItem:v10];

    if (v98)
    {
      [v98 floatValue];
      float v101 = floor(log10(v100) * 20.0 + 0.5);
      v102 = (id)sPlayerLogObject;
      if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
LABEL_85:

        *(float *)&double v106 = v101;
        [v14 setSoundCheckVolumeNormalization:v106];
        goto LABEL_86;
      }
      LODWORD(buf.value) = 134217984;
      *(double *)((char *)&buf.value + 4) = v101;
      v103 = "Sound check: setting player item soundCheckVolumeNormalization to value from mediaItem: %f";
    }
    else
    {
      v104 = [v5 AVAsset];
      [v104 preferredSoundCheckVolumeNormalization];
      float v101 = v105;

      if (v101 == 0.0) {
        goto LABEL_86;
      }
      v102 = (id)sPlayerLogObject;
      if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_85;
      }
      LODWORD(buf.value) = 134217984;
      *(double *)((char *)&buf.value + 4) = v101;
      v103 = "Sound check: setting player item soundCheckVolumeNormalization to value from AVAsset: %f";
    }
    _os_log_impl(&dword_236FC5000, v102, OS_LOG_TYPE_DEFAULT, v103, (uint8_t *)&buf, 0xCu);
    goto LABEL_85;
  }
  v98 = (id)sPlayerLogObject;
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_236FC5000, v98, OS_LOG_TYPE_DEFAULT, "Sound check: not setting soundCheckVolumeNormalization since raw sound check info dict exists.", (uint8_t *)&buf, 2u);
  }
LABEL_86:

  uint64_t v107 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataScrubPlayerItem"];
  id v108 = objc_loadWeakRetained(location);
  v133 = (void *)v107;
  [v108 _setScrubPlayerItem:v107 onPlayerItem:v14];

  id v132 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemMetadataSavedAudioOption"];
  uint64_t v109 = [v132 propertyListRepresentation];
  if (v109)
  {
    __int16 v110 = [v5 AVAsset];
    id v111 = objc_msgSend(v110, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);

    id v112 = [v111 mediaSelectionOptionWithPropertyList:v109];
    if (v112) {
      [v14 selectMediaOption:v112 inMediaSelectionGroup:v111];
    }
  }
  id v131 = (void *)v109;
  v141 = v5;
  v113 = [v5 mediaItem];
  int v114 = [v113 hasTrait:@"TVPMediaItemTraitIsLocal"];

  if (v114) {
    [v14 setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions:1];
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v115 = objc_loadWeakRetained(location);
  id v116 = [v115 reportingValues];

  uint64_t v117 = [v116 countByEnumeratingWithState:&v143 objects:v151 count:16];
  if (v117)
  {
    uint64_t v118 = v117;
    uint64_t v119 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v118; ++i)
      {
        if (*(void *)v144 != v119) {
          objc_enumerationMutation(v116);
        }
        uint64_t v121 = *(void *)(*((void *)&v143 + 1) + 8 * i);
        id v122 = objc_loadWeakRetained(v83);
        id v123 = [v122 reportingValues];
        v124 = [v123 objectForKey:v121];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v14 setReportingValueWithString:v124 forKey:v121];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 setReportingValueWithNumber:v124 forKey:v121];
          }
        }

        id v83 = location;
      }
      uint64_t v118 = [v116 countByEnumeratingWithState:&v143 objects:v151 count:16];
    }
    while (v118);
  }

  if ([v138 hasTrait:@"TVPMediaItemTraitWantsDateRangeGroupNotifications"])
  {
    v125 = (void *)[objc_alloc(MEMORY[0x263EFA818]) initWithIdentifiers:0 classifyingLabels:0];
    id v126 = objc_loadWeakRetained(v83);
    v127 = (void *)MEMORY[0x263EF83A0];
    id v128 = MEMORY[0x263EF83A0];
    [v125 setDelegate:v126 queue:v127];

    [v14 addMediaDataCollector:v125];
  }
  id v129 = v14;

  return v129;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_735(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = [WeakRetained playlist];
  uint64_t v9 = v8;
  if (a3) {
    [v8 nextMediaItem];
  }
  else {
  id v10 = [v8 currentMediaItem];
  }

  id v11 = [v10 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v11 addStartEventWithName:TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp];

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = [v12 AVQueuePlayer];

  id v14 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v15 = [v13 items];
  [v15 count];

  if (!a3)
  {
    id v16 = objc_loadWeakRetained(v6);
    [v16 updateAudioSelectionCriteria];

    id v17 = objc_loadWeakRetained(v6);
    double v18 = [v17 pendingSelectedMediaArray];

    if (v18)
    {
      double v19 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 134217984;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
        _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Applying pending selectedMediaArray to item %p.", (uint8_t *)&buf, 0xCu);
      }
      id v20 = objc_loadWeakRetained(v6);
      [v20 setPendingSelectedMediaArray:0];

      id v21 = objc_loadWeakRetained(v6);
      [v21 _selectMediaArray:v18 withItem:v14];
    }
  }
  id v22 = objc_loadWeakRetained(v6);
  [v22 setHaveEverEnqueuedPlayerItem:1];

  id v23 = objc_loadWeakRetained(v6);
  [v23 setModifyingAVPlayerRate:1];

  id v24 = objc_loadWeakRetained(v6);
  [v24 setModifyingAVPlayerQueue:1];

  [v13 insertItem:v14 afterItem:0];
  id v25 = objc_loadWeakRetained(v6);
  [v25 setModifyingAVPlayerRate:0];

  id v26 = objc_loadWeakRetained(v6);
  [v26 setModifyingAVPlayerQueue:0];

  id v27 = objc_loadWeakRetained(v6);
  int v28 = [v27 _beingUsedForIFrameOnlyPlayback];

  if (v28)
  {
    id v29 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_236FC5000, v29, OS_LOG_TYPE_DEFAULT, "Seeking after inserting item for iframe-only playback", (uint8_t *)&buf, 2u);
    }
    memset(&buf, 0, sizeof(buf));
    CMTimeMakeWithSeconds(&buf, 10.0, 1000000);
    if (v14) {
      [v14 currentTime];
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    CMTime v36 = buf;
    CMTime v35 = buf;
    [v14 seekToTime:v37 toleranceBefore:&v36 toleranceAfter:&v35 completionHandler:0];
  }
  double v30 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    double v31 = v30;
    id v32 = objc_loadWeakRetained(v6);
    double v33 = [v32 AVQueuePlayer];
    id v34 = [v33 items];
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
    _os_log_impl(&dword_236FC5000, v31, OS_LOG_TYPE_DEFAULT, "Player queue after enqueueing item: %@", (uint8_t *)&buf, 0xCu);
  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_737(uint64_t a1, uint64_t a2, void *a3, CMTime *a4, void *a5, int a6, double a7)
{
  id v48 = a4;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v54 = a5;
  id v12 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v52 = [WeakRetained currentMediaItemLoader];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  id v53 = [v14 currentMediaItem];

  id v51 = [v53 reportingDelegate];
  Float64 v55 = [v52 timingData];
  [v55 startTimeForBuffering];
  if (v15 == 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    objc_msgSend(v55, "setStartTimeForBuffering:");
    if (objc_opt_respondsToSelector())
    {
      id v16 = objc_loadWeakRetained((id *)(a1 + 40));
      [v51 mediaItemWillStartBuffering:v53 player:v16];
    }
    id v17 = *(void **)(a1 + 32);
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_740;
    v80[3] = &unk_264CC5600;
    objc_copyWeak(&v81, (id *)(a1 + 40));
    [v17 executeBlockAfterCurrentStateTransition:v80];
    objc_destroyWeak(&v81);
  }
  id v18 = objc_loadWeakRetained((id *)(a1 + 40));
  double v19 = [v18 currentPlayerItem];

  v77[0] = MEMORY[0x263EF8330];
  v77[1] = 3221225472;
  v77[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_741;
  v77[3] = &unk_264CC5968;
  objc_copyWeak(&v79, (id *)(a1 + 40));
  id v78 = *(id *)(a1 + 32);
  id v50 = (void *)MEMORY[0x237E144A0](v77);
  value = *(void **)a2;
  CMTimeFlags flags = *(_DWORD *)(a2 + 12);
  CMTimeScale timescale = *(_DWORD *)(a2 + 8);
  if ((~flags & 5) != 0)
  {
    if ((~flags & 9) != 0)
    {
      if ((flags & 0x1D) == 1)
      {
        CMTimeEpoch v23 = *(void *)(a2 + 16);
        if (!v11) {
          goto LABEL_28;
        }
      }
      else
      {
        value = (void *)*MEMORY[0x263F010E0];
        CMTimeFlags flags = *(_DWORD *)(MEMORY[0x263F010E0] + 12);
        CMTimeScale timescale = *(_DWORD *)(MEMORY[0x263F010E0] + 8);
        CMTimeEpoch v23 = *(void *)(MEMORY[0x263F010E0] + 16);
        if (!v11)
        {
LABEL_28:
          memset(&buf, 0, 24);
          if (v19) {
            [v19 currentTime];
          }
          id v37 = objc_loadWeakRetained(v12);
          id v38 = [v37 stateMachine];
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_743;
          v66[3] = &unk_264CC5D98;
          objc_copyWeak(v67, v12);
          v67[1] = value;
          CMTimeScale v68 = timescale;
          CMTimeFlags v69 = flags;
          CMTimeEpoch v70 = v23;
          long long v71 = *(_OWORD *)&buf.start.value;
          CMTimeEpoch epoch = buf.start.epoch;
          [v38 executeBlockAfterCurrentStateTransition:v66];

          uint64_t v39 = sPlayerLogObject;
          if ((*(_DWORD *)(a2 + 12) & 0x11) == 1)
          {
            BOOL v40 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
            if (a6)
            {
              if (v40)
              {
                LOWORD(range.start.value) = 0;
                _os_log_impl(&dword_236FC5000, v39, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, calling seekToTime", (uint8_t *)&range, 2u);
              }
              id v41 = objc_loadWeakRetained(v12);
              objc_msgSend(v41, "setNumOutstandingSeeks:", objc_msgSend(v41, "numOutstandingSeeks") + 1);

              *(_OWORD *)&range.start.value = *(_OWORD *)a2;
              range.start.CMTimeEpoch epoch = *(void *)(a2 + 16);
              CMTime v75 = *v48;
              long long v64 = *(_OWORD *)&v48->value;
              CMTimeEpoch v65 = v48->epoch;
              [v19 seekToTime:&range toleranceBefore:&v75 toleranceAfter:&v64 completionHandler:v50];
            }
            else if (v40)
            {
              LOWORD(range.start.value) = 0;
              _os_log_impl(&dword_236FC5000, v39, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, bypassing seekToTime", (uint8_t *)&range, 2u);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
              __42__TVPPlayer__registerStateMachineHandlers__block_invoke_737_cold_1();
            }
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_744;
            block[3] = &unk_264CC55B0;
            id v63 = v50;
            dispatch_async(MEMORY[0x263EF83A0], block);
          }
          objc_destroyWeak(v67);
          goto LABEL_41;
        }
      }
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      id v24 = objc_loadWeakRetained((id *)(a1 + 40));
      id v25 = [v24 cachedSeekableTimeRanges];
      +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v25];

      value = 0;
      CMTimeFlags flags = 0;
      CMTimeScale timescale = 0;
      CMTimeEpoch v23 = 0;
      *(_OWORD *)a2 = 0u;
      *(void *)(a2 + 16) = 0;
      if (!v11) {
        goto LABEL_28;
      }
    }
  }
  else
  {
    memset(&buf, 0, sizeof(buf));
    id v21 = objc_loadWeakRetained((id *)(a1 + 40));
    id v22 = [v21 cachedSeekableTimeRanges];
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:v22];

    CMTimeRange range = buf;
    CMTimeRangeGetEnd(&v75, &range);
    value = (void *)v75.value;
    CMTimeFlags flags = v75.flags;
    CMTimeScale timescale = v75.timescale;
    CMTimeEpoch v23 = v75.epoch;
    if (!v11) {
      goto LABEL_28;
    }
  }
  if (objc_msgSend(v19, "status", v48) != 1
    || ([v19 currentDate],
        id v26 = objc_claimAutoreleasedReturnValue(),
        BOOL v27 = v26 == 0,
        v26,
        v27))
  {
    id v31 = objc_loadWeakRetained(v12);
    id v32 = [v31 currentPlayerItem];
    double v33 = v32;
    if (v32) {
      [v32 currentTime];
    }
    else {
      memset(v73, 0, sizeof(v73));
    }
    id v34 = objc_loadWeakRetained(v12);
    CMTime v35 = [v34 currentPlayerItem];
    CMTime v36 = [v34 _currentDateFromPlayerItem:v35];
    if (v31) {
      [v31 _estimatedCMTimeForPlaybackDate:v11 referenceTime:v73 referenceDate:v36];
    }
    else {
      memset(&buf, 0, 24);
    }
    *(_OWORD *)a2 = *(_OWORD *)&buf.start.value;
    *(void *)(a2 + 16) = buf.start.epoch;

    value = *(void **)a2;
    CMTimeFlags flags = *(_DWORD *)(a2 + 12);
    CMTimeScale timescale = *(_DWORD *)(a2 + 8);
    CMTimeEpoch v23 = *(void *)(a2 + 16);
    goto LABEL_28;
  }
  int v28 = sPlayerLogObject;
  BOOL v29 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (a6)
  {
    if (v29)
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_236FC5000, v28, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, calling seekToDate", (uint8_t *)&buf, 2u);
    }
    id v30 = objc_loadWeakRetained(v12);
    objc_msgSend(v30, "setNumOutstandingSeeks:", objc_msgSend(v30, "numOutstandingSeeks") + 1);

    [v19 seekToDate:v11 completionHandler:v50];
  }
  else if (v29)
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_236FC5000, v28, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, bypassing seekToDate", (uint8_t *)&buf, 2u);
  }
LABEL_41:
  id v42 = objc_loadWeakRetained(v12);
  [v42 setDateBeingSeekedTo:v11];

  id v43 = objc_loadWeakRetained(v12);
  buf.start.value = (CMTimeValue)value;
  buf.start.CMTimeScale timescale = timescale;
  buf.start.CMTimeFlags flags = flags;
  buf.start.CMTimeEpoch epoch = v23;
  [v43 setTimeBeingSeekedTo:&buf];

  if (v54)
  {
    id v44 = objc_loadWeakRetained(v12);
    [v44 _setState:v54 updatedRate:1 notifyListeners:a7];
  }
  id v45 = objc_loadWeakRetained(v12);
  id v46 = [v45 stateMachine];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_745;
  v56[3] = &unk_264CC5DC0;
  objc_copyWeak(v58, v12);
  v58[1] = value;
  CMTimeScale v59 = timescale;
  CMTimeFlags v60 = flags;
  CMTimeEpoch v61 = v23;
  id v47 = v11;
  id v57 = v47;
  [v46 executeBlockAfterCurrentStateTransition:v56];

  objc_destroyWeak(v58);
  objc_destroyWeak(&v79);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_740(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackReportingBufferingWillStartNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_741(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_742;
  block[3] = &unk_264CC5D70;
  char v6 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_742(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 48)) {
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Seek completion handler called.  finished param is %@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained numOutstandingSeeks];

  if (v5 >= 1)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "setNumOutstandingSeeks:", objc_msgSend(v6, "numOutstandingSeeks") - 1);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = [v7 numOutstandingSeeks];

  if (!v8) {
    [*(id *)(a1 + 32) postEvent:@"Seek completed"];
  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_743(uint64_t a1)
{
  int v2 = (id *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [v3 currentChapterCollection];
  CMTime time = *(CMTime *)(a1 + 40);
  uint64_t v5 = [v4 chapterForTime:CMTimeGetSeconds(&time)];
  [v3 setCurrentChapter:v5];

  id WeakRetained = objc_loadWeakRetained(v2);
  CMTime time = *(CMTime *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  [WeakRetained _notifyOfBoundaryCrossingBetweenPreviousTime:&time updatedTime:&v7];
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_744(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_745(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  [WeakRetained _notifyListenersOfElapsedTimeChange:&v4 playbackDate:v3 dueToTimeJump:1];
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_747(uint64_t a1, CMTime *a2, char a3, void *a4, void *a5, unsigned char *a6)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v39 = a4;
  id v11 = a5;
  id v12 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v14 = [WeakRetained delegate];

  id v15 = objc_loadWeakRetained(v12);
  id v16 = [v15 asyncDelegate];

  if (a6) {
    *a6 = 0;
  }
  memset(&v49, 0, sizeof(v49));
  id v17 = objc_loadWeakRetained(v12);
  id v18 = v17;
  if (v17) {
    objc_msgSend(v17, "_currentMediaItemReversePlaybackEndTime", v39);
  }
  else {
    memset(&v49, 0, sizeof(v49));
  }

  if (v49.flags)
  {
    CMTime time1 = *a2;
    CMTime time2 = v49;
    if (CMTimeCompare(&time1, &time2) < 0) {
      *a2 = v49;
    }
  }
  memset(&time1, 0, sizeof(time1));
  id v19 = objc_loadWeakRetained(v12);
  id v20 = v19;
  if (v19) {
    [v19 _currentMediaItemForwardPlaybackEndTime];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }

  if (time1.flags)
  {
    CMTime time2 = *a2;
    CMTime lhs = time1;
    if ((CMTimeCompare(&time2, &lhs) & 0x80000000) == 0)
    {
      id v21 = objc_loadWeakRetained(v12);
      [v21 duration];
      BOOL v23 = v22 == 3.40282347e38;

      if (v23)
      {
        CMTimeMakeWithSeconds(&rhs, 0.01, 1000000);
        CMTime lhs = time1;
        CMTimeAdd(&time2, &lhs, &rhs);
      }
      else
      {
        CMTimeMakeWithSeconds(&v45, 0.01, 1000000);
        CMTime lhs = time1;
        CMTimeSubtract(&time2, &lhs, &v45);
      }
      *a2 = time2;
    }
  }
  if (a3) {
    goto LABEL_38;
  }
  CMTime time2 = *a2;
  double Seconds = CMTimeGetSeconds(&time2);
  *(double *)&lhs.value = Seconds;
  if (v14)
  {
    id v25 = objc_loadWeakRetained(v12);
    uint64_t v26 = [v14 player:v25 shouldSeekToTime:&lhs playbackDate:0];

    if (*(double *)&lhs.value == Seconds) {
      int v27 = 0;
    }
    else {
      int v27 = v26;
    }
    if (v27 == 1)
    {
      CMTimeMakeWithSeconds(&time2, *(Float64 *)&lhs.value, 1000000);
      *a2 = time2;
LABEL_38:
      uint64_t v26 = 1;
    }
  }
  else
  {
    if (!v16) {
      goto LABEL_38;
    }
    int v28 = [v11 objectForKey:@"Async delegate response key"];
    if (v28)
    {
      BOOL v29 = [v11 objectForKey:@"Adjusted time key"];
      id v30 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v30;
        int v32 = [v28 BOOLValue];
        double v33 = @"NO";
        if (v32) {
          double v33 = @"YES";
        }
        LODWORD(time2.value) = 138412546;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v33;
        LOWORD(time2.flags) = 2112;
        *(void *)((char *)&time2.flags + 2) = v29;
        _os_log_impl(&dword_236FC5000, v31, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime returning saved delegate response of %@, %@", (uint8_t *)&time2, 0x16u);
      }
      uint64_t v26 = objc_msgSend(v28, "BOOLValue", v39);
      double v34 = Seconds;
      if (v29)
      {
        [(TVPAsyncPlayerDelegateOperation *)v29 doubleValue];
        *(double *)&lhs.value = v34;
      }
      if (v34 == Seconds) {
        int v35 = 0;
      }
      else {
        int v35 = v26;
      }
      if (v35 == 1)
      {
        CMTimeMakeWithSeconds(&time2, v34, 1000000);
        *a2 = time2;
      }
    }
    else
    {
      id v37 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(time2.value) = 0;
        _os_log_impl(&dword_236FC5000, v37, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime returning NO until delegate is consulted", (uint8_t *)&time2, 2u);
      }
      if (a6) {
        *a6 = 1;
      }
      BOOL v29 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)&time2, v29);
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_748;
      v40[3] = &unk_264CC5E38;
      objc_copyWeak(&v43, v12);
      v44[1] = *(id *)&Seconds;
      objc_copyWeak(v44, (id *)&time2);
      id v41 = v11;
      id v42 = v39;
      [(TVPAsyncPlayerDelegateOperation *)v29 setBlock:v40];
      id v38 = objc_loadWeakRetained(v12);
      [v38 _enqueueAsyncDelegateOperation:v29];

      objc_destroyWeak(v44);
      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)&time2);
      uint64_t v26 = 0;
    }
  }
  return v26;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_748(uint64_t a1)
{
  int v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime calling delegate", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v4 = [WeakRetained asyncDelegate];
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  double v6 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_749;
  v7[3] = &unk_264CC5E10;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v4 player:v5 shouldSeekToTime:v7 completion:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_749(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [v7 asyncDelegateOperations];
  id v9 = [v8 firstObject];
  int v10 = [v9 isEqual:WeakRetained];

  if (v10)
  {
    id v11 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = @"NO";
      if (a2) {
        id v12 = @"YES";
      }
      int v24 = 138412546;
      id v25 = v12;
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime response: %@, %f", (uint8_t *)&v24, 0x16u);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 56));
    id v14 = [v13 asyncDelegateOperations];
    [v14 removeObjectAtIndex:0];

    id v15 = *(void **)(a1 + 32);
    if (v15) {
      id v16 = (id)[v15 mutableCopy];
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v18 = v16;
    id v19 = [NSNumber numberWithBool:a2];
    [v18 setObject:v19 forKey:@"Async delegate response key"];

    id v20 = [NSNumber numberWithDouble:a3];
    [v18 setObject:v20 forKey:@"Adjusted time key"];

    id v21 = objc_loadWeakRetained((id *)(a1 + 56));
    double v22 = [v21 stateMachine];
    [v22 postEvent:*(void *)(a1 + 40) withContext:0 userInfo:v18];

    id v23 = objc_loadWeakRetained((id *)(a1 + 56));
    [v23 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_9:
    id v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToSeekToTime response", (uint8_t *)&v24, 2u);
    }
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_752(uint64_t a1, id *a2, char a3, void *a4, void *a5, unsigned char *a6)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v37 = a4;
  id v11 = a5;
  id v12 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v14 = [WeakRetained delegate];

  id v15 = objc_loadWeakRetained(v12);
  id v16 = [v15 asyncDelegate];

  if (a6) {
    *a6 = 0;
  }
  id v17 = objc_loadWeakRetained(v12);
  id v18 = [v17 seekableDateRange];

  if (v18)
  {
    id v19 = [v18 startDate];

    if (v19)
    {
      id v20 = [v18 startDate];
      id v21 = [v20 dateByAddingTimeInterval:10.0];

      *a2 = [*a2 laterDate:v21];
    }
  }
  if (a3) {
    goto LABEL_7;
  }
  if (v14)
  {
    id v23 = objc_loadWeakRetained(v12);
    uint64_t v22 = [v14 player:v23 shouldSeekToTime:0 playbackDate:a2];

    goto LABEL_27;
  }
  if (!v16)
  {
LABEL_7:
    uint64_t v22 = 1;
  }
  else
  {
    int v24 = [v11 objectForKey:@"Async delegate response key"];
    if (v24)
    {
      id v25 = [v11 objectForKey:@"Adjusted date key"];
      __int16 v26 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        double v27 = v26;
        int v28 = [v24 BOOLValue];
        BOOL v29 = @"NO";
        if (v28) {
          BOOL v29 = @"YES";
        }
        *(_DWORD *)CMTimeRange buf = 138412546;
        CMTime v45 = v29;
        __int16 v46 = 2112;
        id v47 = v25;
        _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate returning saved delegate response of %@, %@", buf, 0x16u);
      }
      uint64_t v30 = [v24 BOOLValue];
      uint64_t v22 = v30;
      if (v25) {
        int v31 = v30;
      }
      else {
        int v31 = 0;
      }
      if (v31 == 1)
      {
        id v25 = v25;
        *a2 = v25;
      }
    }
    else
    {
      int v32 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v32, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate returning NO until delegate is consulted", buf, 2u);
      }
      if (a6) {
        *a6 = 1;
      }
      id v25 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)buf, v25);
      id v33 = *a2;
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_753;
      v38[3] = &unk_264CC5EB0;
      objc_copyWeak(&v42, v12);
      id v34 = v33;
      id v39 = v34;
      objc_copyWeak(&v43, (id *)buf);
      id v40 = v11;
      id v41 = v37;
      [(TVPAsyncPlayerDelegateOperation *)v25 setBlock:v38];
      id v35 = objc_loadWeakRetained(v12);
      [v35 _enqueueAsyncDelegateOperation:v25];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);

      objc_destroyWeak((id *)buf);
      uint64_t v22 = 0;
    }
  }
LABEL_27:

  return v22;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_753(id *a1)
{
  int v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate calling delegate", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  long long v4 = [WeakRetained asyncDelegate];
  id v5 = objc_loadWeakRetained(a1 + 7);
  id v6 = a1[4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_754;
  v7[3] = &unk_264CC5E88;
  objc_copyWeak(&v11, a1 + 8);
  objc_copyWeak(&v12, a1 + 7);
  id v8 = a1[5];
  id v9 = a1[4];
  id v10 = a1[6];
  [v4 player:v5 shouldSeekToDate:v6 completion:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_754(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = [v7 asyncDelegateOperations];
  id v9 = [v8 firstObject];
  int v10 = [v9 isEqual:WeakRetained];

  if (v10)
  {
    id v11 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = @"NO";
      if (a2) {
        id v12 = @"YES";
      }
      int v25 = 138412546;
      __int16 v26 = v12;
      __int16 v27 = 2112;
      id v28 = v5;
      _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate response: %@, %@", (uint8_t *)&v25, 0x16u);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 64));
    id v14 = [v13 asyncDelegateOperations];
    [v14 removeObjectAtIndex:0];

    id v15 = *(void **)(a1 + 32);
    if (v15) {
      id v16 = (id)[v15 mutableCopy];
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v18 = v16;
    id v19 = v5;
    if (!v5) {
      id v19 = *(void **)(a1 + 40);
    }
    id v20 = v19;
    id v21 = [NSNumber numberWithBool:a2];
    [v18 setObject:v21 forKey:@"Async delegate response key"];

    if (v20) {
      [v18 setObject:v20 forKey:@"Adjusted date key"];
    }
    id v22 = objc_loadWeakRetained((id *)(a1 + 64));
    id v23 = [v22 stateMachine];
    [v23 postEvent:*(void *)(a1 + 48) withContext:0 userInfo:v18];

    id v24 = objc_loadWeakRetained((id *)(a1 + 64));
    [v24 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_9:
    id v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToSeekToDate response", (uint8_t *)&v25, 2u);
    }
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_757(uint64_t a1, void *a2, void *a3, unsigned char *a4, double a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v13 = [WeakRetained delegate];

  id v14 = objc_loadWeakRetained(v11);
  id v15 = [v14 asyncDelegate];

  if (a4) {
    *a4 = 0;
  }
  if (v13)
  {
    id v16 = objc_loadWeakRetained(v11);
    uint64_t v17 = [v13 player:v16 shouldScanAtRate:a5];
  }
  else if (v15)
  {
    id v18 = [v10 objectForKey:@"Async delegate response key"];
    id v19 = sPlayerLogObject;
    BOOL v20 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        id v21 = v19;
        int v22 = [v18 BOOLValue];
        id v23 = @"NO";
        if (v22) {
          id v23 = @"YES";
        }
        *(_DWORD *)CMTimeRange buf = 138412290;
        id v33 = v23;
        _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan returning saved delegate response of %@", buf, 0xCu);
      }
      uint64_t v17 = [v18 BOOLValue];
    }
    else
    {
      if (v20)
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan returning NO until delegate is consulted", buf, 2u);
      }
      if (a4) {
        *a4 = 1;
      }
      id v24 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)buf, v24);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      void v27[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_758;
      v27[3] = &unk_264CC5E38;
      objc_copyWeak(&v30, v11);
      v31[1] = *(id *)&a5;
      objc_copyWeak(v31, (id *)buf);
      id v28 = v10;
      id v29 = v9;
      [(TVPAsyncPlayerDelegateOperation *)v24 setBlock:v27];
      id v25 = objc_loadWeakRetained(v11);
      [v25 _enqueueAsyncDelegateOperation:v24];

      objc_destroyWeak(v31);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);

      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 1;
  }

  return v17;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_758(uint64_t a1)
{
  int v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan calling delegate", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v4 = [WeakRetained asyncDelegate];
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  double v6 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_759;
  v7[3] = &unk_264CC5F00;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v4 player:v5 shouldScanAtRate:v7 completion:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_759(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  double v6 = [v5 asyncDelegateOperations];
  id v7 = [v6 firstObject];
  int v8 = [v7 isEqual:WeakRetained];

  if (v8)
  {
    id v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      if (a2) {
        id v10 = @"YES";
      }
      int v21 = 138412290;
      int v22 = v10;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan response: %@", (uint8_t *)&v21, 0xCu);
    }
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    id v12 = [v11 asyncDelegateOperations];
    [v12 removeObjectAtIndex:0];

    id v13 = *(void **)(a1 + 32);
    if (v13) {
      id v14 = (id)[v13 mutableCopy];
    }
    else {
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v16 = v14;
    uint64_t v17 = [NSNumber numberWithBool:a2];
    [v16 setObject:v17 forKey:@"Async delegate response key"];

    id v18 = objc_loadWeakRetained((id *)(a1 + 56));
    id v19 = [v18 stateMachine];
    [v19 postEvent:*(void *)(a1 + 40) withContext:0 userInfo:v16];

    id v20 = objc_loadWeakRetained((id *)(a1 + 56));
    [v20 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_9:
    id v15 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToScan response", (uint8_t *)&v21, 2u);
    }
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_761(uint64_t a1, char a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v13 = [WeakRetained delegate];

  id v14 = objc_loadWeakRetained(v11);
  id v15 = [v14 asyncDelegate];

  if (a5) {
    *a5 = 0;
  }
  if (a2) {
    goto LABEL_4;
  }
  if (v13)
  {
    id v17 = objc_loadWeakRetained(v11);
    uint64_t v16 = [v13 playerShouldPause:v17];

    goto LABEL_20;
  }
  if (!v15)
  {
LABEL_4:
    uint64_t v16 = 1;
  }
  else
  {
    id v18 = [v10 objectForKey:@"Async delegate response key"];
    id v19 = sPlayerLogObject;
    BOOL v20 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        int v21 = v19;
        int v22 = [v18 BOOLValue];
        uint64_t v23 = @"NO";
        if (v22) {
          uint64_t v23 = @"YES";
        }
        *(_DWORD *)CMTimeRange buf = 138412290;
        CMTime v36 = v23;
        _os_log_impl(&dword_236FC5000, v21, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause returning saved delegate response of %@", buf, 0xCu);
      }
      uint64_t v16 = [v18 BOOLValue];
    }
    else
    {
      if (v20)
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause returning NO until delegate is consulted", buf, 2u);
      }
      if (a5) {
        *a5 = 1;
      }
      id v24 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)buf, v24);
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      id v29 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_762;
      id v30 = &unk_264CC5F50;
      objc_copyWeak(&v33, v11);
      objc_copyWeak(&v34, (id *)buf);
      id v31 = v10;
      id v32 = v9;
      [(TVPAsyncPlayerDelegateOperation *)v24 setBlock:&v27];
      id v25 = objc_loadWeakRetained(v11);
      objc_msgSend(v25, "_enqueueAsyncDelegateOperation:", v24, v27, v28, v29, v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);

      uint64_t v16 = 0;
    }
  }
LABEL_20:

  return v16;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_762(id *a1)
{
  int v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause calling delegate", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  long long v4 = [WeakRetained asyncDelegate];
  id v5 = objc_loadWeakRetained(a1 + 6);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_763;
  v6[3] = &unk_264CC5F00;
  objc_copyWeak(&v9, a1 + 7);
  objc_copyWeak(&v10, a1 + 6);
  id v7 = a1[4];
  id v8 = a1[5];
  [v4 player:v5 shouldPauseWithCompletion:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_763(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  double v6 = [v5 asyncDelegateOperations];
  id v7 = [v6 firstObject];
  int v8 = [v7 isEqual:WeakRetained];

  if (v8)
  {
    id v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      if (a2) {
        id v10 = @"YES";
      }
      int v21 = 138412290;
      int v22 = v10;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause response: %@", (uint8_t *)&v21, 0xCu);
    }
    id v11 = objc_loadWeakRetained((id *)(a1 + 56));
    id v12 = [v11 asyncDelegateOperations];
    [v12 removeObjectAtIndex:0];

    id v13 = *(void **)(a1 + 32);
    if (v13) {
      id v14 = (id)[v13 mutableCopy];
    }
    else {
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v16 = v14;
    id v17 = [NSNumber numberWithBool:a2];
    [v16 setObject:v17 forKey:@"Async delegate response key"];

    id v18 = objc_loadWeakRetained((id *)(a1 + 56));
    id v19 = [v18 stateMachine];
    [v19 postEvent:*(void *)(a1 + 40) withContext:0 userInfo:v16];

    id v20 = objc_loadWeakRetained((id *)(a1 + 56));
    [v20 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_9:
    id v15 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToPause response", (uint8_t *)&v21, 2u);
    }
  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_765(uint64_t a1, char a2, CMTime *a3, unsigned char *a4, void *a5, void *a6, unsigned char *a7)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  id v15 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v17 = [WeakRetained delegate];

  id v18 = objc_loadWeakRetained(v15);
  id v19 = [v18 asyncDelegate];

  if (a7) {
    *a7 = 0;
  }
  if (a2) {
    goto LABEL_4;
  }
  if (v17)
  {
    CMTime time = *a3;
    double v21 = CMTimeGetSeconds(&time);
    Float64 seconds = v21;
    id v22 = objc_loadWeakRetained(v15);
    uint64_t v20 = [v17 playerShouldPlay:v22 timeFromWhichToPlay:&seconds];

    if (vabdd_f64(seconds, v21) > 0.01)
    {
      CMTimeMakeWithSeconds(&time, seconds, 1000000);
      *a3 = time;
      if (a4) {
        *a4 = 1;
      }
    }
  }
  else
  {
    if (!v19)
    {
LABEL_4:
      uint64_t v20 = 1;
      goto LABEL_27;
    }
    uint64_t v23 = [v14 objectForKey:@"Async delegate response key"];
    if (v23)
    {
      id v24 = [v14 objectForKey:@"Adjusted time key"];
      id v25 = [v14 objectForKey:@"Original time key"];
      __int16 v26 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = v26;
        int v28 = [v23 BOOLValue];
        id v29 = @"NO";
        if (v28) {
          id v29 = @"YES";
        }
        LODWORD(time.value) = 138412546;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v29;
        LOWORD(time.flags) = 2112;
        *(void *)((char *)&time.flags + 2) = v24;
        _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay returning saved delegate response of %@, %@", (uint8_t *)&time, 0x16u);
      }
      uint64_t v20 = [v23 BOOLValue];
      if (v24)
      {
        if (v25)
        {
          [(TVPAsyncPlayerDelegateOperation *)v24 doubleValue];
          double v31 = v30;
          [v25 doubleValue];
          if (vabdd_f64(v31, v32) > 0.01)
          {
            [(TVPAsyncPlayerDelegateOperation *)v24 doubleValue];
            CMTimeMakeWithSeconds(&time, v33, 1000000);
            *a3 = time;
            if (a4) {
              *a4 = 1;
            }
          }
        }
      }
    }
    else
    {
      id v34 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(time.value) = 0;
        _os_log_impl(&dword_236FC5000, v34, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay returning NO until delegate is consulted", (uint8_t *)&time, 2u);
      }
      if (a7) {
        *a7 = 1;
      }
      id v24 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)&time, v24);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_766;
      void v37[3] = &unk_264CC5F50;
      objc_copyWeak(&v40, v15);
      objc_copyWeak(&v41, (id *)&time);
      id v38 = v14;
      id v39 = v13;
      [(TVPAsyncPlayerDelegateOperation *)v24 setBlock:v37];
      id v35 = objc_loadWeakRetained(v15);
      [v35 _enqueueAsyncDelegateOperation:v24];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)&time);
      uint64_t v20 = 0;
    }
  }
LABEL_27:

  return v20;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_766(id *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained elapsedTime];
  id v5 = v4;

  double v6 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTimeRange buf = 134217984;
    uint64_t v16 = v5;
    _os_log_impl(&dword_236FC5000, v6, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay calling delegate with proposed time of %f", buf, 0xCu);
  }
  id v7 = objc_loadWeakRetained(v2);
  int v8 = [v7 asyncDelegate];
  id v9 = objc_loadWeakRetained(v2);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_767;
  v10[3] = &unk_264CC5FA0;
  objc_copyWeak(&v13, a1 + 7);
  objc_copyWeak(v14, v2);
  id v11 = a1[4];
  v14[1] = v5;
  id v12 = a1[5];
  [v8 player:v9 shouldPlayFromTime:v10 completion:*(double *)&v5];

  objc_destroyWeak(v14);
  objc_destroyWeak(&v13);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_767(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  int v8 = [v7 asyncDelegateOperations];
  id v9 = [v8 firstObject];
  int v10 = [v9 isEqual:WeakRetained];

  if (v10)
  {
    id v11 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = @"NO";
      if (a2) {
        id v12 = @"YES";
      }
      int v25 = 138412546;
      __int16 v26 = v12;
      __int16 v27 = 2048;
      double v28 = a3;
      _os_log_impl(&dword_236FC5000, v11, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay response: %@, %f", (uint8_t *)&v25, 0x16u);
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 56));
    id v14 = [v13 asyncDelegateOperations];
    [v14 removeObjectAtIndex:0];

    id v15 = *(void **)(a1 + 32);
    if (v15) {
      id v16 = (id)[v15 mutableCopy];
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    id v18 = v16;
    id v19 = [NSNumber numberWithBool:a2];
    [v18 setObject:v19 forKey:@"Async delegate response key"];

    uint64_t v20 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    [v18 setObject:v20 forKey:@"Original time key"];

    double v21 = [NSNumber numberWithDouble:a3];
    [v18 setObject:v21 forKey:@"Adjusted time key"];

    id v22 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v23 = [v22 stateMachine];
    [v23 postEvent:*(void *)(a1 + 40) withContext:0 userInfo:v18];

    id v24 = objc_loadWeakRetained((id *)(a1 + 56));
    [v24 _processNextAsyncDelegateOperation];
  }
  else
  {
LABEL_9:
    uint64_t v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToPlay response", (uint8_t *)&v25, 2u);
    }
  }
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_769(uint64_t a1, long long *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = (id *)(a1 + 40);
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained setPostLoadingState:v10];

  id v13 = objc_loadWeakRetained(v9);
  id v14 = [v13 AVQueuePlayer];
  [v14 setResourceConservationLevelWhilePaused:0];

  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = +[TVPPlaybackState loading];
  uint64_t v17 = *(void (**)(uint64_t, long long *, id, long long *, void *, uint64_t, double))(v15 + 16);
  long long v24 = *a2;
  uint64_t v25 = *((void *)a2 + 2);
  long long v22 = *MEMORY[0x263F010E0];
  uint64_t v23 = *(void *)(MEMORY[0x263F010E0] + 16);
  v17(v15, &v24, v11, &v22, v16, a5, 0.0);

  id v18 = objc_loadWeakRetained(v9);
  id v19 = [v18 externalImagePlayer];
  [v19 invalidate];

  id v20 = objc_loadWeakRetained(v9);
  [v20 setExternalImagePlayer:0];

  return @"Waiting for seek";
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_771(uint64_t a1, long long *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  id v14 = a3;
  id v46 = a5;
  id v48 = a6;
  id v47 = a7;
  uint64_t v15 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v17 = [WeakRetained usesLegacyDelegateBehavior];

  id v18 = objc_loadWeakRetained((id *)(a1 + 64));
  id v19 = [v18 stateMachine];
  id v20 = [v19 currentState];

  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = v21;
  if (a9) {
    *a9 = v21;
  }
  if (!v17)
  {
    id v29 = +[TVPPlaybackState playing];

    if (v29 == v46)
    {
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
      {
        if (v14)
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          id v25 = v14;

          id v35 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
          long long v49 = *a2;
          uint64_t v50 = *((void *)a2 + 2);
          __int16 v27 = v46;
          uint64_t v32 = v35();
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v38 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
          long long v49 = *a2;
          uint64_t v50 = *((void *)a2 + 2);
          __int16 v27 = v46;
          uint64_t v32 = v38();
          id v25 = 0;
        }

        long long v49 = *a2;
        uint64_t v50 = *((void *)a2 + 2);
        id v39 = [MEMORY[0x263F08D40] valueWithCMTime:&v49];
        [v22 setObject:v39 forKey:@"Elapsed CMTime key"];

        goto LABEL_25;
      }
    }
    else
    {
      id v30 = +[TVPPlaybackState paused];

      if (v30 == v46)
      {
        if (v14)
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          id v25 = v14;

          double v31 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
          long long v49 = *a2;
          uint64_t v50 = *((void *)a2 + 2);
          __int16 v27 = v46;
          uint64_t v32 = v31();
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          uint64_t v37 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
          long long v49 = *a2;
          uint64_t v50 = *((void *)a2 + 2);
          __int16 v27 = v46;
          uint64_t v32 = v37();

          id v25 = 0;
        }
LABEL_25:
        id v20 = (void *)v32;
        goto LABEL_26;
      }
    }
    id v25 = v14;
    __int16 v27 = v46;
    goto LABEL_26;
  }
  if (!v14)
  {
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
    {
      Float64 v33 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      long long v49 = *a2;
      uint64_t v50 = *((void *)a2 + 2);
      __int16 v27 = v46;
      uint64_t v34 = v33();

      id v20 = (void *)v34;
    }
    else
    {
      __int16 v27 = v46;
    }
    long long v49 = *a2;
    uint64_t v50 = *((void *)a2 + 2);
    CMTime v36 = [MEMORY[0x263F08D40] valueWithCMTime:&v49];
    [v22 setObject:v36 forKey:@"Elapsed CMTime key"];

    id v25 = 0;
    goto LABEL_26;
  }
  uint64_t v23 = *(void *)(a1 + 32);
  id v51 = v14;
  int v24 = (*(uint64_t (**)(void))(v23 + 16))();
  id v25 = v14;

  if (!v24)
  {
    __int16 v27 = v46;
    if (!v25) {
      goto LABEL_26;
    }
    goto LABEL_19;
  }
  __int16 v26 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  long long v49 = *a2;
  uint64_t v50 = *((void *)a2 + 2);
  __int16 v27 = v46;
  uint64_t v28 = v26();

  id v20 = (void *)v28;
  if (v25) {
LABEL_19:
  }
    [v22 setObject:v25 forKey:@"Playback date key"];
LABEL_26:
  id v40 = objc_loadWeakRetained(v15);
  id v41 = [v40 stateMachine];
  id v42 = [v41 currentState];
  uint64_t v43 = [v20 isEqualToString:v42] ^ 1;

  uint64_t v44 = [NSNumber numberWithBool:v43];
  [v22 setObject:v44 forKey:@"Allowed key"];

  return v20;
}

TVPMutableChapterCollection *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_773(uint64_t a1, void *a2)
{
  v30[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 asset];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [MEMORY[0x263EFF960] preferredLanguages];
  double v6 = [v5 firstObject];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v8 = [WeakRetained selectedAudioOption];
  id v9 = [v8 languageCodeBCP47];

  if (v6) {
    [v4 addObject:v6];
  }
  if (v9) {
    [v4 addObject:v9];
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v3 statusOfValueForKey:@"availableChapterLocales" error:0] == 2)
  {
    id v11 = [v3 chapterMetadataGroupsBestMatchingPreferredLanguages:v4];
    int v24 = v3;
    if (![v11 count])
    {
      id v12 = [v3 availableChapterLocales];
      id v13 = [v12 firstObject];

      if (v13)
      {
        v30[0] = *MEMORY[0x263EF9D90];
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
        uint64_t v15 = [v3 chapterMetadataGroupsWithTitleLocale:v13 containingItemsWithCommonKeys:v14];

        id v11 = (void *)v15;
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [[TVPAVTimedMetadataGroupChapter alloc] initWithAVTimedMetadataGroup:*(void *)(*((void *)&v25 + 1) + 8 * i) filterByLanguages:v4];
          [v10 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v18);
    }

    uint64_t v3 = v24;
  }
  if ([v10 count])
  {
    long long v22 = objc_alloc_init(TVPMutableChapterCollection);
    [(TVPChapterCollection *)v22 setChapters:v10];
    [(TVPChapterCollection *)v22 setType:0];
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

TVPMutableChapterCollection *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_780(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  memset(&v39, 0, sizeof(v39));
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained cachedDuration];
  }
  else {
    memset(&v39, 0, sizeof(v39));
  }

  if ((v39.flags & 0x1D) == 1)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 currentMediaItem];
    double v6 = [v5 mediaItemMetadataForProperty:@"TVPMediaItemMetadataInterstitialCollection"];

    CMTime time = v39;
    double Seconds = CMTimeGetSeconds(&time);
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v6)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = objc_msgSend(v6, "interstitialsWithAdjacentsMerged", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v35;
        double v13 = 0.0;
        do
        {
          uint64_t v14 = 0;
          double v15 = v13;
          do
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            id v16 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
            uint64_t v17 = [v16 timeRange];
            [v17 endTime];
            double v13 = v18;

            if (v15 != 0.0
              || ([v16 timeRange],
                  uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                  [v19 startTime],
                  double v21 = v20,
                  v19,
                  v21 != 0.0))
            {
              long long v22 = objc_alloc_init(TVPMutableChapter);
              uint64_t v23 = [[TVPTimeRange alloc] initWithStartTime:v15 endTime:v13];
              [(TVPChapter *)v22 setTimeRange:v23];
              [v8 addObject:v22];
            }
            ++v14;
            double v15 = v13;
          }
          while (v11 != v14);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v11);
      }
      else
      {
        double v13 = 0.0;
      }

      if (v13 < Seconds)
      {
        double v31 = objc_alloc_init(TVPMutableChapter);
        uint64_t v32 = [[TVPTimeRange alloc] initWithStartTime:v13 endTime:Seconds];
        [(TVPChapter *)v31 setTimeRange:v32];
        [v8 addObject:v31];
      }
    }
    else
    {
      if (Seconds / 20.0 >= 30.0) {
        double v25 = Seconds / 20.0;
      }
      else {
        double v25 = 30.0;
      }
      if (Seconds > 0.0)
      {
        double v26 = 0.0;
        do
        {
          double v27 = v25 + v26;
          if (v25 + v26 <= Seconds) {
            double v28 = v25 + v26;
          }
          else {
            double v28 = Seconds;
          }
          id v29 = objc_alloc_init(TVPMutableChapter);
          id v30 = [[TVPTimeRange alloc] initWithStartTime:v26 endTime:v28];
          [(TVPChapter *)v29 setTimeRange:v30];
          [v8 addObject:v29];

          double v26 = v25 + v26;
        }
        while (v27 < Seconds);
      }
    }
    if ([v8 count])
    {
      int v24 = objc_alloc_init(TVPMutableChapterCollection);
      [(TVPChapterCollection *)v24 setChapters:v8];
      [(TVPChapterCollection *)v24 setType:1];
    }
    else
    {
      int v24 = 0;
    }
  }
  else
  {
    int v24 = 0;
  }
  return v24;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_783(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCurrentPlayerItem:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setPlayerItemFromCacheManager:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setAVQueuePlayer:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setHaveEverEnqueuedPlayerItem:0];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setEarlyAVQueuePlayer:0];

  id v7 = objc_loadWeakRetained(v1);
  id v8 = [v7 externalImagePlayer];
  [v8 invalidate];

  id v9 = objc_loadWeakRetained(v1);
  [v9 setExternalImagePlayer:0];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = objc_loadWeakRetained(v1);
  uint64_t v11 = [v10 mediaItemLoaders];
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v52;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
        id v17 = objc_loadWeakRetained(v1);
        [v17 _removeObserversForMediaItemLoader:v16];

        [v16 cleanupIfNecessary];
        id v18 = objc_loadWeakRetained(v1);
        uint64_t v19 = [v18 mediaItemLoaders];
        [v19 removeObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v13);
  }

  id v20 = objc_loadWeakRetained(v1);
  double v21 = +[TVPPlaybackState playing];
  [v20 setPostLoadingState:v21];

  id v22 = objc_loadWeakRetained(v1);
  long long v49 = *MEMORY[0x263F010E0];
  long long v46 = v49;
  uint64_t v50 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v23 = v50;
  [v22 setTimeBeingSeekedTo:&v49];

  id v24 = objc_loadWeakRetained(v1);
  long long v49 = v46;
  uint64_t v50 = v23;
  [v24 setTimeAtStartOfSeek:&v49];

  id v25 = objc_loadWeakRetained(v1);
  [v25 setPlaybackDateAtStartOfSeek:0];

  id v26 = objc_loadWeakRetained(v1);
  [v26 setDateBeingSeekedTo:0];

  id v27 = objc_loadWeakRetained(v1);
  [v27 setLoadingInitialItemInPlaylist:1];

  id v28 = objc_loadWeakRetained(v1);
  [v28 setInitialMediaItemHasCompletedInitialLoading:0];

  id v29 = objc_loadWeakRetained(v1);
  [v29 setCurrentDirectionOfPlaylistChange:0];

  id v30 = objc_loadWeakRetained(v1);
  [v30 setCurrentMediaItemVideoRange:0];

  id v31 = objc_loadWeakRetained(v1);
  [v31 setCurrentMediaItemAudioFormat:0];

  id v32 = objc_loadWeakRetained(v1);
  [v32 setCurrentMediaItemAudioChannels:-1];

  id v33 = objc_loadWeakRetained(v1);
  long long v49 = v46;
  uint64_t v50 = v23;
  [v33 setCachedElapsedCMTime:&v49];

  id v34 = objc_loadWeakRetained(v1);
  long long v35 = [v34 progressiveJumpingScrubber];
  [v35 cancelScrub];

  id v36 = objc_loadWeakRetained(v1);
  [v36 setProgressiveJumpingScrubber:0];

  id v37 = objc_loadWeakRetained(v1);
  [v37 setMediaItemChangeReason:0];

  id v38 = objc_loadWeakRetained(v1);
  [v38 setSceneCompletelyBuffered:0];

  id v39 = objc_loadWeakRetained(v1);
  id v40 = [v39 asyncDelegateOperations];
  [v40 removeAllObjects];

  id v41 = objc_loadWeakRetained(v1);
  [v41 setTemporarySubtitleOverrideType:0];

  id v42 = objc_loadWeakRetained(v1);
  [v42 setUnqueuedPlayerItem:0];

  id v43 = objc_loadWeakRetained(v1);
  [v43 setPlayerItemChangeIsHappening:0];

  id v44 = objc_loadWeakRetained(v1);
  CMTime v45 = [v44 stateMachine];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_784;
  void v47[3] = &unk_264CC5600;
  objc_copyWeak(&v48, v1);
  [v45 executeBlockAfterCurrentStateTransition:v47];

  objc_destroyWeak(&v48);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_784(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setWaitsAfterPreparingMediaItems:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setCurrentMediaItemInitialLoadingComplete:0];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setCurrentMediaItemHasVideoContent:0];

  id v5 = objc_loadWeakRetained(v1);
  [v5 setCurrentMediaItemIsStreaming:0];

  id v6 = objc_loadWeakRetained(v1);
  [v6 setIsLive:0];

  id v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "setCurrentMediaItemPresentationSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

  id v8 = objc_loadWeakRetained(v1);
  [v8 setCurrentMediaItemHasDates:0];

  id v9 = objc_loadWeakRetained(v1);
  [v9 setNumOutstandingSeeks:0];

  id v10 = objc_loadWeakRetained(v1);
  long long v25 = *MEMORY[0x263F01090];
  uint64_t v26 = *(void *)(MEMORY[0x263F01090] + 16);
  [v10 setCachedDuration:&v25];

  id v11 = objc_loadWeakRetained(v1);
  [v11 setCachedLoadedTimeRanges:0];

  id v12 = objc_loadWeakRetained(v1);
  [v12 setCachedSeekableTimeRanges:0];

  id v13 = objc_loadWeakRetained(v1);
  [v13 setChapterCollections:0];

  id v14 = objc_loadWeakRetained(v1);
  [v14 setCurrentChapterCollection:0];

  id v15 = objc_loadWeakRetained(v1);
  [v15 setCurrentChapter:0];

  id v16 = objc_loadWeakRetained(v1);
  [v16 setCurrentInterstitialCollection:0];

  id v17 = objc_loadWeakRetained(v1);
  [v17 setCurrentInterstitial:0];

  id v18 = objc_loadWeakRetained(v1);
  [v18 setAudioOptions:0];

  id v19 = objc_loadWeakRetained(v1);
  [v19 setSubtitleOptions:0];

  id v20 = objc_loadWeakRetained(v1);
  [v20 setCachedSelectedAudioOption:0];

  id v21 = objc_loadWeakRetained(v1);
  [v21 willChangeValueForKey:@"selectedAudioOption"];

  id v22 = objc_loadWeakRetained(v1);
  [v22 didChangeValueForKey:@"selectedAudioOption"];

  id v23 = objc_loadWeakRetained(v1);
  [v23 willChangeValueForKey:@"selectedSubtitleOption"];

  id v24 = objc_loadWeakRetained(v1);
  [v24 didChangeValueForKey:@"selectedSubtitleOption"];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_785(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = 40;
  if (a2) {
    uint64_t v5 = 32;
  }
  (*(void (**)(void))(*(void *)(a1 + v5) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = +[TVPPlaybackState stopped];
  [WeakRetained _setState:v7 updatedRate:v9 reason:1 notifyListeners:0.0];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8) {
    [(id)objc_opt_class() _playerDidBecomeInactive:v8];
  }
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_787(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained playlist];
  [v5 endAction];

  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = [v6 playlist];
  uint64_t v8 = [v7 endAction];

  if (v8 == 2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = objc_loadWeakRetained((id *)(a1 + 56));
    [v9 setPostLoadingState:v3];

    id v10 = objc_loadWeakRetained((id *)(a1 + 56));
    id v11 = +[TVPPlaybackState loading];
    [v10 _setState:v11 updatedRate:1 notifyListeners:0.0];

    id v12 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_788;
    v24[3] = &unk_264CC5600;
    id v13 = &v25;
    objc_copyWeak(&v25, (id *)(a1 + 56));
    [v12 executeBlockAfterCurrentStateTransition:v24];
    id v14 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10;
    v22[3] = &unk_264CC5600;
    objc_copyWeak(&v23, (id *)(a1 + 56));
    [v14 executeBlockAfterCurrentStateTransition:v22];
    objc_destroyWeak(&v23);
    id v15 = @"Waiting for more playlist items";
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11;
    v20[3] = &unk_264CC5600;
    id v13 = &v21;
    objc_copyWeak(&v21, (id *)(a1 + 56));
    [v16 executeBlockAfterCurrentStateTransition:v20];
    id v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Stopping because the end of the playlist has been reached", v19, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v15 = @"Stopped";
  }
  objc_destroyWeak(v13);

  return v15;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_788(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = *MEMORY[0x263F010E0];
  uint64_t v3 = *(void *)(MEMORY[0x263F010E0] + 16);
  [WeakRetained _notifyListenersOfElapsedTimeChange:&v2 playbackDate:0 dueToTimeJump:1];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackPlaylistDidFinishNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackPlaylistDidFinishNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_790(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained playlist];
  id v6 = [v5 currentMediaItem];

  id v7 = objc_loadWeakRetained(v3);
  uint64_t v8 = [v7 playlist];
  long long v54 = [v8 nextMediaItem];

  if (a2)
  {
    if (a2 == 1)
    {
      if (v54)
      {
        if (([v54 hasTrait:@"TVPMediaItemTraitOptimizeForHighLatency"] & 1) == 0
          && ([v54 hasTrait:@"TVPMediaItemTraitPreventSpeculativeLoading"] & 1) == 0)
        {
          id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
          char v10 = [v9 BOOLForKey:@"DisableSpeculativeLoading"];

          if ((v10 & 1) == 0)
          {
            id v11 = v54;
            goto LABEL_9;
          }
        }
      }
    }
  }
  else
  {
    id v11 = v6;
    if (v11)
    {
LABEL_9:
      long long v53 = +[TVPMediaItemLoader loaderForMediaItem:](TVPMediaItemLoader, "loaderForMediaItem:", v11, v11);
      id v12 = objc_loadWeakRetained(v3);
      objc_msgSend(v53, "setAllowsCellularUsage:", objc_msgSend(v12, "allowsCellularUsage"));

      id v13 = objc_loadWeakRetained(v3);
      objc_msgSend(v53, "setAllowsConstrainedNetworkUsage:", objc_msgSend(v13, "allowsConstrainedNetworkUsage"));

      id v14 = [v53 state];
      int v15 = [v14 isEqualToString:0x26EA15E78];

      int v51 = v15;
      if (v15) {
        [v53 cleanupIfNecessary];
      }
      id v16 = objc_loadWeakRetained(v3);
      id v17 = [v16 mediaItemLoaders];
      char v18 = [v17 containsObject:v53];

      if ((v18 & 1) == 0)
      {
        id v19 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = @"next";
          if (!a2) {
            id v20 = @"current";
          }
          *(_DWORD *)CMTimeRange buf = 138412546;
          uint64_t v67 = v20;
          __int16 v68 = 2112;
          CMTimeFlags v69 = v53;
          _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Loading %@ media item: %@", buf, 0x16u);
        }
        id v21 = objc_loadWeakRetained(v3);
        id v22 = [v21 mediaItemLoaders];
        [v22 addObject:v53];

        id v23 = objc_loadWeakRetained(v3);
        [v23 _addObserversForMediaItemLoader:v53];

        int v51 = 1;
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v24 = objc_loadWeakRetained(v3);
      id v25 = [v24 mediaItemLoaders];
      uint64_t v26 = (void *)[v25 copy];

      uint64_t v27 = [v26 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v62 != v28) {
              objc_enumerationMutation(v26);
            }
            id v30 = *(__CFString **)(*((void *)&v61 + 1) + 8 * i);
            id v31 = [(__CFString *)v30 mediaItem];
            if (([v31 isEqualToMediaItem:v6] & 1) == 0)
            {
              id v32 = [(__CFString *)v30 mediaItem];
              char v33 = [v32 isEqualToMediaItem:v54];

              if (v33) {
                continue;
              }
              id v34 = sPlayerLogObject;
              if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CMTimeRange buf = 138412290;
                uint64_t v67 = v30;
                _os_log_impl(&dword_236FC5000, v34, OS_LOG_TYPE_DEFAULT, "Cleaning up media item loader that is no longer in use: %@", buf, 0xCu);
              }
              id v35 = objc_loadWeakRetained(v3);
              [v35 _removeObserversForMediaItemLoader:v30];

              [(__CFString *)v30 cleanupIfNecessary];
              id v31 = objc_loadWeakRetained(v3);
              id v36 = [v31 mediaItemLoaders];
              [v36 removeObject:v30];
            }
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v61 objects:v65 count:16];
        }
        while (v27);
      }

      id v37 = [v53 state];
      id v38 = TVPPlaybackReportingHLSPlaylistPreloadStateNone;
      if ([v37 isEqualToString:0x26EA1A398])
      {
        id v39 = &TVPPlaybackReportingHLSPlaylistPreloadStatePartial;
      }
      else
      {
        if (([v37 isEqualToString:0x26EA1A3B8] & 1) == 0
          && ([v37 isEqualToString:0x26EA1A3D8] & 1) == 0
          && ![v37 isEqualToString:0x26EA1A3F8])
        {
LABEL_37:
          id v41 = objc_loadWeakRetained(v3);
          id v42 = [v41 currentMediaItem];
          id v43 = [v42 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
          [v43 addSingleShotEventWithName:TVPPlaybackReportingEventHLSPlaylistPreloadState value:v38];

          if (v51) {
            [v53 loadIfNecessary];
          }
          id v44 = [v53 state];
          if ([v44 isEqualToString:0x26EA1A358]) {
            goto LABEL_44;
          }
          if (([v44 isEqualToString:0x26EA1A378] & 1) != 0
            || [v44 isEqualToString:0x26EA1A398])
          {
            CMTime v45 = *(void **)(a1 + 32);
            long long v46 = v59;
            v59[0] = MEMORY[0x263EF8330];
            v59[1] = 3221225472;
            v59[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_800;
            v59[3] = &unk_264CC5750;
            v59[4] = v53;
            id v47 = &v60;
            objc_copyWeak(&v60, v3);
            [v45 executeBlockAfterCurrentStateTransition:v59];
          }
          else if (([v44 isEqualToString:0x26EA1A3B8] & 1) != 0 {
                 || [v44 isEqualToString:0x26EA1A3D8])
          }
          {
            id v48 = *(void **)(a1 + 32);
            long long v46 = v57;
            v57[0] = MEMORY[0x263EF8330];
            v57[1] = 3221225472;
            v57[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_801;
            v57[3] = &unk_264CC5750;
            v57[4] = v53;
            id v47 = &v58;
            objc_copyWeak(&v58, v3);
            [v48 executeBlockAfterCurrentStateTransition:v57];
          }
          else
          {
            if (![v44 isEqualToString:0x26EA1A3F8]) {
              goto LABEL_44;
            }
            long long v49 = *(void **)(a1 + 32);
            long long v46 = v55;
            v55[0] = MEMORY[0x263EF8330];
            v55[1] = 3221225472;
            void v55[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_802;
            v55[3] = &unk_264CC5750;
            v55[4] = v53;
            id v47 = &v56;
            objc_copyWeak(&v56, v3);
            [v49 executeBlockAfterCurrentStateTransition:v55];
          }
          objc_destroyWeak(v47);

LABEL_44:
          goto LABEL_45;
        }
        id v39 = &TVPPlaybackReportingHLSPlaylistPreloadStateFull;
      }
      id v40 = *v39;

      id v38 = v40;
      goto LABEL_37;
    }
  }
LABEL_45:
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_800(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = @"Media item loader key";
  v7[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained stateMachine];
  [v5 postEvent:@"Media item loader did prepare item for loading" withContext:0 userInfo:v3];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_801(uint64_t a1)
{
  id v1 = (id *)a1;
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v8 = @"Media item loader key";
  v9[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  uint64_t v5 = [WeakRetained stateMachine];
  [v5 postEvent:@"Media item loader did prepare item for loading" withContext:0 userInfo:v3];

  id v6 = objc_loadWeakRetained(v1);
  id v7 = [v6 stateMachine];
  [v7 postEvent:@"Media item loader did load AVAsset keys" withContext:0 userInfo:v3];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_802(uint64_t a1)
{
  id v1 = (id *)a1;
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  char v10 = @"Media item loader key";
  v11[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  uint64_t v5 = [WeakRetained stateMachine];
  [v5 postEvent:@"Media item loader did prepare item for loading" withContext:0 userInfo:v3];

  id v6 = objc_loadWeakRetained(v1);
  id v7 = [v6 stateMachine];
  [v7 postEvent:@"Media item loader did load AVAsset keys" withContext:0 userInfo:v3];

  id v8 = objc_loadWeakRetained(v1);
  id v9 = [v8 stateMachine];
  [v9 postEvent:@"Media item did prepare for playback initiation" withContext:0 userInfo:v3];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_804(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = [WeakRetained currentMediaItem];

  id v9 = [v6 objectForKey:@"direction"];
  uint64_t v10 = [v9 integerValue];

  id v11 = [v6 objectForKey:@"TVPPlaylistDidHitBeginningKey"];
  int v12 = [v11 BOOLValue];

  id v13 = [v6 objectForKey:@"TVPPlaylistDidHitEndKey"];
  int v14 = [v13 BOOLValue];

  int v15 = [v6 objectForKey:@"Changing media because AVFoundation advanced key"];
  char v16 = [v15 BOOLValue];

  if (!v12)
  {
    if (v8) {
      int v19 = v14;
    }
    else {
      int v19 = 1;
    }
    if (v19 == 1)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      char v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    id v20 = [v8 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
    [v20 addEndEventWithName:TVPPlaybackReportingEventUserPlayToLoadingInitiation];

    if (v16) {
      goto LABEL_23;
    }
    id v21 = objc_loadWeakRetained((id *)(a1 + 64));
    id v22 = [v21 AVQueuePlayer];

    id v23 = [v22 items];
    id v24 = objc_loadWeakRetained((id *)(a1 + 64));
    [v24 setModifyingAVPlayerQueue:1];

    if (!v10 && [v23 count] == 2)
    {
      id v25 = [v23 objectAtIndex:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = [v25 mediaItemLoader];
        uint64_t v26 = [v38 mediaItem];
        int v37 = [v26 isEqualToMediaItem:v8];

        if (v37)
        {
          uint64_t v27 = sPlayerLogObject;
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CMTimeRange buf = 0;
            _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Calling advanceToNextItem since item added previously matches newly current item", buf, 2u);
          }
          [v22 advanceToNextItem];
LABEL_22:
          id v29 = objc_loadWeakRetained((id *)(a1 + 64));
          [v29 setModifyingAVPlayerQueue:0];

LABEL_23:
          id v30 = objc_loadWeakRetained((id *)(a1 + 64));
          [v30 setCurrentDirectionOfPlaylistChange:v10];

          id v31 = objc_loadWeakRetained((id *)(a1 + 64));
          [v31 _updateAVPlayerActionAtItemEnd];

          id v32 = *(void **)(a1 + 32);
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_805;
          v39[3] = &unk_264CC5750;
          id v40 = v8;
          objc_copyWeak(&v41, (id *)(a1 + 64));
          [v32 executeBlockAfterCurrentStateTransition:v39];
          id v33 = objc_loadWeakRetained((id *)(a1 + 64));
          [v33 setPostLoadingState:v5];

          id v34 = objc_loadWeakRetained((id *)(a1 + 64));
          id v35 = +[TVPPlaybackState loading];
          [v34 _setState:v35 updatedRate:1 notifyListeners:0.0];

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          objc_destroyWeak(&v41);

          char v18 = @"Waiting for media item to prepare for loading";
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    uint64_t v28 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_236FC5000, v28, OS_LOG_TYPE_DEFAULT, "Calling removeAllItems", buf, 2u);
    }
    [v22 removeAllItems];
    goto LABEL_22;
  }
  id v17 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Stopping because there are no more items in playlist going backwards", buf, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  char v18 = @"Stopped";
LABEL_24:

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_805(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mediaItemMetadataForProperty:@"TVPMediaItemMetadataStartTime"];
  id v3 = v2;
  memset(&v7, 0, sizeof(v7));
  if (v2)
  {
    [v2 doubleValue];
    CMTimeMakeWithSeconds(&v7, v4, 1000000);
  }
  else
  {
    CMTime v7 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CMTime v6 = v7;
  [WeakRetained _notifyListenersOfElapsedTimeChange:&v6 playbackDate:0 dueToTimeJump:1];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_807(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained playlist];
  CMTime v6 = [v5 currentMediaItem];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v7) {
      [(id)objc_opt_class() _playerWillBecomeActive:v7];
    }
    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 _updateMediaRemoteManager];

    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = [v9 playlist];
    [v10 setNumConsecutivePlaybackFailures:0];

    char v11 = [v6 hasTrait:@"TVPMediaItemTraitForceSoundCheck"];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_808;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v18 = v11;
    dispatch_async((dispatch_queue_t)sAVAudioSessionQueue, block);
    id v12 = objc_loadWeakRetained((id *)(a1 + 40));
    [v12 setPostLoadingState:v3];

    id v13 = objc_loadWeakRetained((id *)(a1 + 40));
    int v14 = +[TVPPlaybackState loading];
    [v13 _setState:v14 updatedRate:1 notifyListeners:0.0];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    int v15 = @"Waiting for media item to prepare for loading";
  }
  else
  {
    int v15 = @"Stopped";
  }

  return v15;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_808(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 32)) {
      id v3 = @"YES";
    }
    else {
      id v3 = @"NO";
    }
    int v5 = 138412290;
    CMTime v6 = v3;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Setting forceSoundCheck to %@", (uint8_t *)&v5, 0xCu);
  }
  Float64 v4 = [MEMORY[0x263EF93E0] sharedInstance];
  [v4 setForceSoundCheck:*(unsigned __int8 *)(a1 + 32) error:0];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_810(uint64_t a1)
{
  return @"Stopped";
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_812(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v36 = a2;
  id v37 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [v10 objectForKey:@"Playlist key"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v13 = [WeakRetained playlistInternal];

  if (!v11 && v13 || v11 && !v13 || v11 && v13 && ([v11 isEqual:v13] & 1) == 0)
  {
    int v15 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = v15;
      id v17 = [v11 currentMediaItem];
      *(_DWORD *)CMTimeRange buf = 138412290;
      id v43 = v17;
      _os_log_impl(&dword_236FC5000, v16, OS_LOG_TYPE_DEFAULT, "Playlist's initial current media item: %@", buf, 0xCu);
    }
    char v18 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = v18;
      id v20 = [v11 nextMediaItem];
      *(_DWORD *)CMTimeRange buf = 138412290;
      id v43 = v20;
      _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Playlist's initial next media item: %@", buf, 0xCu);
    }
    id v21 = [v10 objectForKey:@"Being invalidated key"];
    int v22 = [v21 BOOLValue];

    id v23 = @"Player invalidated";
    if (!v22) {
      id v23 = @"New playlist set";
    }
    id v24 = v23;
    id v25 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v26 = [v25 currentMediaItem];
    [v25 _removeObserversForMediaItem:v26];

    id v27 = objc_loadWeakRetained((id *)(a1 + 56));
    [v27 willChangeValueForKey:@"playlistInternal"];

    id v28 = objc_loadWeakRetained((id *)(a1 + 56));
    [v28 willChangeValueForKey:@"playlist"];

    id v29 = objc_loadWeakRetained((id *)(a1 + 56));
    [v29 _postCurrentMediaItemWillChangeNotificationWithDirection:0 reason:v24 didHitBeginningOfPlaylist:0 didHitEndOfPlaylist:0];

    id v30 = [*(id *)(a1 + 32) currentState];
    LODWORD(v26) = [v30 isEqualToString:@"Stopped"];

    if (v26) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    id v31 = objc_loadWeakRetained((id *)(a1 + 56));
    id v32 = [v11 currentMediaItem];
    [v31 _addObserversForMediaItem:v32];

    id v33 = *(void **)(a1 + 32);
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_813;
    v38[3] = &unk_264CC5B18;
    objc_copyWeak(&v41, (id *)(a1 + 56));
    id v39 = v11;
    id v34 = v24;
    id v40 = v34;
    [v33 executeBlockAfterCurrentStateTransition:v38];

    objc_destroyWeak(&v41);
    int v14 = @"Stopped";
  }
  else
  {
    int v14 = [*(id *)(a1 + 32) currentState];
  }

  return v14;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_813(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPlaylistInternal:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 didChangeValueForKey:@"playlistInternal"];

  id v5 = objc_loadWeakRetained(v2);
  [v5 didChangeValueForKey:@"playlist"];

  id v6 = objc_loadWeakRetained(v2);
  [v6 _postCurrentMediaItemDidChangeNotificationWithDirection:0 reason:*(void *)(a1 + 40) didHitBeginningOfPlaylist:0 didHitEndOfPlaylist:0];

  id v8 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v8 currentMediaItem];
  objc_msgSend(v8, "setCurrentMediaItemIsStreaming:", objc_msgSend(v7, "hasTrait:", @"TVPMediaItemTraitIsStreaming"));
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_814(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained currentMediaItemLoader];

  id v4 = [v3 state];
  if ([v4 isEqualToString:0x26EA1A3B8])
  {
    id v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_815;
    v7[3] = &unk_264CC52C8;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    [v5 executeBlockAfterCurrentStateTransition:v7];
  }
  return @"Waiting for AVAsset to load";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_815(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = @"Media item loader key";
  v5[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [*(id *)(a1 + 40) postEvent:@"Media item loader did load AVAsset keys" withContext:0 userInfo:v3];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_816(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"Play completion key"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = +[TVPPlaybackState playing];
  id v9 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  return v9;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_817(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v32 = a3;
  id v30 = a4;
  id v10 = a5;
  char v11 = [v10 objectForKey:@"Play completion key"];
  id v12 = [v10 objectForKey:@"Ignore delegate key"];
  [v12 BOOLValue];

  id v13 = [v10 objectForKey:@"Volume ramp duration key"];
  [v13 doubleValue];
  double v15 = v14;

  long long v37 = 0uLL;
  uint64_t v38 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v17 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "startTime", v30);
  }
  else
  {
    long long v37 = 0uLL;
    uint64_t v38 = 0;
  }

  long long v35 = v37;
  uint64_t v36 = v38;
  __int16 v34 = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v20 = objc_loadWeakRetained((id *)(a1 + 56));
    id v21 = +[TVPPlaybackState playing];
    [v20 setPostLoadingState:v21];

    id v22 = objc_loadWeakRetained((id *)(a1 + 56));
    id v23 = [v22 AVQueuePlayer];
    BOOL v24 = v23 == 0;

    if (v24)
    {
      id v25 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        uint64_t v26 = "No AVPlayer exists yet, will set rate when AVPlayer is created";
        goto LABEL_17;
      }
    }
    else
    {
      if (!v11)
      {
        uint64_t v27 = *(void *)(a1 + 40);
        id v28 = objc_loadWeakRetained((id *)(a1 + 56));
        [v28 rateUsedForPlayback];
        *(float *)&double v29 = v29;
        (*(void (**)(uint64_t, float, double))(v27 + 16))(v27, *(float *)&v29, v15);

        goto LABEL_6;
      }
      id v25 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        uint64_t v26 = "Not setting AVPlayer rate since AVKit will set it for us";
LABEL_17:
        _os_log_impl(&dword_236FC5000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
      }
    }
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_8:
  char v18 = objc_msgSend(v9, "currentState", v30);

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_818(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Set elapsed time or date" withContext:0 userInfo:*(void *)(a1 + 32)];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_819(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v31 = a4;
  id v11 = a5;
  id v12 = [v11 objectForKey:@"Play completion key"];
  id v13 = [v11 objectForKey:@"Ignore delegate key"];
  [v13 BOOLValue];

  double v14 = [v11 objectForKey:@"Volume ramp duration key"];
  [v14 doubleValue];
  double v16 = v15;

  long long v30 = *MEMORY[0x263F010E0];
  long long v37 = *MEMORY[0x263F010E0];
  uint64_t v38 = *(void *)(MEMORY[0x263F010E0] + 16);
  char v36 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v18 = [WeakRetained currentPlayerItem];

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)(a1 + 56));
    id v20 = [v19 currentPlayerItem];
    id v21 = v20;
    if (v20)
    {
      [v20 currentTime];
    }
    else
    {
      long long v34 = 0uLL;
      uint64_t v35 = 0;
    }
    long long v37 = v34;
    uint64_t v38 = v35;
  }
  long long v34 = v37;
  uint64_t v35 = v38;
  char v33 = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v24 = objc_loadWeakRetained((id *)(a1 + 56));
    id v25 = +[TVPPlaybackState playing];
    [v24 setPostLoadingState:v25];

    if (v12)
    {
      uint64_t v26 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v26, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", buf, 2u);
      }
    }
    else
    {
      uint64_t v27 = *(void *)(a1 + 40);
      id v28 = objc_loadWeakRetained((id *)(a1 + 56));
      [v28 rateUsedForPlayback];
      *(float *)&double v29 = v29;
      (*(void (**)(uint64_t, float, double))(v27 + 16))(v27, *(float *)&v29, v16);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v22 = objc_msgSend(v9, "currentState", v30);

  return v22;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_820(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Set elapsed time or date" withContext:0 userInfo:*(void *)(a1 + 32)];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_821(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v26 = a3;
  id v25 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"Play completion key"];
  id v12 = [v10 objectForKey:@"Ignore delegate key"];
  [v12 BOOLValue];

  id v13 = [v10 objectForKey:@"Volume ramp duration key"];
  [v13 doubleValue];
  double v15 = v14;

  long long v31 = 0uLL;
  uint64_t v32 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v17 = [WeakRetained currentPlayerItem];
  char v18 = v17;
  if (v17)
  {
    [v17 currentTime];
  }
  else
  {
    long long v31 = 0uLL;
    uint64_t v32 = 0;
  }

  long long v29 = v31;
  uint64_t v30 = v32;
  __int16 v28 = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    if (v11)
    {
      id v19 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v19, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", buf, 2u);
      }
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = objc_loadWeakRetained((id *)(a1 + 56));
      [v21 rateUsedForPlayback];
      *(float *)&double v22 = v22;
      (*(void (**)(uint64_t, float, double))(v20 + 16))(v20, *(float *)&v22, v15);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v23 = [v9 currentState];

  return v23;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_822(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  if (*(void *)(a1 + 40))
  {
    id v3 = (void *)[&__block_literal_global_825 copy];
    [v2 setObject:v3 forKey:@"Play completion key"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained stateMachine];
  [v5 postEvent:@"Set elapsed time or date" withContext:0 userInfo:v2];

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  CMTime v9 = *(CMTime *)(a1 + 64);
  id v8 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v9)];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, 1, v8);
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_826(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a3;
  CMTime v9 = [v7 objectForKey:@"Ignore delegate key"];
  unsigned int v22 = [v9 BOOLValue];

  id v10 = [v7 objectForKey:@"Play completion key"];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v14 = [WeakRetained externalImagePlayer];
  double v15 = v14;
  if (v14) {
    [v14 elapsedTime];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  id v16 = objc_loadWeakRetained(v12);
  id v17 = [v16 externalImagePlayer];
  char v18 = [v17 playbackDate];
  id v19 = +[TVPPlaybackState playing];
  uint64_t v20 = (*(void (**)(uint64_t, void *, void *, void, void *, id, id, BOOL, void))(v11 + 16))(v11, v23, v18, v22, v19, v8, v7, v10 == 0, 0);

  return v20;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_827(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained externalImagePlayer];
  [v3 setRate:0.0];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 externalImagePlayer];
  id v6 = objc_loadWeakRetained(v1);
  id v7 = v6;
  if (v6) {
    [v6 lastTimeSentToAVKitImageHandler];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  [v5 setElapsedTime:v9];

  return @"Waiting for AVKit seek after finishing external image scanning";
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_828(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  CMTime v9 = [v8 objectForKey:@"Play completion key"];
  id v10 = [v8 objectForKey:@"Volume ramp duration key"];

  [v10 doubleValue];
  double v12 = v11;

  id v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v15 = [WeakRetained progressiveJumpingScrubber];
  [v15 cancelScrub];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  [v16 setProgressiveJumpingScrubber:0];

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  char v18 = +[TVPPlaybackState playing];
  [v17 setPostLoadingState:v18];

  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v20 = +[TVPPlaybackState loading];
  [v19 _setState:v20 updatedRate:1 notifyListeners:0.0];

  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = objc_loadWeakRetained(v13);
  [v22 rateUsedForPlayback];
  *(float *)&double v23 = v23;
  (*(void (**)(uint64_t, float, double))(v21 + 16))(v21, *(float *)&v23, v12);

  id v24 = objc_loadWeakRetained(v13);
  id v25 = [v24 AVQueuePlayer];
  uint64_t v26 = [v25 timeControlStatus];

  if (v26 != 1)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    void v28[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_829;
    v28[3] = &unk_264CC54E8;
    id v29 = v7;
    uint64_t v30 = v26;
    [v29 executeBlockAfterCurrentStateTransition:v28];
  }
  return @"Waiting for time control status to be done waiting";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_829(uint64_t a1)
{
  uint64_t v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v3 postEvent:@"Time control status did change" withContext:v4];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [v6 objectForKey:@"Play completion key"];
  id v8 = [v6 objectForKey:@"Volume ramp duration key"];

  [v8 doubleValue];
  double v10 = v9;

  double v11 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = [WeakRetained progressiveJumpingScrubber];
  [v13 cancelScrub];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  [v14 setProgressiveJumpingScrubber:0];

  id v15 = objc_loadWeakRetained((id *)(a1 + 40));
  id v16 = +[TVPPlaybackState playing];
  [v15 setPostLoadingState:v16];

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  char v18 = +[TVPPlaybackState loading];
  [v17 _setState:v18 updatedRate:1 notifyListeners:0.0];

  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = objc_loadWeakRetained(v11);
  [v20 rateUsedForPlayback];
  *(float *)&double v21 = v21;
  (*(void (**)(uint64_t, float, double))(v19 + 16))(v19, *(float *)&v21, v10);

  return @"Waiting for seek";
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_831(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  double v9 = [v7 objectForKey:@"Play completion key"];
  double v10 = [v7 objectForKey:@"Volume ramp duration key"];

  [v10 doubleValue];
  double v12 = v11;

  if (v9)
  {
    id v13 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", v19, 2u);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained rateUsedForPlayback];
    *(float *)&double v16 = v16;
    (*(void (**)(uint64_t, float, double))(v14 + 16))(v14, *(float *)&v16, v12);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v17 = [v8 currentState];

  return v17;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_832(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"Play completion key"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = +[TVPPlaybackState paused];
  double v9 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  return v9;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_833(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  double v11 = [v9 objectForKey:@"Ignore delegate key"];
  [v11 BOOLValue];

  double v12 = [v9 objectForKey:@"Play completion key"];
  char v25 = 0;
  int v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  if (!v13)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v15 = +[TVPPlaybackState paused];
  [WeakRetained setPostLoadingState:v15];

  id v16 = objc_loadWeakRetained((id *)(a1 + 56));
  id v17 = [v16 AVQueuePlayer];

  if (v17)
  {
    if (!v12)
    {
      (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(0.0, 0.0);
      goto LABEL_11;
    }
    char v18 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = 0;
      uint64_t v19 = "Not setting AVPlayer rate since AVKit will set it for us";
      id v20 = (uint8_t *)&v24;
LABEL_9:
      _os_log_impl(&dword_236FC5000, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
    }
  }
  else
  {
    char v18 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      uint64_t v19 = "No AVPlayer exists yet, will set rate when AVPlayer is created";
      id v20 = (uint8_t *)&v23;
      goto LABEL_9;
    }
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
LABEL_12:
  double v21 = objc_msgSend(v8, "currentState", v23);

  return v21;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_834(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  double v11 = [v9 objectForKey:@"Ignore delegate key"];
  [v11 BOOLValue];

  double v12 = [v9 objectForKey:@"Volume ramp duration key"];
  [v12 doubleValue];
  double v14 = v13;

  id v15 = [v9 objectForKey:@"Play completion key"];
  char v22 = 0;
  int v16 = (*(uint64_t (**)(void))(a1[4] + 16))();

  if (v16)
  {
    if (v15)
    {
      id v17 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v21 = 0;
        _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", v21, 2u);
      }
    }
    else
    {
      (*(void (**)(double, double))(a1[5] + 16))(0.0, v14);
    }
    char v18 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    char v18 = *(void (**)(void))(a1[6] + 16);
  }
  v18();
  uint64_t v19 = [v8 currentState];

  return v19;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_835(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 objectForKey:@"Ignore delegate key"];
  unsigned int v22 = [v9 BOOLValue];

  id v10 = [v7 objectForKey:@"Play completion key"];
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v14 = [WeakRetained externalImagePlayer];
  id v15 = v14;
  if (v14) {
    [v14 elapsedTime];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  id v16 = objc_loadWeakRetained(v12);
  id v17 = [v16 externalImagePlayer];
  char v18 = [v17 playbackDate];
  uint64_t v19 = +[TVPPlaybackState paused];
  id v20 = (*(void (**)(uint64_t, void *, void *, void, void *, id, id, BOOL, void))(v11 + 16))(v11, v23, v18, v22, v19, v8, v7, v10 == 0, 0);

  return v20;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_836(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained externalImagePlayer];
  [v3 setRate:0.0];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 externalImagePlayer];
  id v6 = objc_loadWeakRetained(v1);
  id v7 = v6;
  if (v6) {
    [v6 lastTimeSentToAVKitImageHandler];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  [v5 setElapsedTime:v9];

  return @"Waiting for AVKit seek after finishing external image scanning";
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_837(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Play completion key"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = [WeakRetained progressiveJumpingScrubber];
  [v10 cancelScrub];

  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 setProgressiveJumpingScrubber:0];

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  double v13 = +[TVPPlaybackState paused];
  [v12 setPostLoadingState:v13];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  id v15 = +[TVPPlaybackState loading];
  [v14 _setState:v15 updatedRate:1 notifyListeners:0.0];

  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  id v17 = [v16 AVQueuePlayer];
  uint64_t v18 = [v17 timeControlStatus];

  if (v18 != 1)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_838;
    v20[3] = &unk_264CC54E8;
    id v21 = v7;
    uint64_t v22 = v18;
    [v21 executeBlockAfterCurrentStateTransition:v20];
  }
  return @"Waiting for time control status to be done waiting";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_838(uint64_t a1)
{
  uint64_t v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v3 postEvent:@"Time control status did change" withContext:v4];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_839(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [a5 objectForKey:@"Play completion key"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained progressiveJumpingScrubber];
  [v8 cancelScrub];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 setProgressiveJumpingScrubber:0];

  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = +[TVPPlaybackState paused];
  [v10 setPostLoadingState:v11];

  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  double v13 = +[TVPPlaybackState loading];
  [v12 _setState:v13 updatedRate:1 notifyListeners:0.0];

  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  return @"Waiting for seek";
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_840(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Play completion key"];
  if (v8)
  {
    id v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", v12, 2u);
    }
  }
  else
  {
    (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v10 = [v7 currentState];

  return v10;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_841(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v9 objectForKey:@"Rate key"];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v9 objectForKey:@"Play completion key"];
  char v23 = 0;
  int v15 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v18 = [WeakRetained currentPlayerItem];
    uint64_t v19 = v18;
    if (v18) {
      [v18 currentTime];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    id v20 = (*(void (**)(uint64_t, void *, void, BOOL, double))(v16 + 16))(v16, v22, 0, v14 != 0, v13);

    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v20 = [v8 currentState];
  }

  return v20;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_842(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v9 objectForKey:@"Rate key"];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v9 objectForKey:@"Play completion key"];
  char v23 = 0;
  int v15 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v18 = [WeakRetained currentPlayerItem];
    uint64_t v19 = v18;
    if (v18) {
      [v18 currentTime];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    id v20 = (*(void (**)(uint64_t, void *, void, BOOL, double))(v16 + 16))(v16, v22, 0, v14 != 0, v13);

    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v20 = [v8 currentState];
  }

  return v20;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_843(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v9 objectForKey:@"Rate key"];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v9 objectForKey:@"Play completion key"];
  char v27 = 0;
  int v15 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if ([WeakRetained currentMediaItemIsStreaming])
    {
      uint64_t v17 = 0;
    }
    else
    {
      id v19 = objc_loadWeakRetained((id *)(a1 + 56));
      id v20 = [v19 currentPlayerItem];
      uint64_t v17 = [v20 isPlaybackBufferEmpty];
    }
    uint64_t v21 = *(void *)(a1 + 40);
    id v22 = objc_loadWeakRetained((id *)(a1 + 56));
    char v23 = [v22 currentPlayerItem];
    __int16 v24 = v23;
    if (v23) {
      [v23 currentTime];
    }
    else {
      memset(v26, 0, sizeof(v26));
    }
    uint64_t v18 = (*(void (**)(uint64_t, void *, uint64_t, BOOL, double))(v21 + 16))(v21, v26, v17, v14 != 0, v13);

    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v18 = [v8 currentState];
  }

  return v18;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_844(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v9 objectForKey:@"Rate key"];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v9 objectForKey:@"Play completion key"];
  char v23 = 0;
  int v15 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v18 = [WeakRetained externalImagePlayer];
    id v19 = v18;
    if (v18) {
      [v18 elapsedTime];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    id v20 = (*(void (**)(uint64_t, void *, uint64_t, BOOL, double))(v16 + 16))(v16, v22, 1, v14 != 0, v13);

    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v20 = [v8 currentState];
  }

  return v20;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_845(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Play completion key"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = [v7 currentState];

  return v9;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_846(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v9 objectForKey:@"Rate key"];
  [v11 doubleValue];
  double v13 = v12;
  id v14 = [v9 objectForKey:@"Play completion key"];
  char v24 = 0;
  int v15 = (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v17 = [WeakRetained currentMediaItemIsStreaming] ^ 1;

    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = objc_loadWeakRetained((id *)(a1 + 56));
    id v20 = v19;
    if (v19) {
      [v19 timeBeingSeekedTo];
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    uint64_t v21 = (*(void (**)(uint64_t, void *, uint64_t, BOOL, double))(v18 + 16))(v18, v23, v17, v14 != 0, v13);

    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v21 = [v8 currentState];
  }

  return v21;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_847(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Play completion key"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = [v7 currentState];

  return v9;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_848(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v23 = a3;
  id v22 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"Media item loader key"];
  double v12 = [v11 mediaItem];
  double v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v15 = [WeakRetained playlist];
  uint64_t v16 = [v15 currentMediaItem];
  LODWORD(a4) = [v12 isEqualToMediaItem:v16];

  if (a4)
  {
    uint64_t v17 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_849;
    v24[3] = &unk_264CC5600;
    objc_copyWeak(&v25, v13);
    [v17 executeBlockAfterCurrentStateTransition:v24];
    id v18 = objc_loadWeakRetained(v13);
    int v19 = [v18 waitsAfterPreparingMediaItems];

    if (v19) {
      id v20 = @"Waiting for signal after preparing item";
    }
    else {
      id v20 = @"Waiting for AVAsset to load";
    }
    objc_destroyWeak(&v25);
  }
  else
  {
    id v20 = [v9 currentState];
  }

  return v20;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_849(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackMediaItemDidBecomePreparedNotification" object:WeakRetained];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_850(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v20 = a3;
  id v19 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"Media item loader key"];
  double v12 = [v11 mediaItem];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v14 = [WeakRetained playlist];
  int v15 = [v14 currentMediaItem];
  LODWORD(a4) = [v12 isEqualToMediaItem:v15];

  if (a4)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    id v21[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_851;
    id v21[3] = &unk_264CC5100;
    objc_copyWeak(&v23, (id *)(a1 + 40));
    id v22 = v11;
    [v16 executeBlockAfterCurrentStateTransition:v21];

    objc_destroyWeak(&v23);
    uint64_t v17 = @"Waiting for media item to prepare for playback initiation";
  }
  else
  {
    uint64_t v17 = [v9 currentState];
  }

  return v17;
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_851(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentMediaItemIsStreaming:", objc_msgSend(*(id *)(a1 + 32), "containsStreamingAVAsset"));

  id v3 = *(void **)(a1 + 32);
  return [v3 prepareForPlaybackInitiation];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Media item loader key"];
  id v9 = [v8 mediaItem];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = [WeakRetained playlist];
  double v12 = [v11 nextMediaItem];
  int v13 = [v9 isEqualToMediaItem:v12];

  if (v13) {
    [v8 prepareForPlaybackInitiation];
  }
  id v14 = [v7 currentState];

  return v14;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v63 = a3;
  id v64 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"Media item loader key"];
  double v12 = [v11 mediaItem];
  int v13 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v15 = [WeakRetained playlist];
  uint64_t v16 = [v15 currentMediaItem];
  LODWORD(a4) = [v12 isEqualToMediaItem:v16];

  if (!a4)
  {
    id v23 = [v9 currentState];
    goto LABEL_27;
  }
  id v17 = objc_loadWeakRetained((id *)(a1 + 64));
  int v18 = [v17 createsPlayerItemButDoesNotEnqueue];

  if (!v18)
  {
    id v19 = [v11 timingData];
    long long v62 = [v11 mediaItem];
    long long v61 = [v62 reportingDelegate];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v25 = v24;
    objc_msgSend(v19, "setStartTimeForAVPlayerItemLoading:");
    [v19 setStartTimeForBuffering:v25];
    if (objc_opt_respondsToSelector())
    {
      id v26 = objc_loadWeakRetained((id *)(a1 + 64));
      [v61 mediaItemWillStartBuffering:v62 player:v26];
    }
    char v27 = *(void **)(a1 + 32);
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_15;
    v69[3] = &unk_264CC5600;
    objc_copyWeak(&v70, (id *)(a1 + 64));
    [v27 executeBlockAfterCurrentStateTransition:v69];
    id v28 = objc_loadWeakRetained((id *)(a1 + 64));
    id v29 = [v28 AVQueuePlayer];
    BOOL v30 = v29 == 0;

    if (v30)
    {
      id v31 = objc_loadWeakRetained((id *)(a1 + 64));
      id v32 = [v31 earlyAVQueuePlayer];

      id v33 = objc_loadWeakRetained((id *)(a1 + 64));
      [v33 setEarlyAVQueuePlayer:0];

      long long v34 = sPlayerLogObject;
      BOOL v35 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        if (v35)
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_log_impl(&dword_236FC5000, v34, OS_LOG_TYPE_DEFAULT, "Using previously created AVQueuePlayer", buf, 2u);
        }
      }
      else
      {
        if (v35)
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_log_impl(&dword_236FC5000, v34, OS_LOG_TYPE_DEFAULT, "Creating AVQueuePlayer", buf, 2u);
        }
        id v32 = +[TVPPlayer _newAVQueuePlayer];
      }
      char v36 = [v32 playbackCoordinator];
      id v37 = objc_loadWeakRetained((id *)(a1 + 64));
      [v36 setDelegate:v37];

      id v38 = objc_loadWeakRetained((id *)(a1 + 64));
      [v38 setAVQueuePlayer:v32];

      id v39 = objc_loadWeakRetained((id *)(a1 + 64));
      [v39 _logExternalPlaybackType];

      id v40 = *(void **)(a1 + 32);
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      id v67[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_852;
      v67[3] = &unk_264CC5600;
      objc_copyWeak(&v68, (id *)(a1 + 64));
      [v40 executeBlockAfterCurrentStateTransition:v67];
      objc_destroyWeak(&v68);
    }
    id v41 = objc_loadWeakRetained((id *)(a1 + 64));
    [v41 _removePlaybackEndTimeBoundaryObservers];

    id v42 = objc_loadWeakRetained((id *)(a1 + 64));
    [v42 _addPlaybackEndTimeBoundaryObservers];

    id v43 = objc_loadWeakRetained((id *)(a1 + 64));
    if (([v43 haveEverEnqueuedPlayerItem] & 1) == 0)
    {
      id v44 = objc_loadWeakRetained((id *)(a1 + 64));
      CMTime v45 = [v44 postLoadingState];
      long long v46 = +[TVPPlaybackState playing];
      BOOL v47 = v45 == v46;

      if (!v47)
      {
LABEL_21:
        id v53 = objc_loadWeakRetained((id *)(a1 + 64));
        long long v54 = [v53 AVQueuePlayer];
        Float64 v55 = [v54 items];
        BOOL v56 = [v55 count] == 0;

        if (v56) {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
        id v57 = objc_loadWeakRetained((id *)(a1 + 64));
        id v58 = [v57 currentPlayerItem];
        BOOL v59 = [v58 status] == 1;

        if (v59)
        {
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_853;
          v65[3] = &unk_264CC5600;
          objc_copyWeak(&v66, (id *)(a1 + 64));
          [v9 executeBlockAfterCurrentStateTransition:v65];
          objc_destroyWeak(&v66);
        }
        objc_destroyWeak(&v70);

        goto LABEL_26;
      }
      id v48 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        id v49 = objc_loadWeakRetained((id *)(a1 + 64));
        [v49 rateUsedForPlayback];
        *(_DWORD *)CMTimeRange buf = 134217984;
        uint64_t v74 = v50;
        _os_log_impl(&dword_236FC5000, v48, OS_LOG_TYPE_DEFAULT, "Fast start: setting player's rate to %f prior to enqueueing first item", buf, 0xCu);
      }
      uint64_t v51 = *(void *)(a1 + 48);
      id v43 = objc_loadWeakRetained((id *)(a1 + 64));
      [v43 rateUsedForPlayback];
      *(float *)&double v52 = v52;
      (*(void (**)(uint64_t, float, double))(v51 + 16))(v51, *(float *)&v52, 0.0);
    }

    goto LABEL_21;
  }
  id v19 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v20 = objc_loadWeakRetained((id *)(a1 + 64));
  [v20 setUnqueuedPlayerItem:v19];

  id v21 = objc_loadWeakRetained((id *)(a1 + 64));
  id v22 = [v21 stateMachine];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14;
  v71[3] = &unk_264CC5600;
  objc_copyWeak(&v72, v13);
  [v22 executeBlockAfterCurrentStateTransition:v71];

  objc_destroyWeak(&v72);
LABEL_26:

  id v23 = @"Waiting for AVPlayerItem status to become ready to play";
LABEL_27:

  return v23;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlayerUnqueueudPlayerItemReadyNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackReportingBufferingWillStartNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_852(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlayerExternalPlaybackTypeDidChangeNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_853(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Current player item status did become ready to play"];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_854(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Media item loader key"];
  id v9 = [v8 mediaItem];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [WeakRetained playlist];
  double v12 = [v11 nextMediaItem];
  int v13 = [v9 isEqualToMediaItem:v12];

  if (v13)
  {
    id v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_236FC5000, v14, OS_LOG_TYPE_DEFAULT, "Enqueueing player item for next media item", v17, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  int v15 = [v7 currentState];

  return v15;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_855(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v48 = a2;
  id v49 = a3;
  id v50 = a4;
  id v51 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  long long v54 = [WeakRetained currentMediaItemLoader];

  id v10 = [v54 timingData];
  id v11 = objc_loadWeakRetained((id *)(a1 + 72));
  double v12 = [v11 playlist];
  int v13 = [v12 currentMediaItem];

  Float64 v55 = [v13 reportingDelegate];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v15 = v14;
  objc_msgSend(v10, "setEndTimeForAVPlayerItemLoading:");
  [v10 setStartTimeForBuffering:v15];
  if (objc_opt_respondsToSelector())
  {
    [v10 startTimeForAVPlayerItemLoading];
    double v17 = v16;
    [v10 endTimeForAVPlayerItemLoading];
    double v19 = v18 - v17;
    id v20 = objc_loadWeakRetained((id *)(a1 + 72));
    [v55 mediaItemPlayerItemStatusDidBecomeReadyToPlay:v13 timeTakenForOperation:v20 player:v19];
  }
  id v21 = [v13 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
  [v21 setInitialFPSRequestsComplete:1];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v22 = objc_loadWeakRetained((id *)(a1 + 72));
  [v22 setCurrentDirectionOfPlaylistChange:0];

  id v23 = objc_loadWeakRetained((id *)(a1 + 72));
  [v23 setLoadingInitialItemInPlaylist:0];

  id v24 = objc_loadWeakRetained((id *)(a1 + 72));
  [v24 updateAudioSelectionCriteria];

  id v25 = objc_loadWeakRetained((id *)(a1 + 72));
  id v26 = [v25 currentPlayerItem];

  double v52 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v53 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  char v27 = [v13 mediaItemMetadataForProperty:@"TVPMediaItemMetadataChapterCollections"];
  id v28 = [MEMORY[0x263EFF980] array];
  id v29 = objc_loadWeakRetained((id *)(a1 + 72));
  BOOL v30 = [v29 currentMediaItem];
  char v31 = [v30 hasTrait:@"TVPMediaItemTraitIsScene"];

  if ((v31 & 1) == 0)
  {
    if (v52) {
      objc_msgSend(v28, "addObject:");
    }
    if (v27) {
      [v28 addObjectsFromArray:v27];
    }
    if (v53) {
      [v28 addObject:v53];
    }
  }
  id v32 = [v28 firstObject];
  id v33 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    long long v34 = v33;
    id v35 = objc_loadWeakRetained((id *)(a1 + 72));
    int v36 = [v35 currentMediaItemIsStreaming];
    id v37 = @"FILE";
    if (v36) {
      id v37 = @"HLS";
    }
    *(_DWORD *)CMTimeRange buf = 138412290;
    uint64_t v67 = v37;
    _os_log_impl(&dword_236FC5000, v34, OS_LOG_TYPE_DEFAULT, "Media Type: %@", buf, 0xCu);
  }
  id v38 = *(void **)(a1 + 32);
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_864;
  v60[3] = &unk_264CC6308;
  id v39 = v26;
  id v61 = v39;
  objc_copyWeak(&v65, (id *)(a1 + 72));
  id v40 = v28;
  id v62 = v40;
  id v41 = v32;
  id v63 = v41;
  id v42 = v13;
  id v64 = v42;
  [v38 executeBlockAfterCurrentStateTransition:v60];
  id v43 = objc_loadWeakRetained((id *)(a1 + 72));
  int v44 = [v43 _isPlaybackLikelyToKeepUp];

  if (v44)
  {
    CMTime v45 = *(void **)(a1 + 32);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    id v58[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_865;
    v58[3] = &unk_264CC5470;
    id v59 = v45;
    [v59 executeBlockAfterCurrentStateTransition:v58];
  }
  long long v46 = *(void **)(a1 + 32);
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_866;
  v56[3] = &unk_264CC55B0;
  id v57 = *(id *)(a1 + 64);
  [v46 executeBlockAfterCurrentStateTransition:v56];

  objc_destroyWeak(&v65);
  return @"Waiting for sufficient buffer";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_864(uint64_t a1)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) hasVideo];
  id v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    if (v2) {
      id v4 = @"YES";
    }
    *(_DWORD *)CMTimeRange buf = 138412290;
    v76 = v4;
    _os_log_impl(&dword_236FC5000, v3, OS_LOG_TYPE_DEFAULT, "hasVideo: %@", buf, 0xCu);
  }
  id v5 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = [WeakRetained currentMediaItem];
  int v8 = [v7 hasTrait:@"TVPMediaItemTraitTreatAsVideo"];

  if (v8)
  {
    id v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Treating as video since it has TVPMediaItemTraitTreatAsVideo", buf, 2u);
    }
  }
  else if (!v2)
  {
    goto LABEL_10;
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 64));
  [v10 setCurrentMediaItemHasVideoContent:1];

LABEL_10:
  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  [v11 setCurrentMediaItemInitialLoadingComplete:1];

  id v12 = objc_loadWeakRetained((id *)(a1 + 64));
  int v13 = *(void **)(a1 + 32);
  if (v13) {
    [v13 currentTime];
  }
  else {
    memset(v72, 0, sizeof(v72));
  }
  id v14 = objc_loadWeakRetained((id *)(a1 + 64));
  double v15 = [v14 _currentDateFromPlayerItem:*(void *)(a1 + 32)];
  [v12 _notifyListenersOfElapsedTimeChange:v72 playbackDate:v15 dueToTimeJump:0];

  id v16 = objc_loadWeakRetained((id *)(a1 + 64));
  [v16 willChangeValueForKey:@"selectedAudioOption"];

  id v17 = objc_loadWeakRetained((id *)(a1 + 64));
  [v17 didChangeValueForKey:@"selectedAudioOption"];

  id v18 = objc_loadWeakRetained((id *)(a1 + 64));
  [v18 willChangeValueForKey:@"selectedSubtitleOption"];

  id v19 = objc_loadWeakRetained((id *)(a1 + 64));
  [v19 didChangeValueForKey:@"selectedSubtitleOption"];

  id v20 = objc_loadWeakRetained((id *)(a1 + 64));
  [v20 willChangeValueForKey:@"audioOptions"];

  id v21 = objc_loadWeakRetained((id *)(a1 + 64));
  [v21 didChangeValueForKey:@"audioOptions"];

  id v22 = objc_loadWeakRetained((id *)(a1 + 64));
  [v22 updateSubtitleOptions];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v23 = objc_loadWeakRetained((id *)(a1 + 64));
  id v24 = [v23 subtitleOptions];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v69;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v69 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        if ([v29 subtitleType] == 2 || objc_msgSend(v29, "subtitleType") == 1)
        {
          id v30 = objc_loadWeakRetained((id *)(a1 + 64));
          char v31 = [v30 currentMediaItem];
          [v31 setMediaItemMetadata:MEMORY[0x263EFFA88] forProperty:@"TVPMediaItemMetadataContainsClosedCaptions"];

          goto LABEL_24;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  id v32 = objc_loadWeakRetained((id *)(a1 + 64));
  id v33 = [v32 selectedAudioOption];
  [v32 setCachedSelectedAudioOption:v33];

  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v35 = objc_loadWeakRetained((id *)(a1 + 64));
  int v36 = [v35 audioOptions];

  uint64_t v37 = [v36 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v65 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = [*(id *)(*((void *)&v64 + 1) + 8 * j) languageCodeBCP47];
        if (v41 && ([v34 containsObject:v41] & 1) == 0) {
          [v34 addObject:v41];
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v64 objects:v73 count:16];
    }
    while (v38);
  }

  id v42 = objc_loadWeakRetained((id *)(a1 + 64));
  [(id)objc_opt_class() updateSupplementaryAvailableAudioLanguageCodes:v34];

  id v43 = objc_loadWeakRetained((id *)(a1 + 64));
  [v43 setChapterCollections:*(void *)(a1 + 40)];

  id v44 = objc_loadWeakRetained((id *)(a1 + 64));
  [v44 setCurrentChapterCollection:*(void *)(a1 + 48)];

  id v45 = objc_loadWeakRetained((id *)(a1 + 64));
  long long v46 = [v45 currentMediaItem];
  BOOL v47 = [v46 mediaItemMetadataForProperty:@"TVPMediaItemMetadataInterstitialCollection"];
  [v45 setCurrentInterstitialCollection:v47];

  id v48 = objc_loadWeakRetained((id *)(a1 + 64));
  [v48 willChangeValueForKey:@"seekableDateRange"];

  id v49 = objc_loadWeakRetained((id *)(a1 + 64));
  [v49 didChangeValueForKey:@"seekableDateRange"];

  id v50 = objc_loadWeakRetained((id *)(a1 + 64));
  id v51 = *(void **)(a1 + 32);
  if (v51) {
    [v51 currentTime];
  }
  else {
    memset(v63, 0, sizeof(v63));
  }
  [v50 _updateIsLiveForElapsedTime:v63];

  id v52 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v52, "setCurrentMediaItemHasDates:", objc_msgSend(v52, "_currentPlayerItemContainsDates"));

  id v53 = objc_loadWeakRetained((id *)(a1 + 64));
  [v53 duration];
  double v55 = v54;

  if (v55 > 0.0 && v55 != 3.40282347e38)
  {
    id v56 = objc_loadWeakRetained((id *)(a1 + 64));
    id v57 = [v56 currentMediaItem];
    id v58 = [v57 mediaItemMetadataForProperty:@"TVPMediaItemMetadataInterstitialCollection"];

    if (v58)
    {
      [v58 timeAdjustedByRemovingInterstitials:v55];
      double v55 = v59;
    }
    id v60 = *(void **)(a1 + 56);
    id v61 = [NSNumber numberWithDouble:v55];
    [v60 setMediaItemMetadata:v61 forProperty:@"TVPMediaItemMetadataDuration"];
  }
  id v62 = objc_loadWeakRetained(v5);
  [v62 _populateCurrentPlayerItemWithUpNextMetadata];
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_865(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Sufficient buffer did become available"];
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_866(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_867(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v30 = a3;
  id v29 = a4;
  id v10 = a5;
  id v11 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v13 = [WeakRetained currentMediaItemLoader];

  id v14 = [v13 timingData];
  double v15 = [v13 mediaItem];
  id v16 = [v15 reportingDelegate];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v14, "setEndTimeForBuffering:");
  if (objc_opt_respondsToSelector())
  {
    [v14 startTimeForBuffering];
    double v18 = v17;
    [v14 endTimeForBuffering];
    double v20 = v19 - v18;
    id v21 = objc_loadWeakRetained((id *)(a1 + 40));
    [v16 mediaItemBufferingDidBecomeLikelyToKeepUp:v15 timeTakenForOperation:v21 player:v20];
  }
  id v22 = *(void **)(a1 + 32);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  id v34[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_870;
  v34[3] = &unk_264CC5600;
  objc_copyWeak(&v35, v11);
  [v22 executeBlockAfterCurrentStateTransition:v34];
  if (([v14 initialLoadingComplete] & 1) == 0)
  {
    id v23 = [v15 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
    [v23 addEndEventWithName:TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp];

    id v24 = [v15 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
    [v24 addStartEventWithName:TVPPlaybackReportingEventWaitingForTimeControlStatus];
  }
  [v14 setStartTimeForBuffering:0.0];
  [v14 setEndTimeForBuffering:0.0];
  id v25 = objc_loadWeakRetained(v11);
  uint64_t v26 = [v25 AVQueuePlayer];
  uint64_t v27 = [v26 timeControlStatus];

  if (v27 != 1)
  {
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    id v31[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_871;
    v31[3] = &unk_264CC54E8;
    id v32 = v9;
    uint64_t v33 = v27;
    [v32 executeBlockAfterCurrentStateTransition:v31];
  }
  objc_destroyWeak(&v35);

  return @"Waiting for time control status to be done waiting";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_870(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackReportingBufferingDidBecomeLikelyToKeepUpNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_871(uint64_t a1)
{
  int v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v3 postEvent:@"Time control status did change" withContext:v4];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_872(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    uint64_t v13 = [v11 integerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v15 = [WeakRetained AVQueuePlayer];
    uint64_t v13 = [v15 timeControlStatus];
  }
  id v16 = [v9 currentState];
  if (v13 != 1)
  {
    id v38 = v12;
    id v39 = v10;
    uint64_t v37 = a1;
    double v18 = (id *)(a1 + 40);
    id v19 = objc_loadWeakRetained((id *)(a1 + 40));
    double v20 = [v19 currentMediaItemLoader];

    id v21 = [v20 timingData];
    id v22 = [v20 mediaItem];
    id v23 = [v22 reportingDelegate];
    if (([v21 initialLoadingComplete] & 1) == 0)
    {
      [v21 setInitialLoadingComplete:1];
      id v24 = [v22 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
      [v24 addEndEventWithName:TVPPlaybackReportingEventWaitingForTimeControlStatus];

      if (objc_opt_respondsToSelector())
      {
        [v21 totalInitialLoadingTime];
        double v26 = v25;
        id v27 = objc_loadWeakRetained(v18);
        [v23 mediaItemAllInitialLoadingComplete:v22 totalTime:v27 player:v26];
      }
    }
    id v40 = v23;
    id v28 = objc_loadWeakRetained(v18);
    char v29 = [v28 initialMediaItemHasCompletedInitialLoading];

    if ((v29 & 1) == 0)
    {
      id v30 = objc_loadWeakRetained(v18);
      [v30 setInitialMediaItemHasCompletedInitialLoading:1];
    }
    id v31 = objc_loadWeakRetained(v18);
    id v32 = [v31 playlist];
    [v32 setNumConsecutivePlaybackFailures:0];

    if (v13)
    {
      if (v13 != 2)
      {
        id v12 = v38;
        id v10 = v39;
        goto LABEL_18;
      }
      (*(void (**)(void))(*(void *)(v37 + 32) + 16))();
      uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v34 = objc_loadWeakRetained(v18);
      id v35 = +[TVPPlaybackState paused];
      [v34 _setState:v35 updatedRate:1 notifyListeners:0.0];

      uint64_t v33 = @"Paused";
    }
    id v12 = v38;
    id v10 = v39;

    id v16 = v33;
LABEL_18:

    goto LABEL_19;
  }
  double v17 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring time control status change since it's still AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", buf, 2u);
  }
LABEL_19:

  return v16;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_875(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    uint64_t v13 = [v11 integerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v15 = [WeakRetained AVQueuePlayer];
    uint64_t v13 = [v15 timeControlStatus];
  }
  id v16 = [v9 currentState];
  if (v13)
  {
    if (v13 == 1)
    {
      id v44 = v12;
      id v45 = v10;
      double v17 = (id *)(a1 + 40);
      id v18 = objc_loadWeakRetained((id *)(a1 + 40));
      id v19 = [v18 currentMediaItemLoader];

      id v20 = objc_loadWeakRetained((id *)(a1 + 40));
      id v21 = [v20 currentMediaItem];

      id v22 = [v21 reportingDelegate];
      id v23 = [v19 timingData];
      [v23 startTimeForBuffering];
      if (v24 == 0.0)
      {
        [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
        objc_msgSend(v23, "setStartTimeForBuffering:");
        if (objc_opt_respondsToSelector())
        {
          id v25 = objc_loadWeakRetained((id *)(a1 + 40));
          [v22 mediaItemWillStartBuffering:v21 player:v25];
        }
        double v26 = *(void **)(a1 + 32);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_876;
        void v47[3] = &unk_264CC5600;
        objc_copyWeak(&v48, v17);
        [v26 executeBlockAfterCurrentStateTransition:v47];
        objc_destroyWeak(&v48);
      }
      id v41 = v22;
      id v42 = v21;
      id v43 = v19;
      id v27 = @"TVPPlaybackChangeReasonPlaybackDidStartBuffering";
      id v28 = objc_loadWeakRetained(v17);
      char v29 = [v28 AVQueuePlayer];
      id v30 = [v29 reasonForWaitingToPlay];
      int v31 = [v30 isEqualToString:*MEMORY[0x263EFA170]];

      if (v31)
      {
        id v32 = @"TVPPlaybackChangeReasonWaitingForCoordinatedPlayback";

        id v27 = v32;
      }
      id v33 = objc_loadWeakRetained(v17);
      id v34 = +[TVPPlaybackState playing];
      [v33 setPostLoadingState:v34];

      id v35 = objc_loadWeakRetained(v17);
      int v36 = +[TVPPlaybackState loading];
      [v35 _setState:v36 updatedRate:v27 reason:1 notifyListeners:0.0];

      id v16 = @"Waiting for time control status to be done waiting";
      id v12 = v44;
      id v10 = v45;
    }
    else
    {
      id v39 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v39, OS_LOG_TYPE_DEFAULT, "Ignoring time control status change to AVPlayerTimeControlStatusPlaying since we're already playing", buf, 2u);
      }
    }
  }
  else
  {
    id v37 = objc_loadWeakRetained((id *)(a1 + 40));
    id v38 = +[TVPPlaybackState paused];
    [v37 _setState:v38 updatedRate:1 notifyListeners:0.0];

    id v16 = @"Paused";
  }

  return v16;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_876(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackReportingBufferingWillStartNotification" object:WeakRetained];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_877(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    uint64_t v13 = [v11 integerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v15 = [WeakRetained AVQueuePlayer];
    uint64_t v13 = [v15 timeControlStatus];
  }
  id v16 = [v9 currentState];
  if (v13 == 2)
  {
    uint64_t v22 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v16 = (__CFString *)v22;
  }
  else if (v13 == 1)
  {
    double v17 = (id *)(a1 + 40);
    id v18 = objc_loadWeakRetained(v17);
    id v19 = +[TVPPlaybackState playing];
    [v18 setPostLoadingState:v19];

    id v20 = objc_loadWeakRetained(v17);
    id v21 = +[TVPPlaybackState loading];
    [v20 _setState:v21 updatedRate:1 notifyListeners:0.0];

    id v16 = @"Waiting for time control status to be done waiting";
  }
  else
  {
    id v23 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v25 = 0;
      _os_log_impl(&dword_236FC5000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring change to AVPlayerTimeControlStatusPaused since player is already in paused state", v25, 2u);
    }
  }

  return v16;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_878(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    uint64_t v13 = [v11 integerValue];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    double v15 = [WeakRetained AVQueuePlayer];
    uint64_t v13 = [v15 timeControlStatus];
  }
  id v16 = [v9 currentState];
  if (v13)
  {
    double v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl(&dword_236FC5000, v17, OS_LOG_TYPE_DEFAULT, "During scanning, ignoring time control status change to something other than paused", v21, 2u);
    }
  }
  else
  {
    id v18 = objc_loadWeakRetained((id *)(a1 + 32));
    id v19 = +[TVPPlaybackState paused];
    [v18 _setState:v19 updatedRate:1 notifyListeners:0.0];

    id v16 = @"Paused";
  }

  return v16;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_879(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  int v8 = [a5 objectForKey:@"Rate key"];
  [v8 doubleValue];
  double v10 = v9;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  char v12 = [WeakRetained currentMediaItemIsStreaming];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 32) currentState];
  }
  else
  {
    id v14 = [v7 currentState];
    uint64_t v15 = [v14 isEqualToString:@"Scanning using AVPlayer driven by AVKit"];

    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = objc_loadWeakRetained((id *)(a1 + 48));
    id v18 = [v17 currentPlayerItem];
    id v19 = v18;
    if (v18) {
      [v18 currentTime];
    }
    else {
      memset(v21, 0, sizeof(v21));
    }
    uint64_t v13 = (*(void (**)(uint64_t, void *, uint64_t, uint64_t, double))(v16 + 16))(v16, v21, 1, v15, v10);
  }
  return v13;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_880(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  id v31[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_881;
  v31[3] = &unk_264CC5600;
  id v14 = (id *)(a1 + 40);
  objc_copyWeak(v32, (id *)(a1 + 40));
  [v13 executeBlockAfterCurrentStateTransition:v31];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v16 = [WeakRetained playlist];

  if ([v16 endAction] == 1 && (objc_msgSend(v16, "moreItemsAvailable:", 0) & 1) == 0)
  {
    id v17 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_882;
    v29[3] = &unk_264CC5600;
    objc_copyWeak(&v30, v14);
    [v17 executeBlockAfterCurrentStateTransition:v29];
    objc_destroyWeak(&v30);
  }
  id v18 = objc_loadWeakRetained(v14);
  uint64_t v19 = [v18 mediaItemEndAction];

  if (v19 != 1)
  {
    id v20 = objc_loadWeakRetained(v14);
    [v20 setMediaItemChangeReason:@"Played to end of media item"];

    id v21 = [v12 objectForKey:@"Requires manual AVQueuePlayer advance key"];
    int v22 = [v21 BOOLValue];

    if (v22)
    {
      id v23 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_236FC5000, v23, OS_LOG_TYPE_DEFAULT, "Scheduling call to advanceToNextItem since RequiresManualAVQueuePlayerAdvance is YES", buf, 2u);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_883;
      block[3] = &unk_264CC5600;
      objc_copyWeak(&v27, v14);
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v27);
    }
  }
  double v24 = [v9 currentState];

  objc_destroyWeak(v32);
  return v24;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_881(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackDidPlayToEndOfMediaItemNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_882(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackPlaylistDidFinishNotification" object:WeakRetained];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_883(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained AVQueuePlayer];
  [v1 advanceToNextItem];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_884(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void v67[4] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v15 = [WeakRetained AVQueuePlayer];
  [v15 rate];
  float v17 = v16;

  id v18 = [v9 currentState];
  char v19 = [v18 isEqualToString:@"Scanning using AVPlayer driven by AVKit"];

  if (v17 < 0.0)
  {
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_885;
    v61[3] = &unk_264CC63A8;
    char v65 = v19;
    id v62 = v9;
    id v63 = v12;
    objc_copyWeak(&v64, (id *)(a1 + 40));
    [v62 executeBlockAfterCurrentStateTransition:v61];
    objc_destroyWeak(&v64);

    goto LABEL_27;
  }
  id v20 = [v12 objectForKey:@"Requires manual AVQueuePlayer advance key"];
  int v21 = [v20 BOOLValue];

  if (v21)
  {
    int v22 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "Scheduling call to advanceToNextItem since RequiresManualAVQueuePlayerAdvance is YES", (uint8_t *)&buf, 2u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_886;
    block[3] = &unk_264CC5600;
    objc_copyWeak(&v60, v13);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v60);
    goto LABEL_27;
  }
  if (v19) {
    goto LABEL_27;
  }
  id v23 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_236FC5000, v23, OS_LOG_TYPE_DEFAULT, "Calling _setAVPlayerRate", (uint8_t *)&buf, 2u);
  }
  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  id v24 = objc_loadWeakRetained((id *)(a1 + 40));
  id v25 = v24;
  if (v24)
  {
    [v24 cachedDuration];
    if ((v57 & 0x100000000) != 0)
    {
      id v26 = objc_loadWeakRetained(v13);
      id v27 = v26;
      if (v26)
      {
        [v26 cachedDuration];
        BOOL v28 = (v54 & 0x1000000000) == 0;

        if (!v28)
        {
          v52[0] = MEMORY[0x263EF8330];
          v52[1] = 3221225472;
          v52[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_887;
          v52[3] = &unk_264CC5600;
          objc_copyWeak(v53, v13);
          [v9 executeBlockAfterCurrentStateTransition:v52];
          objc_destroyWeak(v53);
          goto LABEL_27;
        }
        goto LABEL_18;
      }
      v53[1] = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
    }
  }
  else
  {
    uint64_t v56 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
  }

LABEL_18:
  memset(&buf, 0, sizeof(buf));
  id v29 = objc_loadWeakRetained(v13);
  id v30 = v29;
  if (v29) {
    [v29 _currentMediaItemForwardPlaybackEndTime];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  CMTimeMakeWithSeconds(&rhs, 5.0, 1000000);
  CMTimeSubtract(&buf, &lhs, &rhs);

  memset(&v48, 0, sizeof(v48));
  id v31 = objc_loadWeakRetained(v13);
  id v32 = v31;
  if (v31) {
    [v31 _currentMediaItemReversePlaybackEndTime];
  }
  else {
    memset(&v48, 0, sizeof(v48));
  }

  CMTime time1 = buf;
  CMTime time2 = v48;
  if (CMTimeCompare(&time1, &time2) < 0) {
    CMTime buf = v48;
  }
  v66[0] = @"Elapsed CMTime key";
  CMTime time1 = buf;
  id v33 = [MEMORY[0x263F08D40] valueWithCMTime:&time1];
  v67[0] = v33;
  v66[1] = @"Seek precision key";
  CMTime time1 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  id v34 = [MEMORY[0x263F08D40] valueWithCMTime:&time1];
  v67[1] = v34;
  id v67[2] = MEMORY[0x263EFFA88];
  v66[2] = @"Ignore delegate key";
  v66[3] = @"Post loading state key";
  id v35 = +[TVPPlaybackState paused];
  v67[3] = v35;
  int v36 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:4];

  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  id v42 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_888;
  id v43 = &unk_264CC5100;
  objc_copyWeak(&v45, v13);
  id v37 = v36;
  id v44 = v37;
  [v9 executeBlockAfterCurrentStateTransition:&v40];

  objc_destroyWeak(&v45);
LABEL_27:
  id v38 = objc_msgSend(v9, "currentState", v40, v41, v42, v43);

  return v38;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_885(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) postEvent:@"Play"];
  }
  int v2 = [*(id *)(a1 + 40) objectForKey:@"Reset to start time key"];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setElapsedTime:-1000000000.0];
  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_886(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained AVQueuePlayer];
  [v1 advanceToNextItem];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_887(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained stateMachine];
  [v1 postEvent:@"Play"];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_888(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v2 = [WeakRetained stateMachine];
  [v2 postEvent:@"Set elapsed time or date" withContext:0 userInfo:*(void *)(a1 + 32)];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_889(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  CMTime v50 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  id v11 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v13 = [WeakRetained externalImagePlayer];
  [v13 rate];
  double v15 = v14;

  float v16 = (id *)(a1 + 40);
  if (v15 <= 0.0)
  {
    id v21 = objc_loadWeakRetained(v16);
    int v22 = v21;
    if (v21) {
      [v21 _currentMediaItemReversePlaybackEndTime];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    CMTime v50 = v41;

    goto LABEL_12;
  }
  id v17 = objc_loadWeakRetained(v16);
  id v18 = v17;
  if (!v17)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    goto LABEL_14;
  }
  [v17 cachedDuration];
  if ((v48 & 0x100000000) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  id v20 = v19;
  if (!v19)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;

    goto LABEL_14;
  }
  [v19 cachedDuration];

  if ((v45 & 0x1000000000) != 0)
  {
    CMTime v50 = *(CMTime *)*(void *)&MEMORY[0x263F010B8];
LABEL_12:
    uint64_t v23 = +[TVPPlaybackState playing];
    goto LABEL_24;
  }
LABEL_15:
  id v24 = objc_loadWeakRetained((id *)(a1 + 40));
  id v25 = v24;
  if (v24) {
    [v24 _currentMediaItemForwardPlaybackEndTime];
  }
  else {
    memset(&lhs, 0, sizeof(lhs));
  }
  CMTimeMakeWithSeconds(&rhs, 5.0, 1000000);
  CMTimeSubtract(&v50, &lhs, &rhs);

  memset(&v41, 0, sizeof(v41));
  id v26 = objc_loadWeakRetained((id *)(a1 + 40));
  id v27 = v26;
  if (v26) {
    [v26 _currentMediaItemReversePlaybackEndTime];
  }
  else {
    memset(&v41, 0, sizeof(v41));
  }

  CMTime time1 = v50;
  CMTime time2 = v41;
  if (CMTimeCompare(&time1, &time2) < 0) {
    CMTime v50 = v41;
  }
  uint64_t v23 = +[TVPPlaybackState paused];
LABEL_24:
  BOOL v28 = (void *)v23;
  id v29 = objc_loadWeakRetained((id *)(a1 + 40));
  id v30 = [v29 externalImagePlayer];
  [v30 setRate:0.0];

  id v31 = [v8 currentState];
  LODWORD(v30) = [v31 isEqualToString:@"Scanning using external images driven by AVKit"];

  if (v30)
  {
    id v32 = objc_loadWeakRetained((id *)(a1 + 40));
    [v32 setPostAVKitScanningState:v28];

    id v33 = [v8 currentState];
  }
  else
  {
    uint64_t v34 = *(void *)(a1 + 32);
    id v35 = objc_loadWeakRetained(v11);
    CMTime v41 = v50;
    int v36 = [v35 _estimatedPlaybackDateForCMTime:&v41];
    id v37 = *(void (**)(uint64_t, CMTime *, void *, void, void *, id, id, uint64_t, void))(v34 + 16);
    CMTime v41 = v50;
    id v33 = v37(v34, &v41, v36, 0, v28, v9, v10, 1, 0);
  }
  return v33;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_890(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v15 = [WeakRetained progressiveJumpingScrubber];
  [v15 rate];
  double v17 = v16;

  id v18 = [v9 currentState];
  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  id v20 = [v19 progressiveJumpingScrubber];
  [v20 cancelScrub];

  id v21 = objc_loadWeakRetained((id *)(a1 + 40));
  [v21 setProgressiveJumpingScrubber:0];

  if (v17 <= 0.0)
  {
    uint64_t v24 = *(void *)(a1 + 32);
    id v25 = +[TVPPlaybackState loading];
    id v26 = *(void (**)(uint64_t, long long *, void, long long *, void *, uint64_t, double))(v24 + 16);
    long long v30 = *MEMORY[0x263F010E0];
    uint64_t v31 = *(void *)(MEMORY[0x263F010E0] + 16);
    long long v28 = v30;
    uint64_t v29 = v31;
    v26(v24, &v30, 0, &v28, v25, 1, 0.0);

    id v18 = @"Waiting for seek";
  }
  else
  {
    id v22 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v23 = +[TVPPlaybackState playing];
    [v22 setPostLoadingState:v23];

    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    id v32[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_891;
    v32[3] = &unk_264CC5600;
    objc_copyWeak(&v33, v13);
    [v9 executeBlockAfterCurrentStateTransition:v32];
    objc_destroyWeak(&v33);
  }

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_891(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained changeMediaInDirection:0 reason:@"Fast forwarded to end of media item" ignoreDelegate:1];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_892(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a5;
  id v7 = +[TVPPlaybackState playing];
  id v8 = (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

  return v8;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_893(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a5;
  id v7 = +[TVPPlaybackState paused];
  id v8 = (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);

  return v8;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (id *)(a1 + 40);
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [WeakRetained postLoadingState];
  id v10 = (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v9, v7);

  return v10;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_895(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained AVQueuePlayer];
  id v7 = [v6 items];

  if ([v7 count] != 2)
  {
LABEL_9:
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_896;
    v24[3] = &unk_264CC55B0;
    id v25 = *(id *)(a1 + 32);
    [v3 executeBlockAfterCurrentStateTransition:v24];
    id v21 = objc_loadWeakRetained(v4);
    [v21 _populateCurrentPlayerItemWithUpNextMetadata];

    double v17 = [v3 currentState];
    id v8 = v25;
    goto LABEL_10;
  }
  uint64_t v23 = a1;
  id v8 = [v7 objectAtIndex:1];
  id v9 = [v8 mediaItemLoader];
  id v10 = [v9 mediaItem];
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = [v11 playlist];
  uint64_t v13 = [v12 nextMediaItem];
  int v14 = [v10 isEqualToMediaItem:v13];

  double v15 = sPlayerLogObject;
  BOOL v16 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Removing previously added speculative player item", buf, 2u);
    }
    id v18 = objc_loadWeakRetained(v4);
    id v19 = [v18 AVQueuePlayer];
    id v20 = [v7 objectAtIndex:1];
    [v19 removeItem:v20];

    a1 = v23;
    goto LABEL_9;
  }
  if (v16)
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_236FC5000, v15, OS_LOG_TYPE_DEFAULT, "Existing speculative player item matches next media item, so not loading it", buf, 2u);
  }
  double v17 = [v3 currentState];
LABEL_10:

  return v17;
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_896(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_897(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained rateUsedForPlayback];
  *(float *)&double v6 = v6;
  (*(void (**)(uint64_t, float, double))(v2 + 16))(v2, *(float *)&v6, 0.0);

  id v7 = [v4 currentState];

  return v7;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_898(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v45 = a4;
  id v11 = a5;
  id v12 = [v11 objectForKey:@"Elapsed CMTime key"];
  id v13 = [v11 objectForKey:@"Playback date key"];
  uint64_t v47 = [v11 objectForKey:@"Post loading state key"];
  int v14 = [v11 objectForKey:@"Ignore delegate key"];
  [v14 BOOLValue];

  uint64_t v46 = [v11 objectForKey:@"Play completion key"];
  double v15 = [v11 objectForKey:@"Seek precision key"];
  BOOL v16 = v15;
  long long v43 = *MEMORY[0x263F010E0];
  *(_OWORD *)&v61.value = *MEMORY[0x263F010E0];
  CMTimeEpoch v17 = *(void *)(MEMORY[0x263F010E0] + 16);
  v61.CMTimeEpoch epoch = v17;
  char v60 = 0;
  if (v15) {
    [v15 CMTimeValue];
  }
  if (v12)
  {
    id v44 = v9;
    memset(&v59, 0, sizeof(v59));
    [v12 CMTimeValue];
    memset(&v58, 0, sizeof(v58));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v19 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained startTime];
    }
    else {
      memset(&v58, 0, sizeof(v58));
    }

    if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
    {
      CMTime time1 = v59;
      CMTime time2 = v58;
      if (CMTimeCompare(&time1, &time2))
      {
        id v27 = objc_loadWeakRetained((id *)(a1 + 64));
        CMTime time1 = v59;
        [v27 setStartTime:&time1];

        id v28 = objc_loadWeakRetained((id *)(a1 + 64));
        CMTime time1 = v61;
        [v28 setStartingSeekPrecision:&time1];

        id v29 = objc_loadWeakRetained((id *)(a1 + 64));
        [v29 setStartDate:0];

        id v30 = objc_loadWeakRetained((id *)(a1 + 64));
        [v30 setStartPosition:0.0];

        if (v47)
        {
          id v31 = objc_loadWeakRetained((id *)(a1 + 64));
          [v31 setPostLoadingState:v47];
        }
        id v32 = *(void **)(a1 + 32);
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_899;
        v51[3] = &unk_264CC63D0;
        objc_copyWeak(&v53, (id *)(a1 + 64));
        CMTime v54 = v58;
        CMTime v55 = v59;
        id v52 = v13;
        [v32 executeBlockAfterCurrentStateTransition:v51];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v9 = v44;

        objc_destroyWeak(&v53);
        goto LABEL_16;
      }
    }
    id v9 = v44;
    id v33 = (void *)v46;
    if (!v60) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (!v13)
    {
LABEL_16:
      id v33 = (void *)v46;
      goto LABEL_22;
    }
    uint64_t v20 = *(void *)(a1 + 56);
    v50[1] = v13;
    int v21 = (*(uint64_t (**)(void))(v20 + 16))();
    id v22 = v13;

    if (!v21) {
      goto LABEL_9;
    }
    id location = (id *)(a1 + 64);
    id v42 = v10;
    id v23 = v9;
    id v24 = objc_loadWeakRetained((id *)(a1 + 64));
    id v25 = [v24 startDate];
    char v26 = [v22 isEqual:v25];

    id v9 = v23;
    id v10 = v42;
    if ((v26 & 1) == 0)
    {
      id v34 = objc_loadWeakRetained(location);
      [v34 setStartDate:v22];

      id v35 = objc_loadWeakRetained(location);
      *(_OWORD *)&v59.value = v43;
      v59.CMTimeEpoch epoch = v17;
      [v35 setStartTime:&v59];

      id v36 = objc_loadWeakRetained(location);
      [v36 setStartPosition:0.0];

      if (v47)
      {
        id v37 = objc_loadWeakRetained(location);
        [v37 setPostLoadingState:v47];
      }
      id v38 = *(void **)(a1 + 32);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_900;
      v48[3] = &unk_264CC5100;
      objc_copyWeak(v50, location);
      id v13 = v22;
      id v49 = v13;
      [v38 executeBlockAfterCurrentStateTransition:v48];
      id v33 = (void *)v46;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      objc_destroyWeak(v50);
    }
    else
    {
LABEL_9:
      id v33 = (void *)v46;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v13 = v22;
    }
  }
LABEL_22:
  id v39 = objc_msgSend(*(id *)(a1 + 32), "currentState", location);

  return v39;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_899(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = *(_OWORD *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  [WeakRetained _notifyOfBoundaryCrossingBetweenPreviousTime:&v8 updatedTime:&v6];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  [v4 _notifyListenersOfElapsedTimeChange:&v8 playbackDate:v5 dueToTimeJump:1];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_900(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  [WeakRetained _notifyListenersOfElapsedTimeChange:&v4 playbackDate:v3 dueToTimeJump:1];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_901(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v29 = a2;
  id v31 = a3;
  id v27 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKey:@"Elapsed CMTime key"];
  id v11 = v10;
  long long v56 = 0uLL;
  uint64_t v57 = 0;
  if (v10) {
    [v10 CMTimeValue];
  }
  id v12 = objc_msgSend(v9, "objectForKey:", @"Playback date key", v27);
  id v13 = [v9 objectForKey:@"Seek precision key"];
  long long v54 = *MEMORY[0x263F010E0];
  uint64_t v55 = *(void *)(MEMORY[0x263F010E0] + 16);
  id v30 = [v9 objectForKey:@"Post loading state key"];
  int v14 = [v9 objectForKey:@"Ignore delegate key"];
  [v14 BOOLValue];

  double v15 = [v9 objectForKey:@"Play completion key"];
  char v53 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  CMTimeEpoch v17 = [WeakRetained currentPlayerItem];

  if (v13) {
    [v13 CMTimeValue];
  }
  if (v12)
  {
    uint64_t v18 = *(void *)(a1 + 40);
    id v52 = v12;
    int v19 = (*(uint64_t (**)(void))(v18 + 16))();
    id v20 = v12;

    if (v19)
    {
      if (v30)
      {
        id v21 = objc_loadWeakRetained((id *)(a1 + 64));
        [v21 setPostLoadingState:v30];
      }
      [v17 seekToDate:v20 completionHandler:0];
      id v22 = *(void **)(a1 + 32);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_902;
      void v47[3] = &unk_264CC5DC0;
      objc_copyWeak(&v49, (id *)(a1 + 64));
      long long v50 = v56;
      uint64_t v51 = v57;
      id v20 = v20;
      id v48 = v20;
      [v22 executeBlockAfterCurrentStateTransition:v47];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      objc_destroyWeak(&v49);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (v11)
    {
      long long v45 = 0uLL;
      uint64_t v46 = 0;
      if (v17) {
        [v17 currentTime];
      }
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
      {
        if (v30)
        {
          id v23 = objc_loadWeakRetained((id *)(a1 + 64));
          [v23 setPostLoadingState:v30];
        }
        long long v43 = v56;
        uint64_t v44 = v57;
        long long v41 = v54;
        uint64_t v42 = v55;
        long long v39 = v54;
        uint64_t v40 = v55;
        [v17 seekToTime:&v43 toleranceBefore:&v41 toleranceAfter:&v39 completionHandler:0];
        id v24 = *(void **)(a1 + 32);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        id v32[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_903;
        v32[3] = &unk_264CC63D0;
        objc_copyWeak(&v34, (id *)(a1 + 64));
        long long v35 = v45;
        uint64_t v36 = v46;
        long long v37 = v56;
        uint64_t v38 = v57;
        id v33 = 0;
        [v24 executeBlockAfterCurrentStateTransition:v32];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        objc_destroyWeak(&v34);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    id v20 = 0;
  }
  id v25 = [v29 currentState];

  return v25;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_902(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  [WeakRetained _notifyListenersOfElapsedTimeChange:&v4 playbackDate:v3 dueToTimeJump:1];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_903(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = *(_OWORD *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  [WeakRetained _notifyOfBoundaryCrossingBetweenPreviousTime:&v8 updatedTime:&v6];

  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 88);
  [v4 _notifyListenersOfElapsedTimeChange:&v8 playbackDate:v5 dueToTimeJump:1];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_904(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"Elapsed CMTime key"];
  id v12 = v11;
  memset(&v56, 0, sizeof(v56));
  if (v11) {
    [v11 CMTimeValue];
  }
  id v13 = [v10 objectForKey:@"Playback date key"];
  int v14 = [v10 objectForKey:@"Seek precision key"];
  double v15 = [v10 objectForKey:@"Post loading state key"];
  CMTime v55 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  BOOL v16 = [v10 objectForKey:@"Ignore delegate key"];
  [v16 BOOLValue];

  CMTimeEpoch v17 = [v10 objectForKey:@"Play completion key"];
  char v54 = 0;
  if (v14) {
    [v14 CMTimeValue];
  }
  if (v12)
  {
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()) {
      goto LABEL_7;
    }
LABEL_14:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v31 = [v8 currentState];
    goto LABEL_25;
  }
  id v48 = v8;
  if (!v13)
  {
    id v47 = v9;
    goto LABEL_16;
  }
  uint64_t v28 = *(void *)(a1 + 40);
  char v53 = v13;
  int v29 = (*(uint64_t (**)(void))(v28 + 16))();
  id v30 = v13;

  id v13 = v30;
  id v8 = v48;
  if (!v29) {
    goto LABEL_14;
  }
LABEL_7:
  id v47 = v9;
  id v48 = v8;
  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    int v19 = [WeakRetained _currentPlayerItemContainsDates];

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)(a1 + 64));
      id v21 = [v20 currentPlayerItem];

      id v22 = objc_loadWeakRetained((id *)(a1 + 64));
      uint64_t v45 = [v22 _currentDateFromPlayerItem:v21];

      memset(&time, 0, sizeof(time));
      uint64_t v46 = v21;
      if (v21) {
        [v21 currentTime];
      }
      id v23 = (void *)v45;
      objc_msgSend(v13, "timeIntervalSinceDate:", v45, v45);
      Float64 v25 = v24;
      id v26 = objc_loadWeakRetained((id *)(a1 + 64));
      CMTime v51 = time;
      [v26 setTimeAtStartOfSeek:&v51];

      id v27 = objc_loadWeakRetained((id *)(a1 + 64));
      [v27 setPlaybackDateAtStartOfSeek:v23];

      CMTimeMakeWithSeconds(&rhs, v25, 1000000);
      CMTime lhs = time;
      CMTimeAdd(&v51, &lhs, &rhs);
      CMTime v56 = v51;
    }
  }
LABEL_16:
  uint64_t v32 = *(void *)(a1 + 48);
  id v33 = +[TVPPlaybackState loading];
  id v34 = *(void (**)(uint64_t, CMTime *, void *, CMTime *, void *, BOOL, double))(v32 + 16);
  CMTime time = v56;
  CMTime v51 = v55;
  v34(v32, &time, v13, &v51, v33, v17 == 0, 0.0);

  if (v15)
  {
    id v35 = objc_loadWeakRetained((id *)(a1 + 64));
    [v35 setPostLoadingState:v15];
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v36 = [v48 currentState];
  int v37 = [v36 isEqualToString:@"Playing"];

  if (v37)
  {
    id v35 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v38 = +[TVPPlaybackState playing];
LABEL_22:
    long long v41 = (void *)v38;
    [v35 setPostLoadingState:v38];

    goto LABEL_23;
  }
  long long v39 = [v48 currentState];
  int v40 = [v39 isEqualToString:@"Paused"];

  if (v40)
  {
    id v35 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v38 = +[TVPPlaybackState paused];
    goto LABEL_22;
  }
LABEL_24:
  uint64_t v42 = *(void *)(a1 + 56);
  CMTime time = v56;
  long long v43 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
  (*(void (**)(uint64_t, void *, uint64_t, void *, void *))(v42 + 16))(v42, v17, 1, v43, v13);

  id v31 = @"Waiting for seek";
  id v9 = v47;
  id v8 = v48;
LABEL_25:

  return v31;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_905(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v8 objectForKey:@"Playback date key"];
  id v10 = [v8 objectForKey:@"Elapsed CMTime key"];
  id v11 = v10;
  long long v31 = 0uLL;
  uint64_t v32 = 0;
  if (v10) {
    [v10 CMTimeValue];
  }
  id v12 = [v8 objectForKey:@"Ignore delegate key"];
  [v12 BOOLValue];

  if (!v11)
  {
    if (!v9)
    {
LABEL_17:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      double v24 = [WeakRetained externalImagePlayer];
      long long v28 = v31;
      uint64_t v29 = v32;
      [v24 setElapsedTime:&v28];

      goto LABEL_18;
    }
    uint64_t v13 = *(void *)(a1 + 48);
    id v30 = v9;
    int v14 = (*(uint64_t (**)(void))(v13 + 16))();
    id v15 = v9;

    id v9 = v15;
    if (!v14) {
      goto LABEL_18;
    }
LABEL_8:
    if (v9)
    {
      id v16 = objc_loadWeakRetained((id *)(a1 + 56));
      int v17 = [v16 _currentPlayerItemContainsDates];

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)(a1 + 56));
        int v19 = [v18 currentPlayerItem];

        id v20 = objc_loadWeakRetained((id *)(a1 + 56));
        if (v19) {
          [v19 currentTime];
        }
        else {
          memset(v27, 0, sizeof(v27));
        }
        id v21 = objc_loadWeakRetained((id *)(a1 + 56));
        id v22 = [v21 _currentDateFromPlayerItem:v19];
        if (v20)
        {
          [v20 _estimatedCMTimeForPlaybackDate:v9 referenceTime:v27 referenceDate:v22];
        }
        else
        {
          long long v28 = 0uLL;
          uint64_t v29 = 0;
        }
        long long v31 = v28;
        uint64_t v32 = v29;
      }
    }
    goto LABEL_17;
  }
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))()) {
    goto LABEL_8;
  }
LABEL_18:
  Float64 v25 = [*(id *)(a1 + 32) currentState];

  return v25;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_906(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 objectForKey:@"Playback date key"];
  id v10 = [v7 objectForKey:@"Elapsed CMTime key"];
  id v11 = v10;
  long long v41 = 0uLL;
  uint64_t v42 = 0;
  if (v10) {
    [v10 CMTimeValue];
  }
  uint64_t v12 = [v7 objectForKey:@"Play completion key"];
  uint64_t v13 = [v7 objectForKey:@"Ignore delegate key"];
  uint64_t v14 = [v13 BOOLValue];

  uint64_t v15 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v17 = [WeakRetained postAVKitScanningState];
  id v40 = 0;
  id v18 = *(void (**)(uint64_t, long long *, void *, uint64_t, void *, id, id, BOOL, id *))(v15 + 16);
  long long v38 = v41;
  uint64_t v39 = v42;
  uint64_t v36 = (void *)v12;
  int v19 = v18(v15, &v38, v9, v14, v17, v8, v7, v12 == 0, &v40);

  id v20 = v40;
  id v21 = [v20 objectForKey:@"Allowed key"];
  uint64_t v22 = [v21 BOOLValue];

  id v23 = [v20 objectForKey:@"Elapsed CMTime key"];
  double v24 = [v20 objectForKey:@"Playback date key"];
  uint64_t v25 = *(void *)(a1 + 40);
  if (v23)
  {
    id v26 = v11;
    id v27 = v19;
    long long v28 = NSNumber;
    [v23 CMTimeValue];
    uint64_t v29 = [v28 numberWithDouble:CMTimeGetSeconds(&time)];
    id v30 = *(void (**)(uint64_t, void *, uint64_t, void *, void *))(v25 + 16);
    uint64_t v31 = v25;
    uint64_t v32 = v36;
    v30(v31, v36, v22, v29, v24);

    int v19 = v27;
    id v11 = v26;
  }
  else
  {
    id v33 = *(void (**)(uint64_t, uint64_t, uint64_t, void, void *))(v25 + 16);
    uint64_t v34 = v25;
    uint64_t v32 = (void *)v12;
    v33(v34, v12, v22, 0, v24);
  }

  return v19;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_12_907(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v42 = a2;
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 objectForKey:@"Elapsed CMTime key"];
  id v11 = v10;
  memset(&v50, 0, sizeof(v50));
  if (v10) {
    [v10 CMTimeValue];
  }
  uint64_t v12 = [v9 objectForKey:@"Playback date key"];
  uint64_t v13 = [v9 objectForKey:@"Seek precision key"];
  CMTime v49 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  uint64_t v14 = [v9 objectForKey:@"Post loading state key"];
  uint64_t v15 = [v9 objectForKey:@"Ignore delegate key"];
  [v15 BOOLValue];

  id v16 = [v9 objectForKey:@"Play completion key"];
  char v48 = 0;
  if (v13) {
    [v13 CMTimeValue];
  }
  if (v11)
  {
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()) {
      goto LABEL_7;
    }
LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    long long v28 = v42;
    uint64_t v29 = [v42 currentState];
    goto LABEL_22;
  }
  if (!v12)
  {
    long long v41 = v13;
    goto LABEL_18;
  }
  uint64_t v24 = *(void *)(a1 + 40);
  id v47 = v12;
  int v25 = (*(uint64_t (**)(void))(v24 + 16))();
  id v26 = v14;
  id v27 = v12;

  uint64_t v12 = v27;
  uint64_t v14 = v26;
  if (!v25) {
    goto LABEL_13;
  }
LABEL_7:
  long long v41 = v13;
  if (!v12)
  {
LABEL_18:
    long long v28 = v42;
    goto LABEL_19;
  }
  int v17 = v14;
  id v18 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v20 = [WeakRetained _currentPlayerItemContainsDates];

  if (v20)
  {
    id v21 = objc_loadWeakRetained((id *)(a1 + 64));
    id v40 = [v21 playbackDateAtStartOfSeek];

    memset(&time, 0, sizeof(time));
    id v22 = objc_loadWeakRetained((id *)(a1 + 64));
    id v23 = v22;
    uint64_t v14 = v17;
    if (v22) {
      [v22 timeAtStartOfSeek];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    id v8 = v18;

    [v12 timeIntervalSinceDate:v40];
    CMTimeMakeWithSeconds(&rhs, v30, 1000000);
    CMTime lhs = time;
    CMTimeAdd(&v45, &lhs, &rhs);
    CMTime v50 = v45;

    goto LABEL_18;
  }
  long long v28 = v42;
  id v8 = v18;
  uint64_t v14 = v17;
LABEL_19:
  id v31 = v8;
  if (v14)
  {
    id v32 = objc_loadWeakRetained((id *)(a1 + 64));
    [v32 setPostLoadingState:v14];
  }
  uint64_t v33 = *(void *)(a1 + 48);
  +[TVPPlaybackState loading];
  v35 = uint64_t v34 = v14;
  uint64_t v36 = *(void (**)(uint64_t, CMTime *, void *, CMTime *, void *, BOOL, double))(v33 + 16);
  CMTime time = v50;
  CMTime v45 = v49;
  v36(v33, &time, v12, &v45, v35, v16 == 0, 0.0);

  uint64_t v37 = *(void *)(a1 + 56);
  CMTime time = v50;
  long long v38 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
  (*(void (**)(uint64_t, void *, uint64_t, void *, void *))(v37 + 16))(v37, v16, 1, v38, v12);

  uint64_t v14 = v34;
  uint64_t v29 = @"Waiting for seek";
  id v8 = v31;
  uint64_t v13 = v41;
LABEL_22:

  return v29;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_13_908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = [v6 objectForKey:@"Elapsed CMTime key"];
  id v8 = v7;
  long long v19 = 0uLL;
  uint64_t v20 = 0;
  if (v7) {
    [v7 CMTimeValue];
  }
  id v9 = [v6 objectForKey:@"Play completion key"];
  uint64_t v10 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = [WeakRetained progressiveJumpingScrubber];
  [v12 rate];
  uint64_t v13 = *(void (**)(uint64_t, long long *, void, long long *, void, uint64_t))(v10 + 16);
  long long v17 = v19;
  uint64_t v18 = v20;
  long long v15 = *MEMORY[0x263F010E0];
  uint64_t v16 = *(void *)(MEMORY[0x263F010E0] + 16);
  v13(v10, &v17, 0, &v15, 0, 1);

  return @"Scrubbing using progressive jumping waiting for seek";
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14_909(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = [a5 objectForKey:@"Play completion key"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = [v7 currentState];

  return v9;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_15_910(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained currentPlayerItem];

  id v7 = objc_loadWeakRetained(v4);
  long long v23 = *MEMORY[0x263F010E0];
  uint64_t v24 = *(void *)(MEMORY[0x263F010E0] + 16);
  [v7 setTimeAtStartOfSeek:&v23];

  id v8 = objc_loadWeakRetained(v4);
  [v8 setPlaybackDateAtStartOfSeek:0];

  id v9 = [MEMORY[0x263F08A00] defaultCenter];
  id v10 = objc_loadWeakRetained(v4);
  [v9 postNotificationName:@"TVPPlayerStillImageDidChangeNotification" object:v10];

  id v11 = objc_loadWeakRetained(v4);
  if (([v11 remainLoadingWhenSeekCompletes] & 1) == 0)
  {
    id v12 = objc_loadWeakRetained(v4);
    uint64_t v13 = [v12 postLoadingState];
    uint64_t v14 = +[TVPPlaybackState paused];

    if (v13 != v14) {
      goto LABEL_5;
    }
    id v11 = objc_loadWeakRetained(v4);
    long long v15 = +[TVPPlaybackState paused];
    [v11 _setState:v15 updatedRate:1 notifyListeners:0.0];
  }
LABEL_5:
  id v16 = objc_loadWeakRetained(v4);
  long long v17 = [v16 AVQueuePlayer];
  uint64_t v18 = [v17 timeControlStatus];

  if (v18 != 1)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_16;
    v20[3] = &unk_264CC54E8;
    id v21 = v3;
    uint64_t v22 = v18;
    [v21 executeBlockAfterCurrentStateTransition:v20];
  }
  return @"Waiting for time control status to be done waiting";
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_16(uint64_t a1)
{
  uint64_t v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_236FC5000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v3 postEvent:@"Time control status did change" withContext:v4];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_911(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v5 = *MEMORY[0x263F010E0];
  uint64_t v6 = *(void *)(MEMORY[0x263F010E0] + 16);
  [WeakRetained setTimeAtStartOfSeek:&v5];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setPlaybackDateAtStartOfSeek:0];

  return @"Scrubbing using progressive jumping";
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_912(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = [WeakRetained currentInterstitialCollection];

  id v16 = [v12 objectForKey:@"Due to time jump key"];
  LOBYTE(WeakRetained) = [v16 BOOLValue];

  id v17 = objc_loadWeakRetained(v13);
  [v17 elapsedTime];
  long long v19 = v18;

  memset(&v35, 0, sizeof(v35));
  id v20 = objc_loadWeakRetained(v13);
  [v20 elapsedTime];
  CMTimeMakeWithSeconds(&v35, v21, 1000000);

  id v22 = objc_loadWeakRetained(v13);
  long long v23 = [v22 stateMachine];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_913;
  Float64 v30 = &unk_264CC6448;
  objc_copyWeak(v32, v13);
  CMTime v33 = v35;
  char v34 = (char)WeakRetained;
  id v24 = v15;
  id v31 = v24;
  v32[1] = v19;
  [v23 executeBlockAfterCurrentStateTransition:&v27];

  int v25 = objc_msgSend(v9, "currentState", v27, v28, v29, v30);

  objc_destroyWeak(v32);
  return v25;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_913(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 72);
  [WeakRetained _notifyListenersOfElapsedTimeChange:&v7 playbackDate:0 dueToTimeJump:v4];

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [*(id *)(a1 + 32) interstitialForTime:*(double *)(a1 + 48)];
  [v5 setCurrentInterstitial:v6];
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_914(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v44[3] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v35 = a3;
  id v37 = a4;
  id v10 = a5;
  id v11 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v13 = [WeakRetained currentInterstitialCollection];

  id v14 = objc_loadWeakRetained(v11);
  [v14 rate];
  double v16 = v15;

  id v17 = objc_loadWeakRetained(v11);
  [v17 elapsedTime];
  double v19 = v18;

  id v20 = [v13 mergedInterstitialForTime:v19];
  Float64 v21 = v20;
  if (v20 && v16 != 0.0)
  {
    id v22 = objc_msgSend(v20, "timeRange", v35, v37);
    long long v23 = v22;
    if (v16 <= 0.0)
    {
      [v22 startTime];
      double v25 = -0.1;
    }
    else
    {
      [v22 endTime];
      double v25 = 0.1;
    }
    Float64 v26 = v24 + v25;

    memset(&v42, 0, sizeof(v42));
    CMTimeMakeWithSeconds(&v42, v26, 1000000);
    CMTime v41 = v42;
    uint64_t v27 = [MEMORY[0x263F08D40] valueWithCMTime:&v41];
    v44[0] = v27;
    v43[0] = @"Elapsed CMTime key";
    v43[1] = @"Seek precision key";
    CMTime v41 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
    uint64_t v28 = [MEMORY[0x263F08D40] valueWithCMTime:&v41];
    v44[1] = v28;
    v43[2] = @"Ignore delegate key";
    id v44[2] = MEMORY[0x263EFFA88];
    uint64_t v29 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

    id v30 = objc_loadWeakRetained(v11);
    id v31 = [v30 stateMachine];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_915;
    v38[3] = &unk_264CC5100;
    objc_copyWeak(&v40, v11);
    id v32 = v29;
    id v39 = v32;
    [v31 executeBlockAfterCurrentStateTransition:v38];

    objc_destroyWeak(&v40);
  }
  CMTime v33 = objc_msgSend(v9, "currentState", v35);

  return v33;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_915(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCurrentInterstitial:0];

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v4 = [v5 stateMachine];
  [v4 postEvent:@"Set elapsed time or date" withContext:0 userInfo:*(void *)(a1 + 32)];
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_916(uint64_t a1, void *a2)
{
  return [a2 currentState];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v85[2] = *MEMORY[0x263EF8340];
  id v74 = a2;
  id v71 = a3;
  id v72 = a4;
  id v73 = a5;
  id v9 = [v73 objectForKey:@"Error key"];
  if (!v9)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TVPlaybackErrorDomain" code:801 userInfo:0];
  }
  id v10 = [v9 userInfo];
  id v11 = [v10 objectForKey:0x26EA1A418];
  int v12 = [v11 BOOLValue];

  uint64_t v13 = sPlayerLogObject;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
      __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_5((uint64_t)v9, v13);
    }
    double v15 = [v9 domain];
    if ([v15 isEqualToString:*MEMORY[0x263EF98B0]]) {
      BOOL v16 = [v9 code] == -11819;
    }
    else {
      BOOL v16 = 0;
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v75 = [WeakRetained currentMediaItem];

    if (v16)
    {
      id v18 = objc_loadWeakRetained((id *)(a1 + 64));
      double v19 = [v18 currentPlayerItem];
      if ([v19 status] == 1)
      {

LABEL_26:
        int v29 = 0;
        int v30 = 1;
        goto LABEL_38;
      }
      id v23 = objc_loadWeakRetained((id *)(a1 + 64));
      double v24 = [v23 currentPlayerItem];
      BOOL v25 = [v24 previousStatus] == 1;

      if (v25) {
        goto LABEL_26;
      }
    }
    else
    {
      id v20 = [v75 mediaItemMetadataForProperty:@"TVPMediaItemMetadataHasAttemptedPlaybackRetryDueToError"];
      int v21 = [v20 BOOLValue];

      if (v21)
      {
        id v22 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CMTime buf = 0;
          _os_log_impl(&dword_236FC5000, v22, OS_LOG_TYPE_DEFAULT, "Already retried playing this media item due to previous error.  Not retrying again", buf, 2u);
        }
        [v75 setMediaItemMetadata:MEMORY[0x263EFFA80] forProperty:@"TVPMediaItemMetadataHasAttemptedPlaybackRetryDueToError"];
      }
      else if (objc_opt_respondsToSelector())
      {
        int v26 = [v75 shouldRetryPlaybackForError:v9];
        uint64_t v27 = sPlayerLogObject;
        BOOL v28 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            *(_WORD *)CMTime buf = 0;
            _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Media item wants to retry playback for this error", buf, 2u);
          }
          [v75 setMediaItemMetadata:MEMORY[0x263EFFA88] forProperty:@"TVPMediaItemMetadataHasAttemptedPlaybackRetryDueToError"];
          goto LABEL_26;
        }
        if (v28)
        {
          *(_WORD *)CMTime buf = 0;
          _os_log_impl(&dword_236FC5000, v27, OS_LOG_TYPE_DEFAULT, "Media item does not want to retry playback for this error", buf, 2u);
        }
      }
    }
    id v31 = objc_loadWeakRetained((id *)(a1 + 64));
    if ([v31 errorBehavior] == 2)
    {
      int v29 = 1;
LABEL_37:

      int v30 = 0;
LABEL_38:
      id v37 = [MEMORY[0x263F086E0] mainBundle];
      long long v38 = [v37 bundleIdentifier];
      int v39 = [v38 isEqualToString:@"com.apple.TVIdleScreen"];

      unsigned int v40 = v39 & v16 | v29;
      v84[0] = @"TVPPlaybackErrorKey";
      v84[1] = @"TVPPlaybackWillStopDueToErrorKey";
      v85[0] = v9;
      CMTime v41 = [NSNumber numberWithBool:v40];
      v85[1] = v41;
      long long v70 = [NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];

      CMTime v42 = (void *)MEMORY[0x263F089F8];
      id v43 = objc_loadWeakRetained((id *)(a1 + 64));
      long long v68 = [v42 notificationWithName:@"TVPPlaybackErrorNotification" object:v43 userInfo:v70];

      uint64_t v44 = [MEMORY[0x263F08A00] defaultCenter];
      [v44 postNotification:v68];

      CMTime v45 = [v75 reportingDelegate];
      if (objc_opt_respondsToSelector())
      {
        id v46 = objc_loadWeakRetained((id *)(a1 + 64));
        [v45 mediaItem:v75 errorDidOccur:v9 player:v46];
      }
      id v47 = [v75 mediaItemMetadataForProperty:@"TVPMediaItemPlaybackReportingEventCollection"];
      if (([v47 containsEventWithName:TVPPlaybackReportingEventError] & 1) == 0)
      {
        [v47 addSingleShotEventWithName:TVPPlaybackReportingEventError value:v9];
        [v47 addSingleShotEventWithName:TVPPlaybackReportingEventErrorEvent value:TVPPlaybackReportingEventTotalStartupSequence];
      }
      if (v30)
      {
        if (v16 && os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
          __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_1();
        }
        id v48 = objc_loadWeakRetained((id *)(a1 + 64));
        CMTime v49 = [v48 postLoadingState];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        CMTime v50 = [v74 currentState];
        CMTime v51 = @"Pause";
        if (([v50 isEqualToString:@"Paused"] & 1) == 0)
        {
          if (([v50 isEqualToString:@"Waiting for media item to prepare for loading"] & 1) != 0
            || ([v50 isEqualToString:@"Waiting for signal after preparing item"] & 1) != 0
            || ([v50 isEqualToString:@"Waiting for AVAsset to load"] & 1) != 0
            || ([v50 isEqualToString:@"Waiting for media item to prepare for playback initiation"] & 1) != 0|| (objc_msgSend(v50, "isEqualToString:", @"Waiting for AVPlayerItem status to become ready to play") & 1) != 0|| (objc_msgSend(v50, "isEqualToString:", @"Waiting for sufficient buffer") & 1) != 0|| objc_msgSend(v50, "isEqualToString:", @"Waiting for time control status to be done waiting"))
          {
            id v52 = +[TVPPlaybackState paused];
            char v53 = @"Play";
            if (v49 == v52) {
              char v53 = @"Pause";
            }
            CMTime v51 = v53;
          }
          else
          {
            CMTime v51 = @"Play";
          }
        }
        char v54 = *(void **)(a1 + 32);
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_930;
        v78[3] = &unk_264CC52C8;
        id v79 = v54;
        id v80 = v51;
        CMTime v55 = v51;
        [v79 executeBlockAfterCurrentStateTransition:v78];
      }
      else
      {
        id v56 = objc_loadWeakRetained((id *)(a1 + 64));
        uint64_t v57 = [v56 playlist];
        unint64_t v58 = [v57 numConsecutivePlaybackFailures];

        id v59 = objc_loadWeakRetained((id *)(a1 + 64));
        char v60 = [v59 playlist];
        [v60 setNumConsecutivePlaybackFailures:++v58];

        id v61 = objc_loadWeakRetained((id *)(a1 + 64));
        id v62 = [v61 playlist];
        LOBYTE(v58) = v58 < [v62 count];

        if (v58)
        {
          if (!v40)
          {
            id v63 = (void *)sPlayerLogObject;
            if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
              __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_3(v63, (id *)(a1 + 64));
            }
            id v64 = *(void **)(a1 + 32);
            v76[0] = MEMORY[0x263EF8330];
            v76[1] = 3221225472;
            v76[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_934;
            v76[3] = &unk_264CC5600;
            objc_copyWeak(&v77, (id *)(a1 + 64));
            [v64 executeBlockAfterCurrentStateTransition:v76];
            id v14 = [*(id *)(a1 + 32) currentState];
            objc_destroyWeak(&v77);
            goto LABEL_70;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
            __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_4();
          }
          id v65 = objc_loadWeakRetained((id *)(a1 + 64));
          long long v66 = [v65 playlist];
          [v66 setNumConsecutivePlaybackFailures:0];
        }
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR)) {
          __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_2();
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      id v14 = @"Stopped";
LABEL_70:

      goto LABEL_71;
    }
    id v32 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v33 = [v32 errorBehavior];
    if (v33
      || (id v69 = objc_loadWeakRetained((id *)(a1 + 64)), ([v69 loadingInitialItemInPlaylist] & 1) == 0))
    {
      BOOL v34 = v33 == 0;
      id v35 = [v9 userInfo];
      id v36 = [v35 objectForKey:@"TVPMediaItemPlaybackErrorShouldStopKey"];
      int v29 = [v36 BOOLValue];

      if (!v34)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      int v29 = 1;
    }

    goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_236FC5000, v13, OS_LOG_TYPE_DEFAULT, "Supressing error and stopping due to media item loader request", buf, 2u);
  }
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_920;
  v81[3] = &unk_264CC5600;
  objc_copyWeak(&v82, (id *)(a1 + 64));
  [v74 executeBlockAfterCurrentStateTransition:v81];
  id v14 = [v74 currentState];
  objc_destroyWeak(&v82);
LABEL_71:

  return v14;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_920(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_930(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:*(void *)(a1 + 40)];
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_934(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "changeMediaInDirection:reason:ignoreDelegate:", objc_msgSend(v1, "currentDirectionOfPlaylistChange"), @"Error did occur", 1);
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_935(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v14 = [WeakRetained currentMediaItem];

  double v15 = [v14 reportingDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v16 = objc_loadWeakRetained((id *)(a1 + 40));
    [v15 mediaItemDidStall:v14 player:v16];
  }
  id v17 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_938;
  v20[3] = &unk_264CC5600;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  [v17 executeBlockAfterCurrentStateTransition:v20];
  id v18 = [*(id *)(a1 + 32) currentState];
  objc_destroyWeak(&v21);

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_938(uint64_t a1)
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"TVPPlaybackDidStallNotification" object:WeakRetained];
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_939(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = [a5 objectForKey:@"Post loading state key"];
  long long v7 = +[TVPPlaybackState paused];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = [WeakRetained AVQueuePlayer];

  if (v9) {
    (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(0.0, 0.0);
  }
  if (v6 == v7) {
    id v10 = @"Pause";
  }
  else {
    id v10 = @"Play";
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v11 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_940;
  v13[3] = &unk_264CC52C8;
  id v14 = v11;
  double v15 = v10;
  [v14 executeBlockAfterCurrentStateTransition:v13];

  return @"Stopped";
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_940(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:*(void *)(a1 + 40)];
}

- (TVPPlaybackDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVPPlaybackDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVPASyncPlaybackDelegate)asyncDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asyncDelegate);
  return (TVPASyncPlaybackDelegate *)WeakRetained;
}

- (void)setAsyncDelegate:(id)a3
{
}

- (BOOL)waitsAfterPreparingMediaItems
{
  return self->_waitsAfterPreparingMediaItems;
}

- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3
{
  self->_waitsAfterPreparingMediaItems = a3;
}

- (BOOL)updatesMediaRemoteInfoAutomatically
{
  return self->_updatesMediaRemoteInfoAutomatically;
}

- (BOOL)respondsToRemoteControlEvents
{
  return self->_respondsToRemoteControlEvents;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVPPlaylist)playlistInternal
{
  return self->_playlistInternal;
}

- (TVPPlaybackState)postLoadingState
{
  return self->_postLoadingState;
}

- (TVPPlaybackState)postAVKitScanningState
{
  return self->_postAVKitScanningState;
}

- (void)setPostAVKitScanningState:(id)a3
{
}

- (void)setCurrentMediaItemLoader:(id)a3
{
}

- (NSMutableDictionary)elapsedTimeObserverBlocks
{
  return self->_elapsedTimeObserverBlocks;
}

- (void)setElapsedTimeObserverBlocks:(id)a3
{
}

- (NSMutableDictionary)boundaryTimeObserverInfos
{
  return self->_boundaryTimeObserverInfos;
}

- (void)setBoundaryTimeObserverInfos:(id)a3
{
}

- (id)periodicTimeObserverToken
{
  return self->_periodicTimeObserverToken;
}

- (void)setPeriodicTimeObserverToken:(id)a3
{
}

- (id)timeJumpPeriodicObserverToken
{
  return self->_timeJumpPeriodicObserverToken;
}

- (void)setTimeJumpPeriodicObserverToken:(id)a3
{
}

- (id)highFrequencyTimeObserverToken
{
  return self->_highFrequencyTimeObserverToken;
}

- (void)setHighFrequencyTimeObserverToken:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 616);
  return self;
}

- (void)setStartTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_startTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_startTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startingSeekPrecision
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 640);
  return self;
}

- (void)setStartingSeekPrecision:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_startingSeekPrecision.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_startingSeekPrecision.value = v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (TVPPlayerBookmarkMonitor)bookmarkMonitor
{
  return self->_bookmarkMonitor;
}

- (void)setBookmarkMonitor:(id)a3
{
}

- (TVPPlayerReporter)playerReporter
{
  return self->_playerReporter;
}

- (void)setPlayerReporter:(id)a3
{
}

- (int64_t)numOutstandingSeeks
{
  return self->_numOutstandingSeeks;
}

- (void)setNumOutstandingSeeks:(int64_t)a3
{
  self->_numOutstandingSeeks = a3;
}

- (NSHashTable)videoViewWeakReferences
{
  return self->_videoViewWeakReferences;
}

- (void)setVideoViewWeakReferences:(id)a3
{
}

- (NSMutableSet)mediaItemLoaders
{
  return self->_mediaItemLoaders;
}

- (void)setMediaItemLoaders:(id)a3
{
}

- (BOOL)handleRemoteCommandsWithoutUpdatingMediaRemote
{
  return self->_handleRemoteCommandsWithoutUpdatingMediaRemote;
}

- (void)setHandleRemoteCommandsWithoutUpdatingMediaRemote:(BOOL)a3
{
  self->_handleRemoteCommandsWithoutUpdatingMediaRemote = a3;
}

- (BOOL)pausesOnRouteChange
{
  return self->_pausesOnRouteChange;
}

- (void)setPausesOnRouteChange:(BOOL)a3
{
  self->_pausesOnRouteChange = a3;
}

- (BOOL)updatesBookmarks
{
  return self->_updatesBookmarks;
}

- (BOOL)sendsPlayerReports
{
  return self->_sendsPlayerReports;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimeSentToAVKitImageHandler
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 664);
  return self;
}

- (void)setLastTimeSentToAVKitImageHandler:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastTimeSentToAVKitImageHandler.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_lastTimeSentToAVKitImageHandler.value = v3;
}

- (BOOL)pausesOnHDCPProtectionDown
{
  return self->_pausesOnHDCPProtectionDown;
}

- (void)setPausesOnHDCPProtectionDown:(BOOL)a3
{
  self->_pausesOnHDCPProtectionDown = a3;
}

- (int64_t)currentMediaItemVideoRange
{
  return self->_currentMediaItemVideoRange;
}

- (void)setCurrentMediaItemVideoRange:(int64_t)a3
{
  self->_currentMediaItemVideoRange = a3;
}

- (int64_t)currentMediaItemAudioFormat
{
  return self->_currentMediaItemAudioFormat;
}

- (void)setCurrentMediaItemAudioFormat:(int64_t)a3
{
  self->_currentMediaItemAudioFormat = a3;
}

- (int64_t)currentMediaItemAudioChannels
{
  return self->_currentMediaItemAudioChannels;
}

- (void)setCurrentMediaItemAudioChannels:(int64_t)a3
{
  self->_currentMediaItemAudioChannels = a3;
}

- (NSArray)pendingSelectedMediaArray
{
  return self->_pendingSelectedMediaArray;
}

- (void)setPendingSelectedMediaArray:(id)a3
{
}

- (BOOL)wasMutedPriorToScreenRecording
{
  return self->_wasMutedPriorToScreenRecording;
}

- (void)setWasMutedPriorToScreenRecording:(BOOL)a3
{
  self->_wasMutedPriorToScreenRecording = a3;
}

- (NSString)preferredAudioLanguageCode
{
  return self->_preferredAudioLanguageCode;
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
}

- (BOOL)prefersAudioDescriptions
{
  return self->_prefersAudioDescriptions;
}

- (void)setPrefersAudioDescriptions:(BOOL)a3
{
  self->_prefersAudioDescriptions = a3;
}

- (OS_dispatch_queue)avAssetTrackInspectionQueue
{
  return self->_avAssetTrackInspectionQueue;
}

- (void)setAvAssetTrackInspectionQueue:(id)a3
{
}

- (NSMutableDictionary)reportingValues
{
  return self->_reportingValues;
}

- (void)setReportingValues:(id)a3
{
}

- (BOOL)loadingInitialItemInPlaylist
{
  return self->_loadingInitialItemInPlaylist;
}

- (void)setLoadingInitialItemInPlaylist:(BOOL)a3
{
  self->_loadingInitialItemInPlaylist = a3;
}

- (TVPPlayerItem)currentPlayerItem
{
  return self->_currentPlayerItem;
}

- (BOOL)modifyingAVPlayerRate
{
  return self->_modifyingAVPlayerRate;
}

- (void)setModifyingAVPlayerRate:(BOOL)a3
{
  self->_modifyingAVPlayerRate = a3;
}

- (BOOL)modifyingAVPlayerQueue
{
  return self->_modifyingAVPlayerQueue;
}

- (void)setModifyingAVPlayerQueue:(BOOL)a3
{
  self->_modifyingAVPlayerQueue = a3;
}

- (BOOL)playerItemChangeIsHappening
{
  return self->_playerItemChangeIsHappening;
}

- (void)setPlayerItemChangeIsHappening:(BOOL)a3
{
  self->_playerItemChangeIsHappening = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeBeingSeekedTo
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 688);
  return self;
}

- (NSDate)dateBeingSeekedTo
{
  return self->_dateBeingSeekedTo;
}

- (void)setDateBeingSeekedTo:(id)a3
{
}

- (NSDate)playbackDateAtStartOfSeek
{
  return self->_playbackDateAtStartOfSeek;
}

- (void)setPlaybackDateAtStartOfSeek:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtStartOfSeek
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 712);
  return self;
}

- (void)setTimeAtStartOfSeek:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timeAtStartOfSeek.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_timeAtStartOfSeek.value = v3;
}

- (int64_t)currentDirectionOfPlaylistChange
{
  return self->_currentDirectionOfPlaylistChange;
}

- (void)setCurrentDirectionOfPlaylistChange:(int64_t)a3
{
  self->_currentDirectionOfPlaylistChange = a3;
}

- (id)chapterBoundaryTimeObserverToken
{
  return self->_chapterBoundaryTimeObserverToken;
}

- (void)setChapterBoundaryTimeObserverToken:(id)a3
{
}

- (TVPExternalImagePlayer)externalImagePlayer
{
  return self->_externalImagePlayer;
}

- (void)setExternalImagePlayer:(id)a3
{
}

- (id)interstitialBoundaryTimeObserverToken
{
  return self->_interstitialBoundaryTimeObserverToken;
}

- (void)setInterstitialBoundaryTimeObserverToken:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedElapsedCMTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 736);
  return self;
}

- (void)setCachedElapsedCMTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_cachedElapsedCMTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_cachedElapsedCMTime.value = v3;
}

- (TVPProgressiveJumpingScrubber)progressiveJumpingScrubber
{
  return self->_progressiveJumpingScrubber;
}

- (void)setProgressiveJumpingScrubber:(id)a3
{
}

- (NSString)mediaItemChangeReason
{
  return self->_mediaItemChangeReason;
}

- (void)setMediaItemChangeReason:(id)a3
{
}

- (BOOL)sceneCompletelyBuffered
{
  return self->_sceneCompletelyBuffered;
}

- (void)setSceneCompletelyBuffered:(BOOL)a3
{
  self->_sceneCompletelyBuffered = a3;
}

- (NSMutableArray)asyncDelegateOperations
{
  return self->_asyncDelegateOperations;
}

- (void)setAsyncDelegateOperations:(id)a3
{
}

- (NSNumber)temporarySubtitleOverrideType
{
  return self->_temporarySubtitleOverrideType;
}

- (void)setTemporarySubtitleOverrideType:(id)a3
{
}

- (NSArray)playbackEndTimeBoundaryObserverTokens
{
  return self->_playbackEndTimeBoundaryObserverTokens;
}

- (void)setPlaybackEndTimeBoundaryObserverTokens:(id)a3
{
}

- (TVPAudioOption)cachedSelectedAudioOption
{
  return self->_cachedSelectedAudioOption;
}

- (void)setCachedSelectedAudioOption:(id)a3
{
}

- (AVQueuePlayer)earlyAVQueuePlayer
{
  return self->_earlyAVQueuePlayer;
}

- (void)setEarlyAVQueuePlayer:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 760);
  return self;
}

- (NSArray)cachedLoadedTimeRanges
{
  return self->_cachedLoadedTimeRanges;
}

- (NSArray)cachedSeekableTimeRanges
{
  return self->_cachedSeekableTimeRanges;
}

- (AVQueuePlayer)AVQueuePlayer
{
  return self->_AVQueuePlayer;
}

- (TVPPlayerItem)playerItemFromCacheManager
{
  return self->_playerItemFromCacheManager;
}

- (void)setPlayerItemFromCacheManager:(id)a3
{
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  return self->_outputObscuredDueToInsufficientExternalProtection;
}

- (void)setOutputObscuredDueToInsufficientExternalProtection:(BOOL)a3
{
  self->_outputObscuredDueToInsufficientExternalProtection = a3;
}

- (double)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(double)a3
{
  self->_startPosition = a3;
}

- (CGSize)iFramePrefetchMaxSize
{
  double width = self->_iFramePrefetchMaxSize.width;
  double height = self->_iFramePrefetchMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIFramePrefetchMaxSize:(CGSize)a3
{
  self->_iFramePrefetchMaxSize = a3;
}

- (BOOL)asyncDelegateInProgress
{
  return self->_asyncDelegateInProgress;
}

- (void)setAsyncDelegateInProgress:(BOOL)a3
{
  self->_asyncDelegateInProgress = a3;
}

- (BOOL)usesLegacyDelegateBehavior
{
  return self->_usesLegacyDelegateBehavior;
}

- (void)setUsesLegacyDelegateBehavior:(BOOL)a3
{
  self->_usesLegacyDelegateBehavior = a3;
}

- (id)highFrequencyElapsedTimeObserverBlock
{
  return self->_highFrequencyElapsedTimeObserverBlock;
}

- (BOOL)createsPlayerItemButDoesNotEnqueue
{
  return self->_createsPlayerItemButDoesNotEnqueue;
}

- (void)setCreatesPlayerItemButDoesNotEnqueue:(BOOL)a3
{
  self->_createsPlayerItemButDoesNotEnqueue = a3;
}

- (AVPlayerItem)unqueuedPlayerItem
{
  return self->_unqueuedPlayerItem;
}

- (void)setUnqueuedPlayerItem:(id)a3
{
}

- (id)AVKitExternalImageScanningUpdateBlock
{
  return self->_AVKitExternalImageScanningUpdateBlock;
}

- (void)setAVKitExternalImageScanningUpdateBlock:(id)a3
{
}

- (BOOL)mediaRemoteUpdatingEnabled
{
  return self->_mediaRemoteUpdatingEnabled;
}

- (BOOL)remainLoadingWhenSeekCompletes
{
  return self->_remainLoadingWhenSeekCompletes;
}

- (void)setRemainLoadingWhenSeekCompletes:(BOOL)a3
{
  self->_remainLoadingWhenSeekCompletes = a3;
}

- (BOOL)initialMediaItemHasCompletedInitialLoading
{
  return self->_initialMediaItemHasCompletedInitialLoading;
}

- (void)setInitialMediaItemHasCompletedInitialLoading:(BOOL)a3
{
  self->_initialMediaItemHasCompletedInitialLoading = a3;
}

- (BOOL)haveEverEnqueuedPlayerItem
{
  return self->_haveEverEnqueuedPlayerItem;
}

- (void)setHaveEverEnqueuedPlayerItem:(BOOL)a3
{
  self->_haveEverEnqueuedPlayerItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_AVKitExternalImageScanningUpdateBlock, 0);
  objc_storeStrong((id *)&self->_unqueuedPlayerItem, 0);
  objc_storeStrong(&self->_highFrequencyElapsedTimeObserverBlock, 0);
  objc_storeStrong((id *)&self->_playerItemFromCacheManager, 0);
  objc_storeStrong((id *)&self->_AVQueuePlayer, 0);
  objc_storeStrong((id *)&self->_cachedSeekableTimeRanges, 0);
  objc_storeStrong((id *)&self->_cachedLoadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_earlyAVQueuePlayer, 0);
  objc_storeStrong((id *)&self->_cachedSelectedAudioOption, 0);
  objc_storeStrong((id *)&self->_playbackEndTimeBoundaryObserverTokens, 0);
  objc_storeStrong((id *)&self->_temporarySubtitleOverrideType, 0);
  objc_storeStrong((id *)&self->_asyncDelegateOperations, 0);
  objc_storeStrong((id *)&self->_mediaItemChangeReason, 0);
  objc_storeStrong((id *)&self->_progressiveJumpingScrubber, 0);
  objc_storeStrong(&self->_interstitialBoundaryTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_externalImagePlayer, 0);
  objc_storeStrong(&self->_chapterBoundaryTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_playbackDateAtStartOfSeek, 0);
  objc_storeStrong((id *)&self->_dateBeingSeekedTo, 0);
  objc_storeStrong((id *)&self->_currentPlayerItem, 0);
  objc_storeStrong((id *)&self->_reportingValues, 0);
  objc_storeStrong((id *)&self->_avAssetTrackInspectionQueue, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, 0);
  objc_storeStrong((id *)&self->_pendingSelectedMediaArray, 0);
  objc_storeStrong((id *)&self->_mediaItemLoaders, 0);
  objc_storeStrong((id *)&self->_videoViewWeakReferences, 0);
  objc_storeStrong((id *)&self->_playerReporter, 0);
  objc_storeStrong((id *)&self->_bookmarkMonitor, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_highFrequencyTimeObserverToken, 0);
  objc_storeStrong(&self->_timeJumpPeriodicObserverToken, 0);
  objc_storeStrong(&self->_periodicTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_boundaryTimeObserverInfos, 0);
  objc_storeStrong((id *)&self->_elapsedTimeObserverBlocks, 0);
  objc_storeStrong((id *)&self->_currentMediaItemLoader, 0);
  objc_storeStrong((id *)&self->_postAVKitScanningState, 0);
  objc_storeStrong((id *)&self->_postLoadingState, 0);
  objc_storeStrong((id *)&self->_playlistInternal, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_reportingCategory, 0);
  objc_storeStrong((id *)&self->_subtitleOptions, 0);
  objc_storeStrong((id *)&self->_audioOptions, 0);
  objc_storeStrong((id *)&self->_currentInterstitial, 0);
  objc_storeStrong((id *)&self->_currentInterstitialCollection, 0);
  objc_storeStrong((id *)&self->_currentChapter, 0);
  objc_storeStrong((id *)&self->_currentChapterCollection, 0);
  objc_storeStrong((id *)&self->_chapterCollections, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_asyncDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __38__TVPPlayer__playerDidBecomeInactive___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Error deactivating audio session: %@", (uint8_t *)&v2, 0xCu);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_737_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Not issuing seek because it's invalid or indefinite", v2, v3, v4, v5, v6);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "mediaserverd died; restarting current media item", v2, v3, v4, v5, v6);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Stopping due to error", v2, v3, v4, v5, v6);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_3(void *a1, id *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id WeakRetained = objc_loadWeakRetained(a2);
  uint64_t v5 = [WeakRetained currentDirectionOfPlaylistChange];
  uint8_t v6 = @"previous";
  if (!v5) {
    uint8_t v6 = @"next";
  }
  int v7 = 138412290;
  uint64_t v8 = v6;
  _os_log_error_impl(&dword_236FC5000, v3, OS_LOG_TYPE_ERROR, "Changing to %@ media item due to error", (uint8_t *)&v7, 0xCu);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236FC5000, v0, v1, "Stopping because every item in the playlist failed", v2, v3, v4, v5, v6);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_919_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_236FC5000, a2, OS_LOG_TYPE_ERROR, "Error occurred: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end