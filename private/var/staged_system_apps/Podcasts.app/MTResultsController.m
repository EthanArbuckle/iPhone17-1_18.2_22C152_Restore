@interface MTResultsController
- (BOOL)hasObjects;
- (MTResultsControllerDelegate)delegate;
- (NSString)title;
- (id)allObjects;
- (id)description;
- (id)indexPathForObject:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexPath:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)numberOfObjects;
- (unint64_t)numberOfObjectsInSection:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTResultsController

- (void)setDelegate:(id)a3
{
}

- (id)description
{
  v3 = [(MTResultsController *)self title];
  v4 = [(MTResultsController *)self allObjects];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Section: %@ (%lu)", v3, [v4 count]);

  return v5;
}

- (id)objectAtIndexPath:(id)a3
{
  return 0;
}

- (id)indexPathForObject:(id)a3
{
  return 0;
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  return 0;
}

- (id)allObjects
{
  return 0;
}

- (unint64_t)indexOfObject:(id)a3
{
  v3 = [(MTResultsController *)self indexPathForObject:a3];
  v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 row];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v4 = +[NSIndexPath indexPathForRow:a3 inSection:0];
  unint64_t v5 = [(MTResultsController *)self objectAtIndexPath:v4];

  return v5;
}

- (unint64_t)numberOfObjects
{
  v2 = [(MTResultsController *)self allObjects];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (BOOL)hasObjects
{
  return [(MTResultsController *)self numberOfObjects] != 0;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (MTResultsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (MTResultsControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->title, 0);
}

@end