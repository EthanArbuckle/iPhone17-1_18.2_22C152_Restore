@interface _UIDragMonitorSessionPresentationUpdate
- (NSArray)previewUpdates;
- (_UIDragMonitorSessionBadgeUpdate)badgeUpdate;
- (_UIDragMonitorSessionPresentationUpdate)initWithDragPresentationUpdate:(id)a3;
- (_UIDragMonitorSessionPresentationUpdate)initWithDragPreviewUpdates:(id)a3 badgeUpdate:(id)a4;
- (_UIDragMonitorSessionPresentationUpdate)initWithPreviewUpdates:(id)a3 badgeUpdate:(id)a4;
- (void)setBadgeUpdate:(id)a3;
- (void)setPreviewUpdates:(id)a3;
@end

@implementation _UIDragMonitorSessionPresentationUpdate

- (_UIDragMonitorSessionPresentationUpdate)initWithPreviewUpdates:(id)a3 badgeUpdate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragMonitorSessionPresentationUpdate;
  v9 = [(_UIDragMonitorSessionPresentationUpdate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previewUpdates, a3);
    objc_storeStrong((id *)&v10->_badgeUpdate, a4);
  }

  return v10;
}

- (_UIDragMonitorSessionPresentationUpdate)initWithDragPreviewUpdates:(id)a3 badgeUpdate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
          v15 = [_UIDragMonitorSessionPreviewUpdate alloc];
          v16 = -[_UIDragMonitorSessionPreviewUpdate initWithPreviewAndImageComponentUpdate:](v15, "initWithPreviewAndImageComponentUpdate:", v14, (void)v19);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  v17 = -[_UIDragMonitorSessionPresentationUpdate initWithPreviewUpdates:badgeUpdate:](self, "initWithPreviewUpdates:badgeUpdate:", v8, v7, (void)v19);

  return v17;
}

- (_UIDragMonitorSessionPresentationUpdate)initWithDragPresentationUpdate:(id)a3
{
  id v4 = a3;
  v5 = -[_UIDragMonitorSessionBadgeUpdate initWithDragBadgeStyle:]([_UIDragMonitorSessionBadgeUpdate alloc], "initWithDragBadgeStyle:", [v4 badgeStyle]);
  id v6 = [v4 modifiedPreviews];

  id v7 = [(_UIDragMonitorSessionPresentationUpdate *)self initWithDragPreviewUpdates:v6 badgeUpdate:v5];
  return v7;
}

- (NSArray)previewUpdates
{
  return self->_previewUpdates;
}

- (void)setPreviewUpdates:(id)a3
{
}

- (_UIDragMonitorSessionBadgeUpdate)badgeUpdate
{
  return self->_badgeUpdate;
}

- (void)setBadgeUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeUpdate, 0);
  objc_storeStrong((id *)&self->_previewUpdates, 0);
}

@end