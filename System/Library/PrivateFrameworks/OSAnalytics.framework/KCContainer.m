@interface KCContainer
- (KCContainer)initWithKCData:(kcdata_iter)a3;
- (NSMutableDictionary)data;
- (NSMutableDictionary)truncated_threads;
- (int)invalid_images;
- (int)pid;
- (int)unindexed_frames;
- (unint64_t)tag;
- (unsigned)type;
- (void)omit;
- (void)setInvalid_images:(int)a3;
- (void)setPid:(int)a3;
- (void)setUnindexed_frames:(int)a3;
@end

@implementation KCContainer

- (KCContainer)initWithKCData:(kcdata_iter)a3
{
  kcdata_item_t item = a3.item;
  v11.receiver = self;
  v11.super_class = (Class)KCContainer;
  v4 = [(KCContainer *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = item[1].type;
    v4->_tag = item->flags;
    uint64_t v6 = objc_opt_new();
    data = v5->_data;
    v5->_data = (NSMutableDictionary *)v6;

    if (v5->_type == 2307)
    {
      uint64_t v8 = objc_opt_new();
      truncated_threads = v5->_truncated_threads;
      v5->_truncated_threads = (NSMutableDictionary *)v8;
    }
    else
    {
      truncated_threads = v5->_truncated_threads;
      v5->_truncated_threads = 0;
    }
  }
  return v5;
}

- (void)omit
{
  self->_data = 0;
  MEMORY[0x1F41817F8]();
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)tag
{
  return self->_tag;
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSMutableDictionary)truncated_threads
{
  return self->_truncated_threads;
}

- (int)unindexed_frames
{
  return self->_unindexed_frames;
}

- (void)setUnindexed_frames:(int)a3
{
  self->_unindexed_frames = a3;
}

- (int)invalid_images
{
  return self->_invalid_images;
}

- (void)setInvalid_images:(int)a3
{
  self->_invalid_images = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncated_threads, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end