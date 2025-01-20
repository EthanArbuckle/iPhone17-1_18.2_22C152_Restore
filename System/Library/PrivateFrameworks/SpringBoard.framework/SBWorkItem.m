@interface SBWorkItem
- (NSDate)creationDate;
- (SBWorkItem)initWithWork:(id)a3;
- (id)work;
@end

@implementation SBWorkItem

- (SBWorkItem)initWithWork:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBWorkItem;
  v5 = [(SBWorkItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    uint64_t v8 = [v4 copy];
    id workBlock = v5->_workBlock;
    v5->_id workBlock = (id)v8;
  }
  return v5;
}

- (id)work
{
  return self->_workBlock;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

@end