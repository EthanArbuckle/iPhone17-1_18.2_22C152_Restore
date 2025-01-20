@interface CLIOptionParser
+ (CLIOptionParser)optionParserWithArguments:(id)a3 forCommand:(id)a4;
- (BOOL)enumerateOptionsWithBlock:(id)a3;
- (BOOL)preserveMultipleArguments;
- (CLICommand)command;
- (NSArray)arguments;
- (NSString)commandName;
- (id)dictionaryWithOptionsAndValues;
- (id)nextArgument;
- (void)finishArguments;
- (void)setArguments:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandName:(id)a3;
- (void)setPreserveMultipleArguments:(BOOL)a3;
- (void)validateArguments;
@end

@implementation CLIOptionParser

+ (CLIOptionParser)optionParserWithArguments:(id)a3 forCommand:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = sub_10000FA6C((id *)[CLIOptionParser alloc], v6, v5);

  return (CLIOptionParser *)v7;
}

- (BOOL)enumerateOptionsWithBlock:(id)a3
{
  id v5 = (void (**)(id, void *, void *, void *))a3;
  if (self->_optind >= 2)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"CLIOptionParsing.m" lineNumber:442 description:@"enumerateOptionsWithBlock: must be not be called after nextArgument"];
  }
  v20 = v22;
  while (1)
  {
    id v6 = [(CLIOptionParser *)self nextArgument];
    if (([v6 hasPrefix:@"--"] & 1) == 0) {
      break;
    }
    if ([v6 isEqualToString:@"--"]) {
      goto LABEL_16;
    }
    v7 = [v6 substringFromIndex:2];
    v8 = [(NSMutableDictionary *)self->_optionSet->_longAliasToOptionDict objectForKeyedSubscript:v7];
    id v9 = [v8 parameterCount];
    if (!v8)
    {
LABEL_20:
      sub_10000FBEC(self, v6);
LABEL_21:
      sub_10000FC4C(self, v6);
      sub_10000FF34(v18, v19);
      return result;
    }
    if (v9)
    {
      v10 = [(CLIOptionParser *)self nextArgument];
      if (!v10) {
        goto LABEL_21;
      }
    }
    else
    {
      v10 = 0;
    }
    v14 = [v8 shortName];
    v15 = [v8 longName];
    v5[2](v5, v14, v15, v10);

LABEL_15:
  }
  if ([v6 hasPrefix:@"-"])
  {
    v11 = (char *)[v6 length];
    v12 = v11 - 1;
    if (v11 == (char *)1) {
      goto LABEL_20;
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v22[0] = sub_10000FF34;
    v22[1] = &unk_10001C7D0;
    v22[2] = self;
    id v13 = v6;
    id v23 = v13;
    v24 = v5;
    objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 1, v12, 2, v21);

    goto LABEL_15;
  }
LABEL_16:
  if (self)
  {
    if (v6)
    {
      --qword_100025450;
      --self->_optind;
    }
  }

  return 1;
}

- (id)dictionaryWithOptionsAndValues
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1000100E8;
  id v9 = &unk_10001C7F8;
  id v10 = (id)objc_opt_new();
  v11 = self;
  id v3 = v10;
  [(CLIOptionParser *)self enumerateOptionsWithBlock:&v6];
  id v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

- (id)nextArgument
{
  unint64_t optind = self->_optind;
  if (optind >= [(NSArray *)self->_arguments count])
  {
    id v5 = 0;
  }
  else
  {
    ++qword_100025450;
    arguments = self->_arguments;
    ++self->_optind;
    id v5 = -[NSArray objectAtIndex:](arguments, "objectAtIndex:");
  }

  return v5;
}

- (void)finishArguments
{
  id v3 = [(CLIOptionParser *)self nextArgument];
  if (v3)
  {
    sub_10000FBEC(self, v3);
    [(CLIOptionParser *)v4 validateArguments];
  }
}

- (void)validateArguments
{
  uint64_t v3 = qword_100025450;
  [(CLIOptionParser *)self enumerateOptionsWithBlock:&stru_10001C838];
  qword_100025450 = v3;
  self->_unint64_t optind = 1;
}

- (NSString)commandName
{
  return self->_commandName;
}

- (void)setCommandName:(id)a3
{
}

- (CLICommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (BOOL)preserveMultipleArguments
{
  return self->_preserveMultipleArguments;
}

- (void)setPreserveMultipleArguments:(BOOL)a3
{
  self->_preserveMultipleArguments = a3;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_commandName, 0);

  objc_storeStrong((id *)&self->_optionSet, 0);
}

@end