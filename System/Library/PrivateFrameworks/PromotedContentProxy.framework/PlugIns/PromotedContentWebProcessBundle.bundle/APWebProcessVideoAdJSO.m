@interface APWebProcessVideoAdJSO
- (APWebProcessVideoAdJSO)init;
- (APWebProcessVideoAdJSODelegate)delegate;
- (BOOL)hasDestination;
- (BOOL)hasDestinationURL;
- (NSMutableDictionary)listenersDictionary;
- (NSString)adMarkerHeight;
- (NSString)adMarkerWidth;
- (NSString)cornerRadius;
- (NSString)deviceContentSize;
- (NSString)deviceLanguage;
- (NSString)fontSize;
- (NSString)localizedAdMarkerText;
- (NSString)localizedLearnMoreText;
- (NSString)videoAssetURLString;
- (id)getAdMarkerHeight;
- (id)getAdMarkerWidth;
- (id)getCornerRadius;
- (id)getDeviceContentSize;
- (id)getDeviceLanguage;
- (id)getFontSize;
- (id)getLocalizedAdMarkerText;
- (id)getLocalizedLearnMoreText;
- (id)getVideoAssetURL;
- (os_unfair_lock_s)unfairLock;
- (unsigned)playFailedRequestCount;
- (unsigned)unfairLockOptions;
- (void)_callListenersOfContentSizeChange;
- (void)addEventListener:(id)a3 listener:(id)a4;
- (void)contentSizeDidChange:(id)a3;
- (void)creativeViewLoaded;
- (void)exitFullScreenTapped:(float)a3 atVolume:(float)a4;
- (void)fullScreenTapped:(float)a3 atVolume:(float)a4;
- (void)lock;
- (void)moreInfoTapped:(float)a3 atVolume:(float)a4;
- (void)playCompletedAtVolume:(float)a3;
- (void)playFailed:(id)a3;
- (void)playPaused:(float)a3 atVolume:(float)a4;
- (void)playResumed:(float)a3 atVolume:(float)a4;
- (void)playStarted:(float)a3 atVolume:(float)a4;
- (void)playTimeUpdated:(float)a3 atVolume:(float)a4;
- (void)removeEventListener:(id)a3 listener:(id)a4;
- (void)setAdMarkerHeight:(id)a3;
- (void)setAdMarkerWidth:(id)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceContentSize:(id)a3;
- (void)setDeviceLanguage:(id)a3;
- (void)setFontSize:(id)a3;
- (void)setHasDestination:(BOOL)a3;
- (void)setListenersDictionary:(id)a3;
- (void)setLocalizedAdMarkerText:(id)a3;
- (void)setLocalizedLearnMoreText:(id)a3;
- (void)setPlayFailedRequestCount:(unsigned __int8)a3;
- (void)setUnfairLock:(os_unfair_lock_s)a3;
- (void)setUnfairLockOptions:(unsigned int)a3;
- (void)setVideoAssetURLString:(id)a3;
- (void)skipAdTapped:(float)a3 atVolume:(float)a4;
- (void)unlock;
- (void)videoTapped:(float)a3 atVolume:(float)a4;
- (void)viewabilityChanged:(BOOL)a3 playtime:(float)a4 atVolume:(float)a5;
- (void)volumeChanged:(float)a3 playtime:(float)a4;
- (void)volumeMuted:(float)a3;
- (void)volumeUnmuted:(float)a3 atVolume:(float)a4;
@end

@implementation APWebProcessVideoAdJSO

- (APWebProcessVideoAdJSO)init
{
  v7.receiver = self;
  v7.super_class = (Class)APWebProcessVideoAdJSO;
  v2 = [(APWebProcessVideoAdJSO *)&v7 init];
  v3 = (APWebProcessVideoAdJSO *)v2;
  if (v2)
  {
    *(void *)(v2 + 12) = 0x1000000000000;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    listenersDictionary = v3->_listenersDictionary;
    v3->_listenersDictionary = v4;

    v3->_playFailedRequestCount = 0;
  }
  return v3;
}

- (id)getVideoAssetURL
{
  return [(APWebProcessVideoAdJSO *)self videoAssetURLString];
}

- (BOOL)hasDestinationURL
{
  return [(APWebProcessVideoAdJSO *)self hasDestination];
}

- (id)getAdMarkerHeight
{
  return [(APWebProcessVideoAdJSO *)self adMarkerHeight];
}

- (id)getAdMarkerWidth
{
  return [(APWebProcessVideoAdJSO *)self adMarkerWidth];
}

- (id)getFontSize
{
  return [(APWebProcessVideoAdJSO *)self fontSize];
}

- (id)getDeviceLanguage
{
  return [(APWebProcessVideoAdJSO *)self deviceLanguage];
}

- (id)getDeviceContentSize
{
  return [(APWebProcessVideoAdJSO *)self deviceContentSize];
}

- (id)getCornerRadius
{
  return [(APWebProcessVideoAdJSO *)self cornerRadius];
}

- (id)getLocalizedAdMarkerText
{
  return [(APWebProcessVideoAdJSO *)self localizedAdMarkerText];
}

- (id)getLocalizedLearnMoreText
{
  return [(APWebProcessVideoAdJSO *)self localizedLearnMoreText];
}

- (void)contentSizeDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForKey:@"AdMarkerHeight"];
  [(APWebProcessVideoAdJSO *)self setAdMarkerHeight:v5];

  v6 = [v4 valueForKey:@"AdMarkerWidth"];
  [(APWebProcessVideoAdJSO *)self setAdMarkerWidth:v6];

  objc_super v7 = [v4 valueForKey:@"FontSize"];
  [(APWebProcessVideoAdJSO *)self setFontSize:v7];

  v8 = [v4 valueForKey:@"DeviceContentSize"];
  [(APWebProcessVideoAdJSO *)self setDeviceContentSize:v8];

  v9 = [v4 valueForKey:@"CornerRadius"];

  [(APWebProcessVideoAdJSO *)self setCornerRadius:v9];

  [(APWebProcessVideoAdJSO *)self _callListenersOfContentSizeChange];
}

- (void)playFailed:(id)a3
{
  id v4 = a3;
  if ([(APWebProcessVideoAdJSO *)self playFailedRequestCount] < 2)
  {
    if ((unint64_t)[v4 length] >= 0x1F5)
    {
      uint64_t v6 = [v4 substringToIndex:500];

      objc_super v7 = sub_5D38();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 138478083;
        uint64_t v12 = objc_opt_class();
        __int16 v13 = 2114;
        CFStringRef v14 = @"Play failed error description truncated to 500 characters.";
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "[%{private}@] %{public}@", (uint8_t *)&v11, 0x16u);
      }

      id v4 = (id)v6;
    }
    v8 = [(APWebProcessVideoAdJSO *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(APWebProcessVideoAdJSO *)self delegate];
      [v10 webProcessVideoAdJSOMediaPlaybackFailedWithErrorDescription:v4];

      [(APWebProcessVideoAdJSO *)self setPlayFailedRequestCount:([(APWebProcessVideoAdJSO *)self playFailedRequestCount] + 1)];
    }
  }
  else
  {
    v5 = sub_5D38();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_97BC((uint64_t)self, v5);
    }
  }
}

- (void)creativeViewLoaded
{
  v3 = [(APWebProcessVideoAdJSO *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(APWebProcessVideoAdJSO *)self delegate];
    [v5 webProcessVideoAdJSOCreativeViewLoaded];
  }
}

- (void)playStarted:(float)a3 atVolume:(float)a4
{
  objc_super v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOPlayStarted:v9 volume:v10];
  }
}

- (void)playResumed:(float)a3 atVolume:(float)a4
{
  objc_super v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOPlayResumed:v9 volume:v10];
  }
}

- (void)playTimeUpdated:(float)a3 atVolume:(float)a4
{
  objc_super v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOPlayProgressed:v9 volume:v10];
  }
}

- (void)playPaused:(float)a3 atVolume:(float)a4
{
  objc_super v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOPlayPaused:v9 volume:v10];
  }
}

- (void)playCompletedAtVolume:(float)a3
{
  id v5 = [(APWebProcessVideoAdJSO *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v7 = a3;
    [v8 webProcessVideoAdJSOPlayCompletedWithVolume:v7];
  }
}

- (void)volumeChanged:(float)a3 playtime:(float)a4
{
  double v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOVolumeChanged:v9 playTime:v10];
  }
}

- (void)volumeMuted:(float)a3
{
  id v5 = [(APWebProcessVideoAdJSO *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v7 = a3;
    [v8 webProcessVideoAdJSOAudioMuted:v7];
  }
}

- (void)volumeUnmuted:(float)a3 atVolume:(float)a4
{
  double v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOAudioUnmuted:v9 volume:v10];
  }
}

- (void)viewabilityChanged:(BOOL)a3 playtime:(float)a4 atVolume:(float)a5
{
  BOOL v7 = a3;
  double v9 = [(APWebProcessVideoAdJSO *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v13 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v11 = a4;
    *(float *)&double v12 = a5;
    [v13 webProcessVideoAdJSOViewabilityChanged:v7 playTime:v11 volume:v12];
  }
}

- (void)moreInfoTapped:(float)a3 atVolume:(float)a4
{
  BOOL v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOMoreInfoTapped:v9 volume:v10];
  }
}

- (void)videoTapped:(float)a3 atVolume:(float)a4
{
  BOOL v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOVideoTapped:v9 volume:v10];
  }
}

- (void)skipAdTapped:(float)a3 atVolume:(float)a4
{
  BOOL v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOSkipAdTapped:v9 volume:v10];
  }
}

- (void)fullScreenTapped:(float)a3 atVolume:(float)a4
{
  BOOL v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOFullScreenTapped:v9 volume:v10];
  }
}

- (void)exitFullScreenTapped:(float)a3 atVolume:(float)a4
{
  BOOL v7 = [(APWebProcessVideoAdJSO *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v11 = [(APWebProcessVideoAdJSO *)self delegate];
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 webProcessVideoAdJSOExitFullScreenTapped:v9 volume:v10];
  }
}

- (void)addEventListener:(id)a3 listener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_5D38();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CFStringRef v14 = 138478083;
    *(void *)&v14[4] = objc_opt_class();
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v6;
    id v9 = *(id *)&v14[4];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "[%{private}@] Adding event listener of type: %{public}@", v14, 0x16u);
  }
  id v10 = [v6 length];
  if (v7 && v10)
  {
    [(APWebProcessVideoAdJSO *)self lock];
    id v11 = [(APWebProcessVideoAdJSO *)self listenersDictionary];
    double v12 = [v11 objectForKeyedSubscript:v6];

    if (!v12)
    {
      double v12 = +[NSMutableArray array];
      id v13 = [(APWebProcessVideoAdJSO *)self listenersDictionary];
      [v13 setObject:v12 forKey:v6];
    }
    if ((objc_msgSend(v12, "containsObject:", v7, *(_OWORD *)v14, *(void *)&v14[16]) & 1) == 0) {
      [v12 addObject:v7];
    }
    [(APWebProcessVideoAdJSO *)self unlock];
  }
}

- (void)removeEventListener:(id)a3 listener:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = sub_5D38();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138478083;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2114;
    id v16 = v6;
    id v9 = v14;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "[%{private}@] Removing event listener of type: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if (v6)
  {
    id v10 = [v6 length];
    if (v7)
    {
      if (v10)
      {
        [(APWebProcessVideoAdJSO *)self lock];
        id v11 = [(APWebProcessVideoAdJSO *)self listenersDictionary];
        double v12 = [v11 objectForKeyedSubscript:v6];
        [v12 removeObject:v7];

        [(APWebProcessVideoAdJSO *)self unlock];
      }
    }
  }
}

- (void)_callListenersOfContentSizeChange
{
  v3 = sub_5D38();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2114;
    CFStringRef v24 = @"contentSizeChange";
    id v4 = v22;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "[%{private}@] Calling listeners of event %{public}@.", buf, 0x16u);
  }
  [(APWebProcessVideoAdJSO *)self lock];
  id v5 = [(APWebProcessVideoAdJSO *)self listenersDictionary];
  id v6 = [v5 objectForKeyedSubscript:@"contentSizeChange"];
  id v7 = [v6 copy];

  [(APWebProcessVideoAdJSO *)self unlock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        id v14 = +[NSArray array];
        id v15 = [v13 callWithArguments:v14];

        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (NSString)videoAssetURLString
{
  return self->_videoAssetURLString;
}

- (void)setVideoAssetURLString:(id)a3
{
}

- (BOOL)hasDestination
{
  return self->_hasDestination;
}

- (void)setHasDestination:(BOOL)a3
{
  self->_hasDestination = a3;
}

- (NSString)adMarkerHeight
{
  return self->_adMarkerHeight;
}

- (void)setAdMarkerHeight:(id)a3
{
}

- (NSString)adMarkerWidth
{
  return self->_adMarkerWidth;
}

- (void)setAdMarkerWidth:(id)a3
{
}

- (NSString)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(id)a3
{
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (void)setDeviceLanguage:(id)a3
{
}

- (NSString)deviceContentSize
{
  return self->_deviceContentSize;
}

- (void)setDeviceContentSize:(id)a3
{
}

- (NSString)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
}

- (NSString)localizedAdMarkerText
{
  return self->_localizedAdMarkerText;
}

- (void)setLocalizedAdMarkerText:(id)a3
{
}

- (NSString)localizedLearnMoreText
{
  return self->_localizedLearnMoreText;
}

- (void)setLocalizedLearnMoreText:(id)a3
{
}

- (APWebProcessVideoAdJSODelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APWebProcessVideoAdJSODelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)listenersDictionary
{
  return self->_listenersDictionary;
}

- (void)setListenersDictionary:(id)a3
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (unsigned)unfairLockOptions
{
  return self->_unfairLockOptions;
}

- (void)setUnfairLockOptions:(unsigned int)a3
{
  self->_unfairLockOptions = a3;
}

- (unsigned)playFailedRequestCount
{
  return self->_playFailedRequestCount;
}

- (void)setPlayFailedRequestCount:(unsigned __int8)a3
{
  self->_playFailedRequestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenersDictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localizedLearnMoreText, 0);
  objc_storeStrong((id *)&self->_localizedAdMarkerText, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_deviceContentSize, 0);
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_fontSize, 0);
  objc_storeStrong((id *)&self->_adMarkerWidth, 0);
  objc_storeStrong((id *)&self->_adMarkerHeight, 0);

  objc_storeStrong((id *)&self->_videoAssetURLString, 0);
}

@end