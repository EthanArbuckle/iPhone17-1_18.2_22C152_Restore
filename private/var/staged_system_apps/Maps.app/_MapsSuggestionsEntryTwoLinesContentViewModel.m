@interface _MapsSuggestionsEntryTwoLinesContentViewModel
- (BOOL)hasVibrantBackground;
- (MapsSuggestionsEntry)observedEntry;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setObservedEntry:(id)a3;
@end

@implementation _MapsSuggestionsEntryTwoLinesContentViewModel

- (void)dealloc
{
  [(_MapsSuggestionsEntryTwoLinesContentViewModel *)self setObservedEntry:0];
  v3.receiver = self;
  v3.super_class = (Class)_MapsSuggestionsEntryTwoLinesContentViewModel;
  [(_BasicTwoLinesContentViewModel *)&v3 dealloc];
}

- (void)setObservedEntry:(id)a3
{
  v5 = (MapsSuggestionsEntry *)a3;
  p_observedEntry = &self->_observedEntry;
  observedEntry = self->_observedEntry;
  if (observedEntry != v5)
  {
    v8 = v5;
    [(MapsSuggestionsEntry *)observedEntry removeObserver:self forKeyPath:@"title"];
    [(MapsSuggestionsEntry *)*p_observedEntry removeObserver:self forKeyPath:@"subtitle"];
    objc_storeStrong((id *)&self->_observedEntry, a3);
    [(MapsSuggestionsEntry *)*p_observedEntry addObserver:self forKeyPath:@"title" options:1 context:0];
    [(MapsSuggestionsEntry *)*p_observedEntry addObserver:self forKeyPath:@"subtitle" options:1 context:0];
    v5 = v8;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(_MapsSuggestionsEntryTwoLinesContentViewModel *)self observedEntry];
  if (v10 == v9)
  {
    if ([v8 isEqualToString:@"title"])
    {
    }
    else
    {
      unsigned __int8 v11 = [v8 isEqualToString:@"subtitle"];

      if ((v11 & 1) == 0) {
        goto LABEL_3;
      }
    }
    v12 = [(_MapsSuggestionsEntryTwoLinesContentViewModel *)self observedEntry];
    v13 = [v12 title];
    [(_BasicTwoLinesContentViewModel *)self setTitleText:v13];

    v14 = [(_MapsSuggestionsEntryTwoLinesContentViewModel *)self observedEntry];
    v15 = [v14 subtitle];
    [(_BasicTwoLinesContentViewModel *)self setSubtitleText:v15];

    if (+[NSThread isMainThread])
    {
      [(_BasicTwoLinesContentViewModel *)self updateObservers];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100A12A80;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
  }
LABEL_3:
}

- (BOOL)hasVibrantBackground
{
  v2 = [(_MapsSuggestionsEntryTwoLinesContentViewModel *)self observedEntry];
  unsigned __int8 v3 = [v2 hasVibrantBackground];

  return v3;
}

- (MapsSuggestionsEntry)observedEntry
{
  return self->_observedEntry;
}

- (void).cxx_destruct
{
}

@end