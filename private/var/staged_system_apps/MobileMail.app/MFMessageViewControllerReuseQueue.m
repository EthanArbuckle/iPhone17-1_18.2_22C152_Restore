@interface MFMessageViewControllerReuseQueue
- (ComposeCapable)scene;
- (MFMessageViewControllerReuseQueue)initWithScene:(id)a3;
- (NSMutableDictionary)messageViewControllers;
- (NSMutableOrderedSet)keyOrdering;
- (id)_dequeueLeastRecentlyUsedMessageViewController;
- (id)_dequeueMessageViewControllerForKey:(id)a3;
- (id)debugDescription;
- (id)dequeueMessageViewControllerForContentRequest:(id)a3;
- (unint64_t)generatedMessageViewControllersCount;
- (void)_evictLeastRecentlyUsedMessageViewControllers;
- (void)drain;
- (void)enqueueMessageViewController:(id)a3;
- (void)setGeneratedMessageViewControllersCount:(unint64_t)a3;
- (void)setKeyOrdering:(id)a3;
- (void)setMessageViewControllers:(id)a3;
- (void)setScene:(id)a3;
@end

@implementation MFMessageViewControllerReuseQueue

- (MFMessageViewControllerReuseQueue)initWithScene:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFMessageViewControllerReuseQueue;
  v5 = [(MFMessageViewControllerReuseQueue *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    keyOrdering = v6->_keyOrdering;
    v6->_keyOrdering = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageViewControllers = v6->_messageViewControllers;
    v6->_messageViewControllers = v9;
  }
  return v6;
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(MFMessageViewControllerReuseQueue *)self generatedMessageViewControllersCount];
  v5 = [(MFMessageViewControllerReuseQueue *)self keyOrdering];
  v6 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
  v7 = +[NSString stringWithFormat:@"<%@:%p (\n\tgenerated:%lu\n\tkeyOrdering: %@\n\tmessageViewControllers:%@)", v3, self, v4, v5, v6];

  return v7;
}

- (id)_dequeueMessageViewControllerForKey:(id)a3
{
  id v4 = a3;
  v5 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
    [v7 removeObjectForKey:v4];

    v8 = [(MFMessageViewControllerReuseQueue *)self keyOrdering];
    [v8 removeObject:v4];
  }

  return v6;
}

- (id)_dequeueLeastRecentlyUsedMessageViewController
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(MFMessageViewControllerReuseQueue *)self keyOrdering];
  id v4 = [v3 reverseObjectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v4);
      }
      v8 = [(MFMessageViewControllerReuseQueue *)self _dequeueMessageViewControllerForKey:*(void *)(*((void *)&v10 + 1) + 8 * v7)];
      if (v8) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

- (void)_evictLeastRecentlyUsedMessageViewControllers
{
  while (1)
  {
    uint64_t v3 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
    id v4 = [v3 count];

    if ((unint64_t)v4 < 6) {
      break;
    }
    id v5 = [(MFMessageViewControllerReuseQueue *)self _dequeueLeastRecentlyUsedMessageViewController];
  }
}

- (id)dequeueMessageViewControllerForContentRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 itemID];
  uint64_t v6 = [(MFMessageViewControllerReuseQueue *)self _dequeueMessageViewControllerForKey:v5];
  if (v6)
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v6;
      v8 = "#MVCReuseQueue ← [%@: %@]";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v19, 0x16u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ([(MFMessageViewControllerReuseQueue *)self generatedMessageViewControllersCount] < 5)goto LABEL_9; {
  v9 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
  }
  id v10 = [v9 count];

  if (!v10) {
    goto LABEL_9;
  }
  long long v11 = [(MFMessageViewControllerReuseQueue *)self _dequeueLeastRecentlyUsedMessageViewController];
  [(MFMessageViewController *)v11 prepareForReuse];
  long long v12 = MFLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    v20 = v5;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#MVCReuseQueue ⇠ [%@: %@]", (uint8_t *)&v19, 0x16u);
  }

  if (!v11)
  {
LABEL_9:
    long long v13 = [MFMessageViewController alloc];
    v14 = [(MFMessageViewControllerReuseQueue *)self scene];
    v15 = +[UIApplication sharedApplication];
    v16 = [v15 accountsController];
    uint64_t v6 = [(MFMessageViewController *)v13 initWithScene:v14 accountsController:v16];

    [(MFMessageViewControllerReuseQueue *)self setGeneratedMessageViewControllersCount:(char *)[(MFMessageViewControllerReuseQueue *)self generatedMessageViewControllersCount]+ 1];
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v6;
      v8 = "#MVCReuseQueue + [%@: %@]";
      goto LABEL_11;
    }
LABEL_12:

    long long v11 = v6;
  }
  v17 = v11;

  return v17;
}

- (void)enqueueMessageViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contentRequest];
  uint64_t v6 = [v5 itemID];

  if (v6)
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      long long v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#MVCReuseQueue → [%@: %@]", (uint8_t *)&v10, 0x16u);
    }

    v8 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
    [v8 setObject:v4 forKey:v6];

    v9 = [(MFMessageViewControllerReuseQueue *)self keyOrdering];
    [v9 insertObject:v6 atIndex:0];
  }
  [(MFMessageViewControllerReuseQueue *)self _evictLeastRecentlyUsedMessageViewControllers];
}

- (void)drain
{
  uint64_t v3 = [(MFMessageViewControllerReuseQueue *)self messageViewControllers];
  [v3 removeAllObjects];

  id v4 = [(MFMessageViewControllerReuseQueue *)self keyOrdering];
  [v4 removeAllObjects];

  [(MFMessageViewControllerReuseQueue *)self setGeneratedMessageViewControllersCount:0];
}

- (NSMutableOrderedSet)keyOrdering
{
  return self->_keyOrdering;
}

- (void)setKeyOrdering:(id)a3
{
}

- (NSMutableDictionary)messageViewControllers
{
  return self->_messageViewControllers;
}

- (void)setMessageViewControllers:(id)a3
{
}

- (unint64_t)generatedMessageViewControllersCount
{
  return self->_generatedMessageViewControllersCount;
}

- (void)setGeneratedMessageViewControllersCount:(unint64_t)a3
{
  self->_generatedMessageViewControllersCount = a3;
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageViewControllers, 0);

  objc_storeStrong((id *)&self->_keyOrdering, 0);
}

@end