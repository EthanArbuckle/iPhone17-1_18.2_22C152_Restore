@interface CNVCardDateComponentsParser
- (CNVCardDateComponentsParser)init;
- (id)dateComponentsFromString:(id)a3 calendarIdentifier:(id)a4;
- (id)dateComponentsFromString:(id)a3 omitYear:(int64_t)a4;
- (id)dateComponentsWithParser:(id)a3;
- (id)gregorianDateComponentsWithParser:(id)a3;
@end

@implementation CNVCardDateComponentsParser

- (CNVCardDateComponentsParser)init
{
  v10.receiver = self;
  v10.super_class = (Class)CNVCardDateComponentsParser;
  v2 = [(CNVCardDateComponentsParser *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(CNVCardDateComponentsFormatter);
    formatter = v2->_formatter;
    v2->_formatter = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v6 = [v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    gregorianCalendar = v2->_gregorianCalendar;
    v2->_gregorianCalendar = (NSCalendar *)v6;

    v8 = v2;
  }

  return v2;
}

- (id)gregorianDateComponentsWithParser:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstParameterWithName:@"X-APPLE-OMIT-YEAR"];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 values];
    v8 = [v7 firstObject];
    uint64_t v9 = [v8 integerValue];
  }
  else
  {
    uint64_t v9 = 1604;
  }
  objc_super v10 = [v4 parseStringValue];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v11 = 0;
  }
  else
  {
    if ([v10 hasPrefix:@"-"]
      && ([v10 hasPrefix:@"--"] & 1) == 0)
    {
      uint64_t v12 = [v10 substringFromIndex:1];

      objc_super v10 = (void *)v12;
    }
    v11 = [(CNVCardDateComponentsParser *)self dateComponentsFromString:v10 omitYear:v9];
  }

  return v11;
}

- (id)dateComponentsFromString:(id)a3 omitYear:(int64_t)a4
{
  uint64_t v6 = [(CNVCardDateComponentsFormatter *)self->_formatter dateComponentsFromString:a3];
  if ([v6 year] == 1604 || objc_msgSend(v6, "year") == a4) {
    [v6 setYear:0x7FFFFFFFFFFFFFFFLL];
  }
  [v6 setCalendar:self->_gregorianCalendar];
  return v6;
}

- (id)dateComponentsWithParser:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parseRemainingLine];
  uint64_t v6 = [v4 firstParameterWithName:@"CALSCALE"];

  v7 = [v6 values];
  v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = [(CNVCardDateComponentsParser *)self dateComponentsFromString:v5 calendarIdentifier:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)dateComponentsFromString:(id)a3 calendarIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v6];
    if (v7)
    {
      v8 = (void *)v7;
LABEL_7:
      uint64_t v12 = +[CNVCardDateComponentsFormatter dateComponentsFromALTBDAYString:v5];
      [v12 setCalendar:v8];
      if ([v12 isValidDate]) {
        id v9 = v12;
      }
      else {
        id v9 = 0;
      }

      goto LABEL_11;
    }
    uint64_t v10 = [v6 lowercaseString];

    uint64_t v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v10];
    if (v11)
    {
      v8 = (void *)v11;
      id v6 = (id)v10;
      goto LABEL_7;
    }
    id v9 = 0;
    id v6 = (id)v10;
  }
  else
  {
    id v9 = 0;
  }
LABEL_11:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end