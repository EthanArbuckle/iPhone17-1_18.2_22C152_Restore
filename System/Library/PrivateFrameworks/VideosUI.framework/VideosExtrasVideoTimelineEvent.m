@interface VideosExtrasVideoTimelineEvent
- (BOOL)isFirstEvent;
- (NSString)subHeader;
- (NSString)title;
- (VideosExtrasVideoTimelineEvent)initWithElement:(id)a3 prev:(id)a4;
- (VideosExtrasVideoTimelineEvent)next;
- (VideosExtrasVideoTimelineEvent)previous;
- (double)duration;
- (double)offset;
- (id)description;
- (void)loadImage:(id)a3;
- (void)setIsFirstEvent:(BOOL)a3;
- (void)setNext:(id)a3;
@end

@implementation VideosExtrasVideoTimelineEvent

- (VideosExtrasVideoTimelineEvent)initWithElement:(id)a3 prev:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasVideoTimelineEvent;
  v8 = [(VideosExtrasVideoTimelineEvent *)&v16 init];
  if (v8)
  {
    v9 = [v6 relatedContent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = [v6 relatedContent];
      lockup = v8->_lockup;
      v8->_lockup = (IKLockupElement *)v11;
    }
    [v6 offset];
    v8->_offset = v13;
    [v6 duration];
    v8->_duration = v14;
    objc_storeWeak((id *)&v8->_previous, v7);
  }

  return v8;
}

- (NSString)title
{
  v2 = [(IKLockupElement *)self->_lockup title];
  v3 = [v2 text];
  v4 = [v3 string];

  return (NSString *)v4;
}

- (NSString)subHeader
{
  v2 = [(IKLockupElement *)self->_lockup subtitle];
  v3 = [v2 text];
  v4 = [v3 string];

  return (NSString *)v4;
}

- (void)loadImage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    lockup = self->_lockup;
    if (lockup
      && ([(IKLockupElement *)lockup image],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      id v7 = [(IKLockupElement *)self->_lockup image];
      v8 = [v7 artworkCatalog];

      double v9 = 100.0;
      double v10 = 75.0;
      v16.origin.x = 0.0;
      v16.origin.y = 0.0;
      v16.size.width = 100.0;
      v16.size.height = 75.0;
      if (CGRectIsEmpty(v16))
      {
        uint64_t v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v11 bounds];
        double v9 = v12;
        double v10 = v13;
      }
      objc_msgSend(v8, "setFittingSize:", v9, v10);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__VideosExtrasVideoTimelineEvent_loadImage___block_invoke;
      v14[3] = &unk_1E6DFBD40;
      id v15 = v4;
      [v8 setDestination:self configurationBlock:v14];
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __44__VideosExtrasVideoTimelineEvent_loadImage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)description
{
  v3 = NSString;
  id v4 = [(IKLockupElement *)self->_lockup title];
  v5 = [v4 text];
  id v6 = [v3 stringWithFormat:@"<Event title: %@, offset: %f, duration: %f>", v5, *(void *)&self->_offset, *(void *)&self->_duration];

  return v6;
}

- (BOOL)isFirstEvent
{
  return self->_isFirstEvent;
}

- (void)setIsFirstEvent:(BOOL)a3
{
  self->_isFirstEvent = a3;
}

- (double)offset
{
  return self->_offset;
}

- (double)duration
{
  return self->_duration;
}

- (VideosExtrasVideoTimelineEvent)previous
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previous);
  return (VideosExtrasVideoTimelineEvent *)WeakRetained;
}

- (VideosExtrasVideoTimelineEvent)next
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_next);
  return (VideosExtrasVideoTimelineEvent *)WeakRetained;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_next);
  objc_destroyWeak((id *)&self->_previous);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
}

@end