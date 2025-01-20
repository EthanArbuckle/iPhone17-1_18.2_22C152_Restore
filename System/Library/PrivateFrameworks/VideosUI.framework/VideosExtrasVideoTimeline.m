@interface VideosExtrasVideoTimeline
- (NSArray)events;
- (VideosExtrasVideoTimeline)initWithTimelineElements:(id)a3;
- (id)description;
- (id)eventForTime:(double)a3;
@end

@implementation VideosExtrasVideoTimeline

- (VideosExtrasVideoTimeline)initWithTimelineElements:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 count])
  {
    v18.receiver = self;
    v18.super_class = (Class)VideosExtrasVideoTimeline;
    v7 = [(VideosExtrasVideoTimeline *)&v18 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_timelineElements, a3);
      v9 = [MEMORY[0x1E4F1CA48] array];
      v10 = [(NSArray *)v8->_timelineElements firstObject];
      v11 = v10;
      if (v10)
      {
        v12 = [v10 events];
        if (v12)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54__VideosExtrasVideoTimeline_initWithTimelineElements___block_invoke;
          v16[3] = &unk_1E6DFBD68;
          v17 = v9;
          [v12 enumerateObjectsUsingBlock:v16];
        }
      }
      events = v8->_events;
      v8->_events = v9;
    }
    self = v8;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __54__VideosExtrasVideoTimeline_initWithTimelineElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3)
  {
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1];
  }
  else
  {
    id v5 = 0;
  }
  v6 = [[VideosExtrasVideoTimelineEvent alloc] initWithElement:v7 prev:v5];
  [(VideosExtrasVideoTimelineEvent *)v6 setIsFirstEvent:a3 == 0];
  [v5 setNext:v6];
  [*(id *)(a1 + 32) addObject:v6];
}

- (id)eventForTime:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_events;
  id v5 = (id)[(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "offset", (void)v14);
        if (v9 <= a3)
        {
          [v8 offset];
          double v11 = v10;
          [v8 duration];
          if (v11 + v12 > a3)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
      }
      id v5 = (id)[(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<VideoTimeline numEvents:%ld>\n", -[NSArray count](self->_events, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_events;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
        [v3 appendFormat:@"%@\n", v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"<VideoTimeline>"];
  return v3;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_timelineElements, 0);
}

@end