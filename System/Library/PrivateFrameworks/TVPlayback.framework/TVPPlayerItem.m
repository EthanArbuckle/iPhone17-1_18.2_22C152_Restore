@interface TVPPlayerItem
- (AVMediaSelectionOption)savedManualAudioSelection;
- (BOOL)audioSelectionIsAutomatic;
- (BOOL)muted;
- (TVImageProxy)posterProxy;
- (TVPMediaItemLoader)mediaItemLoader;
- (TVPPlayerItem)initWithAsset:(id)a3;
- (id)scrubImageLoader;
- (int64_t)previousStatus;
- (void)dealloc;
- (void)selectMediaOption:(id)a3 inMediaSelectionGroup:(id)a4;
- (void)selectMediaOptionAutomaticallyInMediaSelectionGroup:(id)a3;
- (void)setAudioSelectionIsAutomatic:(BOOL)a3;
- (void)setMediaItemLoader:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPosterProxy:(id)a3;
- (void)setPreviousStatus:(int64_t)a3;
- (void)setSavedManualAudioSelection:(id)a3;
- (void)setScrubImageLoader:(id)a3;
@end

@implementation TVPPlayerItem

- (TVPPlayerItem)initWithAsset:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVPPlayerItem;
  result = [(TVPPlayerItem *)&v4 initWithAsset:a3];
  if (result) {
    result->_audioSelectionIsAutomatic = 1;
  }
  return result;
}

- (void)dealloc
{
  [(TVImageProxy *)self->_posterProxy cancel];
  v3.receiver = self;
  v3.super_class = (Class)TVPPlayerItem;
  [(TVPPlayerItem *)&v3 dealloc];
}

- (void)selectMediaOptionAutomaticallyInMediaSelectionGroup:(id)a3
{
  id v4 = a3;
  v5 = [(TVPPlayerItem *)self asset];
  v6 = objc_msgSend(v5, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);
  int v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    [(TVPPlayerItem *)self muted];
    goto LABEL_5;
  }
  [(TVPPlayerItem *)self setAudioSelectionIsAutomatic:1];
  if (([(TVPPlayerItem *)self muted] & v7) != 1)
  {
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)TVPPlayerItem;
    [(TVPPlayerItem *)&v8 selectMediaOptionAutomaticallyInMediaSelectionGroup:v4];
    goto LABEL_6;
  }
  [(TVPPlayerItem *)self setSavedManualAudioSelection:0];
LABEL_6:
}

- (void)selectMediaOption:(id)a3 inMediaSelectionGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(TVPPlayerItem *)self asset];
  v9 = objc_msgSend(v8, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);
  int v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    [(TVPPlayerItem *)self muted];
    goto LABEL_5;
  }
  [(TVPPlayerItem *)self setAudioSelectionIsAutomatic:0];
  if (([(TVPPlayerItem *)self muted] & v10) != 1)
  {
LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)TVPPlayerItem;
    [(TVPPlayerItem *)&v11 selectMediaOption:v6 inMediaSelectionGroup:v7];
    goto LABEL_6;
  }
  [(TVPPlayerItem *)self setSavedManualAudioSelection:v6];
LABEL_6:
}

- (void)setMuted:(BOOL)a3
{
  if (self->_muted != a3)
  {
    self->_muted = a3;
    id v4 = [(TVPPlayerItem *)self asset];
    v5 = objc_msgSend(v4, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);

    if (self->_muted)
    {
      if (![(TVPPlayerItem *)self audioSelectionIsAutomatic])
      {
        id v6 = [(TVPPlayerItem *)self currentMediaSelection];
        id v7 = [v6 selectedMediaOptionInMediaSelectionGroup:v5];
        [(TVPPlayerItem *)self setSavedManualAudioSelection:v7];
      }
      v11.receiver = self;
      v11.super_class = (Class)TVPPlayerItem;
      [(TVPPlayerItem *)&v11 selectMediaOption:0 inMediaSelectionGroup:v5];
    }
    else
    {
      objc_super v8 = [(TVPPlayerItem *)self savedManualAudioSelection];
      if (v8)
      {
        v10.receiver = self;
        v10.super_class = (Class)TVPPlayerItem;
        [(TVPPlayerItem *)&v10 selectMediaOption:v8 inMediaSelectionGroup:v5];
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)TVPPlayerItem;
        [(TVPPlayerItem *)&v9 selectMediaOptionAutomaticallyInMediaSelectionGroup:v5];
      }
      [(TVPPlayerItem *)self setSavedManualAudioSelection:0];
    }
  }
}

- (TVPMediaItemLoader)mediaItemLoader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaItemLoader);
  return (TVPMediaItemLoader *)WeakRetained;
}

- (void)setMediaItemLoader:(id)a3
{
}

- (BOOL)muted
{
  return self->_muted;
}

- (int64_t)previousStatus
{
  return self->_previousStatus;
}

- (void)setPreviousStatus:(int64_t)a3
{
  self->_previousStatus = a3;
}

- (TVImageProxy)posterProxy
{
  return self->_posterProxy;
}

- (void)setPosterProxy:(id)a3
{
}

- (id)scrubImageLoader
{
  return self->_scrubImageLoader;
}

- (void)setScrubImageLoader:(id)a3
{
}

- (BOOL)audioSelectionIsAutomatic
{
  return self->_audioSelectionIsAutomatic;
}

- (void)setAudioSelectionIsAutomatic:(BOOL)a3
{
  self->_audioSelectionIsAutomatic = a3;
}

- (AVMediaSelectionOption)savedManualAudioSelection
{
  return self->_savedManualAudioSelection;
}

- (void)setSavedManualAudioSelection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedManualAudioSelection, 0);
  objc_storeStrong(&self->_scrubImageLoader, 0);
  objc_storeStrong((id *)&self->_posterProxy, 0);
  objc_destroyWeak((id *)&self->_mediaItemLoader);
}

@end