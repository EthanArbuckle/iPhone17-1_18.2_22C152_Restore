@interface MBDebugContext
+ (id)defaultDebugContext;
- (BOOL)BOOLForName:(id)a3;
- (BOOL)isFlagSet:(id)a3;
- (MBDebugContext)init;
- (NSDate)simulatedDate;
- (NSDictionary)dictionary;
- (id)description;
- (id)performSelectorForName:(id)a3;
- (id)performSelectorForName:(id)a3 withObject:(id)a4;
- (id)valueForName:(id)a3;
- (int)intForName:(id)a3;
- (int64_t)time;
- (void)dealloc;
- (void)removeValueForName:(id)a3;
- (void)setBool:(BOOL)a3 forName:(id)a4;
- (void)setDelegate:(id)a3 andSelector:(SEL)a4 forName:(id)a5;
- (void)setFlag:(id)a3;
- (void)setInt:(int)a3 forName:(id)a4;
- (void)setSimulatedDate:(id)a3;
- (void)setValue:(id)a3 forName:(id)a4;
@end

@implementation MBDebugContext

+ (id)defaultDebugContext
{
  v2 = objc_alloc_init(MBDebugContext);
  return v2;
}

- (MBDebugContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)MBDebugContext;
  v2 = [(MBDebugContext *)&v4 init];
  if (v2) {
    v2->_dictionary = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:MBDefaultDebugContext()];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDebugContext;
  [(MBDebugContext *)&v3 dealloc];
}

- (NSDictionary)dictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary copy];
  return (NSDictionary *)v2;
}

- (int64_t)time
{
  v2 = [(MBDebugContext *)self simulatedDate];
  if (v2)
  {
    [(NSDate *)v2 timeIntervalSince1970];
    return (uint64_t)v3;
  }
  else
  {
    return time(0);
  }
}

- (NSDate)simulatedDate
{
  return (NSDate *)[(MBDebugContext *)self valueForName:@"SimulatedSystemDate"];
}

- (void)setSimulatedDate:(id)a3
{
  if (a3) {
    [(MBDebugContext *)self setValue:a3 forName:@"SimulatedSystemDate"];
  }
  else {
    [(MBDebugContext *)self removeValueForName:@"SimulatedSystemDate"];
  }
}

- (BOOL)isFlagSet:(id)a3
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  LOBYTE(a3) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3), "BOOLValue");
  objc_sync_exit(dictionary);
  return (char)a3;
}

- (void)setFlag:(id)a3
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  [(NSMutableDictionary *)self->_dictionary setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:a3];
  objc_sync_exit(dictionary);
}

- (void)setValue:(id)a3 forName:(id)a4
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  [(NSMutableDictionary *)self->_dictionary setObject:a3 forKeyedSubscript:a4];
  objc_sync_exit(dictionary);
}

- (void)removeValueForName:(id)a3
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  [(NSMutableDictionary *)self->_dictionary removeObjectForKey:a3];
  objc_sync_exit(dictionary);
}

- (id)valueForName:(id)a3
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  v6 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKeyedSubscript:a3];
  objc_sync_exit(dictionary);
  return v6;
}

- (void)setBool:(BOOL)a3 forName:(id)a4
{
  BOOL v5 = a3;
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v5], a4);
  objc_sync_exit(dictionary);
}

- (BOOL)BOOLForName:(id)a3
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  LOBYTE(a3) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3), "BOOLValue");
  objc_sync_exit(dictionary);
  return (char)a3;
}

- (void)setInt:(int)a3 forName:(id)a4
{
  uint64_t v6 = [NSNumber numberWithInt:*(void *)&a3];
  [(MBDebugContext *)self setValue:v6 forName:a4];
}

- (int)intForName:(id)a3
{
  id v3 = [(MBDebugContext *)self valueForName:a3];
  return [v3 intValue];
}

- (void)setDelegate:(id)a3 andSelector:(SEL)a4 forName:(id)a5
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = a3;
  v7[1] = NSStringFromSelector(a4);
  -[MBDebugContext setValue:forName:](self, "setValue:forName:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2], a5);
}

- (id)performSelectorForName:(id)a3
{
  id result = [(MBDebugContext *)self valueForName:a3];
  if (result)
  {
    id v4 = result;
    BOOL v5 = (void *)[result objectAtIndexedSubscript:0];
    SEL v6 = NSSelectorFromString((NSString *)[v4 objectAtIndexedSubscript:1]);
    return (id)[v5 performSelector:v6];
  }
  return result;
}

- (id)performSelectorForName:(id)a3 withObject:(id)a4
{
  id result = [(MBDebugContext *)self valueForName:a3];
  if (result)
  {
    id v6 = result;
    v7 = (void *)[result objectAtIndexedSubscript:0];
    SEL v8 = NSSelectorFromString((NSString *)[v6 objectAtIndexedSubscript:1]);
    return (id)[v7 performSelector:v8 withObject:a4];
  }
  return result;
}

- (id)description
{
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  id v4 = MBStringWithDictionary(self->_dictionary);
  objc_sync_exit(dictionary);
  return v4;
}

@end