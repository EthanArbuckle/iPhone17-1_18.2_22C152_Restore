@interface SUSimpleTableDataSource
- (Class)cellConfigurationClass;
- (NSArray)objects;
- (double)cellHeightForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)objectForIndexPath:(id)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)configureCell:(id)a3 forIndexPath:(id)a4;
- (void)dealloc;
- (void)reloadCellContexts;
- (void)setCellConfigurationClass:(Class)a3;
- (void)setObjects:(id)a3;
@end

@implementation SUSimpleTableDataSource

- (void)dealloc
{
  self->_cellConfigurationClass = 0;
  self->_objects = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUSimpleTableDataSource;
  [(SUTableDataSource *)&v3 dealloc];
}

- (id)objectForIndexPath:(id)a3
{
  objects = self->_objects;
  uint64_t v4 = objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "globalRowForRowAtIndexPath:", a3);

  return [(NSArray *)objects objectAtIndex:v4];
}

- (id)cellForIndexPath:(id)a3
{
  id result = (id)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource", a3), "dequeueReusableCellWithIdentifier:", @"0");
  if (!result)
  {
    uint64_t v4 = [[SUTableCell alloc] initWithStyle:0 reuseIdentifier:@"0"];
    return v4;
  }
  return result;
}

- (double)cellHeightForIndexPath:(id)a3
{
  [(objc_class *)self->_cellConfigurationClass rowHeightForContext:0 representedObject:0];
  return result;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  uint64_t v6 = objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "globalRowForRowAtIndexPath:", a4);
  id v7 = [(SUTableDataSource *)self cachedConfigurationForClass:self->_cellConfigurationClass index:v6];
  objc_msgSend(v7, "setRepresentedObject:", -[NSArray objectAtIndex:](self->_objects, "objectAtIndex:", v6));

  [a3 setConfiguration:v7];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return [(NSArray *)self->_objects count];
}

- (void)reloadCellContexts
{
  v5.receiver = self;
  v5.super_class = (Class)SUSimpleTableDataSource;
  [(SUTableDataSource *)&v5 reloadCellContexts];
  id v3 = [(SUVariableCellConfigurationCache *)self->super._configurationCache cacheForClass:self->_cellConfigurationClass];
  uint64_t v4 = (void *)[(objc_class *)self->_cellConfigurationClass copyDefaultContext];
  [v3 setCellContext:v4];
}

- (Class)cellConfigurationClass
{
  return self->_cellConfigurationClass;
}

- (void)setCellConfigurationClass:(Class)a3
{
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

@end