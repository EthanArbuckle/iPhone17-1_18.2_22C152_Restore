@interface _PXFeedInlinePlaybackRecord
- (_PXFeedInlinePlaybackController)inlinePlaybackController;
- (int64_t)desiredPlayState;
- (void)setDesiredPlayState:(int64_t)a3;
- (void)setInlinePlaybackController:(id)a3;
@end

@implementation _PXFeedInlinePlaybackRecord

- (void).cxx_destruct
{
}

- (void)setInlinePlaybackController:(id)a3
{
}

- (_PXFeedInlinePlaybackController)inlinePlaybackController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inlinePlaybackController);
  return (_PXFeedInlinePlaybackController *)WeakRetained;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (void)setDesiredPlayState:(int64_t)a3
{
  id v5 = [(_PXFeedInlinePlaybackRecord *)self inlinePlaybackController];
  [v5 _playbackRecord:self setDesiredPlayState:a3];
}

@end