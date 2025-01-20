@interface ICLiveLinkQueueEventPlaybackModeChanged
- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedAutoPlayEnabled:(BOOL)a3;
- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedRepeatType:(int64_t)a3;
- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedShuffleType:(int64_t)a3;
- (id)autoPlayEnabled;
- (id)description;
- (id)repeatType;
- (id)shuffleType;
- (int64_t)kind;
@end

@implementation ICLiveLinkQueueEventPlaybackModeChanged

- (void).cxx_destruct
{
  objc_storeStrong(&self->_autoPlayEnabled, 0);
  objc_storeStrong(&self->_repeatType, 0);

  objc_storeStrong(&self->_shuffleType, 0);
}

- (id)autoPlayEnabled
{
  return self->_autoPlayEnabled;
}

- (id)repeatType
{
  return self->_repeatType;
}

- (id)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  int64_t kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(NSString, "stringWithFormat:", @"<ICLiveLinkQueueEventPlaybackModeChanged: %p unknown/invalid>", self, v14);
      goto LABEL_9;
    case 1:
      v11 = NSString;
      unint64_t v12 = (*((uint64_t (**)(void))self->_shuffleType + 2))();
      if (v12 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/shuffleType=%ld", v12);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E5ACBAD8[v12];
      }
      [v11 stringWithFormat:@"<ICLiveLinkQueueEventPlaybackModeChanged: %p shuffleType=%@>", self, v6];
      goto LABEL_16;
    case 2:
      v4 = NSString;
      unint64_t v5 = (*((uint64_t (**)(void))self->_repeatType + 2))();
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown/repeatType=%ld", v5);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E5ACBAF8[v5];
      }
      [v4 stringWithFormat:@"<ICLiveLinkQueueEventPlaybackModeChanged: %p repeatType=%@>", self, v6];
      v10 = LABEL_16:;

      goto LABEL_17;
    case 3:
      v7 = NSString;
      int v8 = (*((uint64_t (**)(void))self->_autoPlayEnabled + 2))();
      v9 = @"NO";
      if (v8) {
        v9 = @"YES";
      }
      [v7 stringWithFormat:@"<ICLiveLinkQueueEventPlaybackModeChanged: %p autoPlayEnabled=%@>", self, v9];
      goto LABEL_9;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"<ICLiveLinkQueueEventPlaybackModeChanged: %p unknown/kind=%ld>", self, kind);
      v10 = LABEL_9:;
LABEL_17:
      return v10;
  }
}

- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedAutoPlayEnabled:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ICLiveLinkQueueEventPlaybackModeChanged;
  v4 = [(ICLiveLinkQueueEventPlaybackModeChanged *)&v11 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t kind = 3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke;
    v9[3] = &__block_descriptor_33_e5_B8__0l;
    BOOL v10 = a3;
    uint64_t v6 = [v9 copy];
    id autoPlayEnabled = v5->_autoPlayEnabled;
    v5->_id autoPlayEnabled = (id)v6;
  }
  return v5;
}

uint64_t __74__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedAutoPlayEnabled___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedRepeatType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICLiveLinkQueueEventPlaybackModeChanged;
  v4 = [(ICLiveLinkQueueEventPlaybackModeChanged *)&v10 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t kind = 2;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke;
    v9[3] = &__block_descriptor_40_e5_q8__0l;
    void v9[4] = a3;
    uint64_t v6 = [v9 copy];
    id repeatType = v5->_repeatType;
    v5->_id repeatType = (id)v6;
  }
  return v5;
}

uint64_t __69__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedRepeatType___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (ICLiveLinkQueueEventPlaybackModeChanged)initWithUpdatedShuffleType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICLiveLinkQueueEventPlaybackModeChanged;
  v4 = [(ICLiveLinkQueueEventPlaybackModeChanged *)&v10 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_int64_t kind = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke;
    v9[3] = &__block_descriptor_40_e5_q8__0l;
    void v9[4] = a3;
    uint64_t v6 = [v9 copy];
    id shuffleType = v5->_shuffleType;
    v5->_id shuffleType = (id)v6;
  }
  return v5;
}

uint64_t __70__ICLiveLinkQueueEventPlaybackModeChanged_initWithUpdatedShuffleType___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

@end