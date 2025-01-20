@interface _TUIFeedCaptureSectionLoader
- (NSDictionary)bindings;
- (NSURL)templateURL;
- (NSUUID)uuid;
- (_TUIFeedCaptureSectionLoader)initWithTemplateURL:(id)a3 uuid:(id)a4 bindings:(id)a5;
- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5;
- (id)replyBlock;
- (void)_update;
- (void)updateTemplateURL:(id)a3 bindings:(id)a4;
@end

@implementation _TUIFeedCaptureSectionLoader

- (_TUIFeedCaptureSectionLoader)initWithTemplateURL:(id)a3 uuid:(id)a4 bindings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_TUIFeedCaptureSectionLoader;
  v11 = [(_TUIFeedCaptureSectionLoader *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = (NSURL *)[v8 copy];
    templateURL = v12->_templateURL;
    v12->_templateURL = v13;

    v15 = (NSUUID *)[v9 copy];
    uuid = v12->_uuid;
    v12->_uuid = v15;

    v17 = (NSDictionary *)[v10 copy];
    bindings = v12->_bindings;
    v12->_bindings = v17;
  }
  return v12;
}

- (id)feedEntry:(id)a3 requestDataWithPriority:(float)a4 block:(id)a5
{
  p_lock = &self->_lock;
  id v7 = a5;
  os_unfair_lock_lock(p_lock);
  id v8 = [v7 copy];

  id replyBlock = self->_replyBlock;
  self->_id replyBlock = v8;

  os_unfair_lock_unlock(p_lock);
  [(_TUIFeedCaptureSectionLoader *)self _update];
  return 0;
}

- (void)updateTemplateURL:(id)a3 bindings:(id)a4
{
  v6 = (NSURL *)a3;
  id v7 = (NSDictionary *)a4;
  templateURL = self->_templateURL;
  self->_templateURL = v6;
  id v9 = v6;

  bindings = self->_bindings;
  self->_bindings = v7;

  [(_TUIFeedCaptureSectionLoader *)self _update];
}

- (void)_update
{
  bindings = self->_bindings;
  templateURL = self->_templateURL;
  v10[0] = @"template";
  v10[1] = @"data";
  v5 = (NSDictionary *)&__NSDictionary0__struct;
  if (bindings) {
    v5 = bindings;
  }
  v11[0] = templateURL;
  v11[1] = v5;
  v6 = bindings;
  id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = (void (**)(id, uint64_t, void *))objc_retainBlock(self->_replyBlock);
  os_unfair_lock_unlock(p_lock);

  v9[2](v9, 1, v7);
}

- (NSURL)templateURL
{
  return self->_templateURL;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDictionary)bindings
{
  return self->_bindings;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyBlock, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_templateURL, 0);
}

@end