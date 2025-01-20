@interface PFXXmlDocument
+ (BOOL)readProcessingInstructionFromStream:(_xmlTextReader *)a3 readerState:(id)a4;
+ (BOOL)readWithState:(id)a3;
+ (Class)textReaderClass;
+ (id)elementReaders;
+ (void)initialize;
@end

@implementation PFXXmlDocument

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
  }
}

+ (BOOL)readWithState:(id)a3
{
  id v5 = [a3 streamAPI];
  if (v5)
  {
    id v6 = [a1 elementReaders];
    id v7 = [a1 textReaderClass];
    id v8 = [a1 processingInstructionReaderClass];
    LOBYTE(v5) = +[PFXStreamReader readWithElementReaders:v6 textReader:v7 piReader:v8 readerState:a3];
  }
  return (char)v5;
}

+ (BOOL)readProcessingInstructionFromStream:(_xmlTextReader *)a3 readerState:(id)a4
{
  return 1;
}

+ (id)elementReaders
{
  return 0;
}

+ (Class)textReaderClass
{
  return 0;
}

@end