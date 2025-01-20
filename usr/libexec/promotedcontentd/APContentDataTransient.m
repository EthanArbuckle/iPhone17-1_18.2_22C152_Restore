@interface APContentDataTransient
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)clickLocation;
- (APContentDataTransient)init;
- (APContentDataTransient)initWithCoder:(id)a3;
- (APContentDataTransientDelegate)delegate;
- (BOOL)carouselFinishedSent;
- (BOOL)discarded;
- (BOOL)hasBeenOnScreen;
- (BOOL)hasConfirmed50PercentImpression;
- (BOOL)hasConfirmedClick;
- (BOOL)hasConfirmedImpression;
- (BOOL)hasDuration;
- (BOOL)interfaceReady;
- (BOOL)interfaceReplaced;
- (BOOL)pendingConfirmedClick;
- (BOOL)playbackInProgress;
- (BOOL)videoUnloadedSent;
- (BOOL)wasFullyVisible;
- (NSArray)carouselElementsPartiallyVisible;
- (NSArray)carouselElementsVisible;
- (NSMutableOrderedSet)sentStatusCodes;
- (double)accumulated50PercentVisibilityTime;
- (double)accumulatedPlaybackTime;
- (double)accumulatedVisibilityTime;
- (double)carousel50PercentVisibleTime;
- (double)carouselVisibleTime;
- (double)clickTime;
- (double)duration;
- (double)lastPlaybackTimestamp;
- (double)lastPosition;
- (double)lastSentEventTime;
- (double)timeSpent;
- (double)volume;
- (int)clickCount;
- (int)clickedCarouselElement;
- (int)impressionSequenceNumber;
- (int)lastStatusCode;
- (int)videoEventSequence;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setAccumulated50PercentVisibilityTime:(double)a3;
- (void)setAccumulatedPlaybackTime:(double)a3;
- (void)setAccumulatedVisibilityTime:(double)a3;
- (void)setCarousel50PercentVisibleTime:(double)a3;
- (void)setCarouselElementsPartiallyVisible:(id)a3;
- (void)setCarouselElementsVisible:(id)a3;
- (void)setCarouselFinishedSent:(BOOL)a3;
- (void)setCarouselVisibleTime:(double)a3;
- (void)setClickCount:(int)a3;
- (void)setClickLocation:(id)a3;
- (void)setClickTime:(double)a3;
- (void)setClickedCarouselElement:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscarded:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setHasBeenOnScreen:(BOOL)a3;
- (void)setHasConfirmed50PercentImpression:(BOOL)a3;
- (void)setHasConfirmedClick:(BOOL)a3;
- (void)setHasConfirmedImpression:(BOOL)a3;
- (void)setInterfaceReady:(BOOL)a3;
- (void)setInterfaceReplaced:(BOOL)a3;
- (void)setLastPlaybackTimestamp:(double)a3;
- (void)setLastPosition:(double)a3;
- (void)setLastSentEventTime:(double)a3;
- (void)setLastStatusCode:(int)a3;
- (void)setPendingConfirmedClick:(BOOL)a3;
- (void)setPlaybackInProgress:(BOOL)a3;
- (void)setSentStatusCodes:(id)a3;
- (void)setTimeSpent:(double)a3;
- (void)setVideoEventSequence:(int)a3;
- (void)setVideoUnloadedSent:(BOOL)a3;
- (void)setVolume:(double)a3;
- (void)setWasFullyVisible:(BOOL)a3;
@end

@implementation APContentDataTransient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APContentDataTransient)init
{
  v7.receiver = self;
  v7.super_class = (Class)APContentDataTransient;
  v2 = [(APContentDataTransient *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastStatusCode = -1337;
    v2->_interfaceReady = 0;
    v2->_volume = -1.0;
    v2->_videoEventSequence = -1;
    v4 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    sentStatusCodes = v3->_sentStatusCodes;
    v3->_sentStatusCodes = v4;
  }
  return v3;
}

- (APContentDataTransient)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)APContentDataTransient;
  v5 = [(APContentDataTransient *)&v31 init];
  if (v5)
  {
    v5->_lastStatusCode = [v4 decodeInt32ForKey:@"lastStatusCode"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sentStatusCodes"];
    sentStatusCodes = v5->_sentStatusCodes;
    v5->_sentStatusCodes = (NSMutableOrderedSet *)v10;

    [v4 decodeDoubleForKey:@"accumulatedVisibilityTime"];
    v5->_accumulatedVisibilityTime = v12;
    [v4 decodeDoubleForKey:@"accumulated50PercentVisibilityTime"];
    v5->_accumulated50PercentVisibilityTime = v13;
    [v4 decodeDoubleForKey:@"carouselVisibleTime"];
    v5->_carouselVisibleTime = v14;
    [v4 decodeDoubleForKey:@"carousel50PercentVisibleTime"];
    v5->_carousel50PercentVisibleTime = v15;
    v5->_carouselFinishedSent = [v4 decodeBoolForKey:@"carouselFinishedSent"];
    [v4 decodeDoubleForKey:@"lastSentEventTime"];
    v5->_lastSentEventTime = v16;
    [v4 decodeDoubleForKey:@"accumulatedPlaybackTime"];
    v5->_accumulatedPlaybackTime = v17;
    [v4 decodeDoubleForKey:@"lastPlaybackTimestamp"];
    v5->_lastPlaybackTimestamp = v18;
    v5->_playbackInProgress = [v4 decodeBoolForKey:@"playbackInProgress"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v19;
    v5->_hasBeenOnScreen = [v4 decodeBoolForKey:@"hasBeenOnScreen"];
    v5->_interfaceReady = [v4 decodeBoolForKey:@"interfaceReady"];
    v5->_interfaceReplaced = [v4 decodeBoolForKey:@"interfaceReplaced"];
    v5->_wasFullyVisible = [v4 decodeBoolForKey:@"wasFullyVisible"];
    v5->_discarded = [v4 decodeBoolForKey:@"discarded"];
    v5->_hasConfirmedImpression = [v4 decodeBoolForKey:@"hasConfirmedImpression"];
    v5->_hasConfirmed50PercentImpression = [v4 decodeBoolForKey:@"hasConfirmed50PercentImpression"];
    v5->_hasConfirmedClick = [v4 decodeBoolForKey:@"hasConfirmedClick"];
    [v4 decodeDoubleForKey:@"lastPosition"];
    v5->_lastPosition = v20;
    v5->_clickedCarouselElement = [v4 decodeInt32ForKey:@"clickedCarouselElement"];
    v5->_clickCount = [v4 decodeInt32ForKey:@"clickCount"];
    [v4 decodeDoubleForKey:@"clickLocationX"];
    v5->_clickLocation.x = v21;
    [v4 decodeDoubleForKey:@"clickLocationY"];
    v5->_clickLocation.y = v22;
    [v4 decodeDoubleForKey:@"clickTime"];
    v5->_clickTime = v23;
    v5->_impressionSequenceNumber = [v4 decodeInt32ForKey:@"impressionSequenceNumber"];
    v5->_videoEventSequence = [v4 decodeInt32ForKey:@"videoEventSequence"];
    v5->_videoUnloadedSent = [v4 decodeBoolForKey:@"videoUnloadedSent"];
    [v4 decodeDoubleForKey:@"volume"];
    v5->_volume = v24;
    uint64_t v25 = [v4 decodeObjectOfClasses:v9 forKey:@"carouselElementsVisible"];
    carouselElementsVisible = v5->_carouselElementsVisible;
    v5->_carouselElementsVisible = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v9 forKey:@"carouselElementsPartiallyVisible"];
    carouselElementsPartiallyVisible = v5->_carouselElementsPartiallyVisible;
    v5->_carouselElementsPartiallyVisible = (NSArray *)v27;

    v5->_pendingConfirmedClick = [v4 decodeBoolForKey:@"pendingConfirmedClick"];
    [v4 decodeDoubleForKey:@"timeSpent"];
    v5->_timeSpent = v29;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInt32:-[APContentDataTransient lastStatusCode](self, "lastStatusCode") forKey:@"lastStatusCode"];
  id v4 = [(APContentDataTransient *)self sentStatusCodes];
  [v8 encodeObject:v4 forKey:@"sentStatusCodes"];

  [(APContentDataTransient *)self accumulatedVisibilityTime];
  [v8 encodeDouble:@"accumulatedVisibilityTime" forKey:];
  [(APContentDataTransient *)self accumulated50PercentVisibilityTime];
  [v8 encodeDouble:@"accumulated50PercentVisibilityTime" forKey:@"accumulated50PercentVisibilityTime"];
  [(APContentDataTransient *)self carouselVisibleTime];
  [v8 encodeDouble:@"carouselVisibleTime" forKey:];
  [(APContentDataTransient *)self carousel50PercentVisibleTime];
  [v8 encodeDouble:@"carousel50PercentVisibleTime" forKey:];
  [v8 encodeBool:-[APContentDataTransient carouselFinishedSent](self, "carouselFinishedSent") forKey:@"carouselFinishedSent"];
  [(APContentDataTransient *)self lastSentEventTime];
  [v8 encodeDouble:@"lastSentEventTime"];
  [(APContentDataTransient *)self accumulatedPlaybackTime];
  [v8 encodeDouble:@"accumulatedPlaybackTime"];
  [(APContentDataTransient *)self lastPlaybackTimestamp];
  [v8 encodeDouble:@"lastPlaybackTimestamp" forKey:];
  [v8 encodeBool:-[APContentDataTransient playbackInProgress](self, "playbackInProgress") forKey:@"playbackInProgress"];
  [(APContentDataTransient *)self duration];
  [v8 encodeDouble:x0 forKey:@"duration"];
  [v8 encodeBool:-[APContentDataTransient hasBeenOnScreen](self, "hasBeenOnScreen") forKey:@"hasBeenOnScreen"];
  [v8 encodeBool:-[APContentDataTransient interfaceReady](self, "interfaceReady") forKey:@"interfaceReady"];
  [v8 encodeBool:-[APContentDataTransient wasFullyVisible](self, "wasFullyVisible") forKey:@"wasFullyVisible"];
  [v8 encodeBool:-[APContentDataTransient interfaceReplaced](self, "interfaceReplaced") forKey:@"interfaceReplaced"];
  [v8 encodeBool:-[APContentDataTransient discarded](self, "discarded") forKey:@"discarded"];
  [v8 encodeBool:-[APContentDataTransient hasConfirmedImpression](self, "hasConfirmedImpression") forKey:@"hasConfirmedImpression"];
  [v8 encodeBool:-[APContentDataTransient hasConfirmed50PercentImpression](self, "hasConfirmed50PercentImpression") forKey:@"hasConfirmed50PercentImpression"];
  [v8 encodeBool:-[APContentDataTransient hasConfirmedClick](self, "hasConfirmedClick") forKey:@"hasConfirmedClick"];
  [(APContentDataTransient *)self lastPosition];
  [v8 encodeDouble:@"lastPosition"];
  [v8 encodeInt32:-[APContentDataTransient clickedCarouselElement](self, "clickedCarouselElement") forKey:@"clickedCarouselElement"];
  [v8 encodeInt32:-[APContentDataTransient clickCount](self, "clickCount") forKey:@"clickCount"];
  [(APContentDataTransient *)self clickLocation];
  [v8 encodeDouble:@"clickLocationX" forKey:];
  [(APContentDataTransient *)self clickLocation];
  [v8 encodeDouble:@"clickLocationY" forKey:v5];
  [(APContentDataTransient *)self clickTime];
  [v8 encodeDouble:clickTime forKey:@"clickTime"];
  [v8 encodeInt32:-[APContentDataTransient impressionSequenceNumber](self, "impressionSequenceNumber") forKey:@"impressionSequenceNumber"];
  [v8 encodeInt32:-[APContentDataTransient videoEventSequence](self, "videoEventSequence") forKey:@"videoEventSequence"];
  [v8 encodeBool:-[APContentDataTransient videoUnloadedSent](self, "videoUnloadedSent") forKey:@"videoUnloadedSent"];
  [(APContentDataTransient *)self volume];
  [v8 encodeDouble:@"volume" forKey:];
  v6 = [(APContentDataTransient *)self carouselElementsVisible];
  [v8 encodeObject:v6 forKey:@"carouselElementsVisible"];

  uint64_t v7 = [(APContentDataTransient *)self carouselElementsPartiallyVisible];
  [v8 encodeObject:v7 forKey:@"carouselElementsPartiallyVisible"];

  [v8 encodeBool:-[APContentDataTransient pendingConfirmedClick](self, "pendingConfirmedClick") forKey:@"pendingConfirmedClick"];
  [(APContentDataTransient *)self timeSpent];
  [v8 encodeDouble:@"timeSpent"];
}

- (BOOL)hasDuration
{
  [(APContentDataTransient *)self duration];
  return v2 > 0.01;
}

- (void)save
{
  id v2 = [(APContentDataTransient *)self delegate];
  [v2 transientDataDidChange];
}

- (int)impressionSequenceNumber
{
  return self->_impressionSequenceNumber;
}

- (APContentDataTransientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APContentDataTransientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)lastStatusCode
{
  return self->_lastStatusCode;
}

- (void)setLastStatusCode:(int)a3
{
  self->_lastStatusCode = a3;
}

- (NSArray)carouselElementsVisible
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCarouselElementsVisible:(id)a3
{
}

- (NSArray)carouselElementsPartiallyVisible
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCarouselElementsPartiallyVisible:(id)a3
{
}

- (int)clickedCarouselElement
{
  return self->_clickedCarouselElement;
}

- (void)setClickedCarouselElement:(int)a3
{
  self->_clickedCarouselElement = a3;
}

- (BOOL)carouselFinishedSent
{
  return self->_carouselFinishedSent;
}

- (void)setCarouselFinishedSent:(BOOL)a3
{
  self->_carouselFinishedSent = a3;
}

- (BOOL)hasBeenOnScreen
{
  return self->_hasBeenOnScreen;
}

- (void)setHasBeenOnScreen:(BOOL)a3
{
  self->_hasBeenOnScreen = a3;
}

- (BOOL)interfaceReady
{
  return self->_interfaceReady;
}

- (void)setInterfaceReady:(BOOL)a3
{
  self->_interfaceReady = a3;
}

- (BOOL)interfaceReplaced
{
  return self->_interfaceReplaced;
}

- (void)setInterfaceReplaced:(BOOL)a3
{
  self->_interfaceReplaced = a3;
}

- (BOOL)wasFullyVisible
{
  return self->_wasFullyVisible;
}

- (void)setWasFullyVisible:(BOOL)a3
{
  self->_wasFullyVisible = a3;
}

- (double)clickTime
{
  return self->_clickTime;
}

- (void)setClickTime:(double)a3
{
  self->_clickTime = a3;
}

- (double)accumulatedVisibilityTime
{
  return self->_accumulatedVisibilityTime;
}

- (void)setAccumulatedVisibilityTime:(double)a3
{
  self->_accumulatedVisibilityTime = a3;
}

- (double)accumulated50PercentVisibilityTime
{
  return self->_accumulated50PercentVisibilityTime;
}

- (void)setAccumulated50PercentVisibilityTime:(double)a3
{
  self->_accumulated50PercentVisibilityTime = a3;
}

- (double)carouselVisibleTime
{
  return self->_carouselVisibleTime;
}

- (void)setCarouselVisibleTime:(double)a3
{
  self->_carouselVisibleTime = a3;
}

- (double)carousel50PercentVisibleTime
{
  return self->_carousel50PercentVisibleTime;
}

- (void)setCarousel50PercentVisibleTime:(double)a3
{
  self->_carousel50PercentVisibleTime = a3;
}

- (double)lastSentEventTime
{
  return self->_lastSentEventTime;
}

- (void)setLastSentEventTime:(double)a3
{
  self->_lastSentEventTime = a3;
}

- (double)lastPlaybackTimestamp
{
  return self->_lastPlaybackTimestamp;
}

- (void)setLastPlaybackTimestamp:(double)a3
{
  self->_lastPlaybackTimestamp = a3;
}

- (double)timeSpent
{
  return self->_timeSpent;
}

- (void)setTimeSpent:(double)a3
{
  self->_timeSpent = a3;
}

- (double)accumulatedPlaybackTime
{
  return self->_accumulatedPlaybackTime;
}

- (void)setAccumulatedPlaybackTime:(double)a3
{
  self->_accumulatedPlaybackTime = a3;
}

- (BOOL)playbackInProgress
{
  return self->_playbackInProgress;
}

- (void)setPlaybackInProgress:(BOOL)a3
{
  self->_playbackInProgress = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)lastPosition
{
  return self->_lastPosition;
}

- (void)setLastPosition:(double)a3
{
  self->_lastPosition = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (int)videoEventSequence
{
  return self->_videoEventSequence;
}

- (void)setVideoEventSequence:(int)a3
{
  self->_videoEventSequence = a3;
}

- (BOOL)videoUnloadedSent
{
  return self->_videoUnloadedSent;
}

- (void)setVideoUnloadedSent:(BOOL)a3
{
  self->_videoUnloadedSent = a3;
}

- (BOOL)hasConfirmedImpression
{
  return self->_hasConfirmedImpression;
}

- (void)setHasConfirmedImpression:(BOOL)a3
{
  self->_hasConfirmedImpression = a3;
}

- (BOOL)hasConfirmed50PercentImpression
{
  return self->_hasConfirmed50PercentImpression;
}

- (void)setHasConfirmed50PercentImpression:(BOOL)a3
{
  self->_hasConfirmed50PercentImpression = a3;
}

- (BOOL)hasConfirmedClick
{
  return self->_hasConfirmedClick;
}

- (void)setHasConfirmedClick:(BOOL)a3
{
  self->_hasConfirmedClick = a3;
}

- (int)clickCount
{
  return self->_clickCount;
}

- (void)setClickCount:(int)a3
{
  self->_clickCount = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)clickLocation
{
  objc_copyStruct(v4, &self->_clickLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setClickLocation:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3 = a3;
  objc_copyStruct(&self->_clickLocation, &v3, 16, 1, 0);
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (void)setDiscarded:(BOOL)a3
{
  self->_discarded = a3;
}

- (BOOL)pendingConfirmedClick
{
  return self->_pendingConfirmedClick;
}

- (void)setPendingConfirmedClick:(BOOL)a3
{
  self->_pendingConfirmedClick = a3;
}

- (NSMutableOrderedSet)sentStatusCodes
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSentStatusCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentStatusCodes, 0);
  objc_storeStrong((id *)&self->_carouselElementsPartiallyVisible, 0);
  objc_storeStrong((id *)&self->_carouselElementsVisible, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end