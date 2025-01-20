@interface MTIndexPathShifter
- (BOOL)isComplete;
- (NSIndexPath)initialIndexPath;
- (NSIndexPath)shiftedIndexPath;
- (void)_setIndexPath:(unint64_t)a3;
- (void)_shiftIndexPath:(unint64_t)a3;
- (void)processChangeAtIndexPath:(id)a3 forChangeType:(unint64_t)a4 newIndexPath:(id)a5;
- (void)setInitialIndexPath:(id)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setShiftedIndexPath:(id)a3;
@end

@implementation MTIndexPathShifter

- (void)setInitialIndexPath:(id)a3
{
  v5 = (NSIndexPath *)a3;
  objc_storeStrong((id *)&self->_initialIndexPath, a3);
  shiftedIndexPath = self->_shiftedIndexPath;
  self->_shiftedIndexPath = v5;

  [(MTIndexPathShifter *)self setIsComplete:0];
}

- (void)processChangeAtIndexPath:(id)a3 forChangeType:(unint64_t)a4 newIndexPath:(id)a5
{
  id v20 = a3;
  id v8 = a5;
  v9 = [(MTIndexPathShifter *)self shiftedIndexPath];
  id v10 = [v9 section];
  id v11 = [v20 section];

  if (v10 == v11 && ![(MTIndexPathShifter *)self isComplete])
  {
    switch(a4)
    {
      case 3uLL:
        v16 = [(MTIndexPathShifter *)self initialIndexPath];
        unsigned int v17 = [v20 isEqual:v16];

        if (!v17)
        {
          [(MTIndexPathShifter *)self processChangeAtIndexPath:v20 forChangeType:2 newIndexPath:0];
          [(MTIndexPathShifter *)self processChangeAtIndexPath:0 forChangeType:1 newIndexPath:v8];
          goto LABEL_3;
        }
        [(MTIndexPathShifter *)self setShiftedIndexPath:v8];
        break;
      case 2uLL:
        v18 = [(MTIndexPathShifter *)self initialIndexPath];
        id v19 = [v18 row];

        if ([v20 row] != v19)
        {
          if ([v20 row] >= v19) {
            goto LABEL_3;
          }
          v14 = self;
          uint64_t v15 = -1;
          goto LABEL_19;
        }
        [(MTIndexPathShifter *)self _setIndexPath:0x7FFFFFFFFFFFFFFFLL];
        break;
      case 1uLL:
        v12 = [(MTIndexPathShifter *)self initialIndexPath];
        id v13 = [v12 row];

        if ([v8 row] > v13) {
          goto LABEL_3;
        }
        v14 = self;
        uint64_t v15 = 1;
LABEL_19:
        [(MTIndexPathShifter *)v14 _shiftIndexPath:v15];
        goto LABEL_3;
      default:
        goto LABEL_3;
    }
    [(MTIndexPathShifter *)self setIsComplete:1];
  }
LABEL_3:
}

- (void)_shiftIndexPath:(unint64_t)a3
{
  id v5 = [(MTIndexPathShifter *)self shiftedIndexPath];
  -[MTIndexPathShifter _setIndexPath:](self, "_setIndexPath:", (char *)[v5 row] + a3);
}

- (void)_setIndexPath:(unint64_t)a3
{
  id v5 = [(MTIndexPathShifter *)self shiftedIndexPath];
  id v6 = [v5 row];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(MTIndexPathShifter *)self shiftedIndexPath];
    v7 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, [v8 section]);
    [(MTIndexPathShifter *)self setShiftedIndexPath:v7];
  }
}

- (NSIndexPath)initialIndexPath
{
  return self->_initialIndexPath;
}

- (NSIndexPath)shiftedIndexPath
{
  return self->_shiftedIndexPath;
}

- (void)setShiftedIndexPath:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftedIndexPath, 0);

  objc_storeStrong((id *)&self->_initialIndexPath, 0);
}

@end