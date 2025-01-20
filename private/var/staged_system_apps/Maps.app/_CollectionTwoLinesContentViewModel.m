@interface _CollectionTwoLinesContentViewModel
- (CollectionHandler)collection;
- (void)collectionHandlerInfoUpdated:(id)a3;
- (void)setCollection:(id)a3;
@end

@implementation _CollectionTwoLinesContentViewModel

- (void)setCollection:(id)a3
{
  v5 = (CollectionHandler *)a3;
  v6 = v5;
  p_collection = &self->_collection;
  if (self->_collection != v5)
  {
    v9 = v5;
    unsigned __int8 v8 = -[CollectionHandler isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      [(CollectionHandler *)*p_collection removeObserver:self];
      objc_storeStrong((id *)&self->_collection, a3);
      [(CollectionHandler *)*p_collection addObserver:self];
      v6 = v9;
    }
  }
}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  v4 = (CollectionHandler *)a3;
  v7 = v4;
  if (self->_collection == v4 || -[CollectionHandler isEqual:](v4, "isEqual:"))
  {
    v5 = [(CollectionHandler *)v7 title];
    [(_BasicTwoLinesContentViewModel *)self setTitleText:v5];

    v6 = [(CollectionHandler *)v7 subtitle];
    [(_BasicTwoLinesContentViewModel *)self setSubtitleText:v6];

    [(_BasicTwoLinesContentViewModel *)self updateObservers];
  }
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
}

@end