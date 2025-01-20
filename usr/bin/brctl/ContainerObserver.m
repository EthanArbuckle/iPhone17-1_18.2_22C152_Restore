@interface ContainerObserver
- (BRCTermDumper)dumper;
- (ContainerObserver)init;
- (NSDateFormatter)dateFormatter;
- (void)containerDidEnterBackground:(id)a3;
- (void)containerDidEnterForeground:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDumper:(id)a3;
@end

@implementation ContainerObserver

- (ContainerObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)ContainerObserver;
  v2 = [(ContainerObserver *)&v6 init];
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    [(NSDateFormatter *)v3 setDateStyle:1];
    [(NSDateFormatter *)v3 setTimeStyle:2];
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;
  }
  return v2;
}

- (void)containerDidEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = [(ContainerObserver *)self dateFormatter];
  objc_super v6 = +[NSDate date];
  id v7 = [v5 stringFromDate:v6];
  id v8 = [v7 UTF8String];

  [(BRCTermDumper *)self->_dumper startFgColor:2 attr:2];
  dumper = self->_dumper;
  id v10 = v4;
  id v11 = [v10 UTF8String];

  -[BRCTermDumper write:](dumper, "write:", "%s: %s is now foreground\n", v8, v11);
  v12 = self->_dumper;

  [(BRCTermDumper *)v12 reset];
}

- (void)containerDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = [(ContainerObserver *)self dateFormatter];
  objc_super v6 = +[NSDate date];
  id v7 = [v5 stringFromDate:v6];
  id v8 = [v7 UTF8String];

  dumper = self->_dumper;
  id v10 = v4;
  id v11 = [v10 UTF8String];

  -[BRCTermDumper write:](dumper, "write:", "%s: %s is now background\n", v8, v11);
}

- (BRCTermDumper)dumper
{
  return (BRCTermDumper *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDumper:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_dumper, 0);
}

@end