@interface MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications
- (NSMutableArray)addedOutputDevices;
- (NSMutableArray)changedOutputDevices;
- (NSMutableArray)removedOutputDevices;
- (id)description;
- (void)addOutputDevice:(id)a3;
- (void)changeOutputDevice:(id)a3;
- (void)removeOutputDevice:(id)a3;
- (void)setAddedOutputDevices:(id)a3;
- (void)setChangedOutputDevices:(id)a3;
- (void)setRemovedOutputDevices:(id)a3;
@end

@implementation MRDAVHostedExternalDevicePendingClientStateOutputDeviceModifications

- (id)description
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithString:@"{\n"];
  if ([(NSMutableArray *)self->_addedOutputDevices count])
  {
    v4 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"   addedOutputDevices = %@\n", v4];
  }
  if ([(NSMutableArray *)self->_changedOutputDevices count])
  {
    v5 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    changedOutputDevices = %@\n", v5];
  }
  if ([(NSMutableArray *)self->_removedOutputDevices count])
  {
    v6 = MRCreateIndentedDebugDescriptionFromObject();
    [v3 appendFormat:@"    removedOutputDevices = %@\n", v6];
  }

  return v3;
}

- (void)addOutputDevice:(id)a3
{
  id v4 = a3;
  addedOutputDevices = self->_addedOutputDevices;
  id v8 = v4;
  if (!addedOutputDevices)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_addedOutputDevices;
    self->_addedOutputDevices = v6;

    id v4 = v8;
    addedOutputDevices = self->_addedOutputDevices;
  }
  [(NSMutableArray *)addedOutputDevices addObject:v4];
  [(NSMutableArray *)self->_changedOutputDevices removeObject:v8];
  [(NSMutableArray *)self->_removedOutputDevices removeObject:v8];
}

- (void)changeOutputDevice:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableArray indexOfObject:](self->_addedOutputDevices, "indexOfObject:");
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    changedOutputDevices = self->_changedOutputDevices;
    if (!changedOutputDevices)
    {
      v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v7 = self->_changedOutputDevices;
      self->_changedOutputDevices = v6;

      changedOutputDevices = self->_changedOutputDevices;
    }
    [(NSMutableArray *)changedOutputDevices addObject:v8];
  }
  else
  {
    [(NSMutableArray *)self->_addedOutputDevices replaceObjectAtIndex:v4 withObject:v8];
  }
}

- (void)removeOutputDevice:(id)a3
{
  id v8 = a3;
  id v4 = -[NSMutableArray indexOfObject:](self->_addedOutputDevices, "indexOfObject:");
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    removedOutputDevices = self->_removedOutputDevices;
    if (!removedOutputDevices)
    {
      v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v7 = self->_removedOutputDevices;
      self->_removedOutputDevices = v6;

      removedOutputDevices = self->_removedOutputDevices;
    }
    [(NSMutableArray *)removedOutputDevices addObject:v8];
    [(NSMutableArray *)self->_changedOutputDevices removeObject:v8];
  }
  else
  {
    [(NSMutableArray *)self->_addedOutputDevices removeObjectAtIndex:v4];
  }
}

- (NSMutableArray)addedOutputDevices
{
  return self->_addedOutputDevices;
}

- (void)setAddedOutputDevices:(id)a3
{
}

- (NSMutableArray)changedOutputDevices
{
  return self->_changedOutputDevices;
}

- (void)setChangedOutputDevices:(id)a3
{
}

- (NSMutableArray)removedOutputDevices
{
  return self->_removedOutputDevices;
}

- (void)setRemovedOutputDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedOutputDevices, 0);
  objc_storeStrong((id *)&self->_changedOutputDevices, 0);

  objc_storeStrong((id *)&self->_addedOutputDevices, 0);
}

@end