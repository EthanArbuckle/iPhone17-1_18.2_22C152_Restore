@interface MFFlagColorTriageInteraction
- (NSNumber)flagColor;
- (id)_localizedColorNameFromFlagColor:(unint64_t)a3;
- (id)cardActionWithCompletion:(id)a3;
- (id)triageAction;
- (id)undoTitle;
- (void)setFlagColor:(id)a3;
- (void)setTriageAction:(id)a3;
@end

@implementation MFFlagColorTriageInteraction

- (id)undoTitle
{
  v3 = [(MFFlagColorTriageInteraction *)self flagColor];
  v4 = +[NSBundle mainBundle];
  if (v3)
  {
    v5 = [v4 localizedStringForKey:@"OPERATION_FLAG_COLOR_DESC" value:&stru_100619928 table:@"Main"];
    v6 = -[MFFlagColorTriageInteraction _localizedColorNameFromFlagColor:](self, "_localizedColorNameFromFlagColor:", [v3 unsignedIntegerValue]);
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);
  }
  else
  {
    v7 = [v4 localizedStringForKey:@"OPERATION_UNFLAG_DESC" value:&stru_100619928 table:@"Main"];
  }

  return v7;
}

- (void)setFlagColor:(id)a3
{
  v5 = (NSNumber *)a3;
  if (self->_flagColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_flagColor, a3);
    v6 = [(MFFlagColorTriageInteraction *)self triageAction];
    [v6 setFlagColor:v7];

    v5 = v7;
  }
}

- (id)_localizedColorNameFromFlagColor:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_RED" value:&stru_100619928 table:@"Main"];
      goto LABEL_10;
    case 1uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_ORANGE" value:&stru_100619928 table:@"Main"];
      goto LABEL_10;
    case 2uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_YELLOW" value:&stru_100619928 table:@"Main"];
      goto LABEL_10;
    case 3uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_GREEN" value:&stru_100619928 table:@"Main"];
      goto LABEL_10;
    case 4uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_BLUE" value:&stru_100619928 table:@"Main"];
      goto LABEL_10;
    case 5uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_PURPLE" value:&stru_100619928 table:@"Main"];
      goto LABEL_10;
    case 6uLL:
      v3 = +[NSBundle mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAG_COLOR_GRAY" value:&stru_100619928 table:@"Main"];
LABEL_10:
      v5 = (__CFString *)v4;

      break;
    default:
      v5 = &stru_100619928;
      break;
  }

  return v5;
}

- (id)triageAction
{
  colorTriageAction = self->_colorTriageAction;
  if (!colorTriageAction)
  {
    id v4 = objc_alloc((Class)MSFlagTriageAction);
    v5 = [(MFTriageInteraction *)self messageListItemSelection];
    id v6 = [v4 initWithMessageListSelection:v5 origin:[self origin] actor:[self actor] delegate:self reason:[self reason]];

    v7 = [(MFFlagColorTriageInteraction *)self flagColor];
    [v6 setFlagColor:v7];

    v8 = self->_colorTriageAction;
    self->_colorTriageAction = (MSTriageAction *)v6;

    colorTriageAction = self->_colorTriageAction;
  }

  return colorTriageAction;
}

- (id)cardActionWithCompletion:(id)a3
{
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1001999A4;
  v18 = &unk_10060ABB8;
  v19 = self;
  id v4 = a3;
  id v20 = v4;
  v5 = +[MFFlagColorCardAction cardActionWithTitle:0 shortTitle:0 imageName:0 tintColor:0 handlerEnabled:0 handler:&v15];
  id v6 = [(MFTriageInteraction *)self messageListItemSelection];
  v7 = [v6 messageListItems];
  v8 = [v7 firstObject];

  v9 = [v8 flags];
  unsigned int v10 = [v9 flagged];

  if (v10)
  {
    v11 = [v8 flagColors];
    v12 = v11;
    if (v11)
    {
      v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 firstIndex]);
    }
    else
    {
      v13 = 0;
    }
    [v5 setFlagColor:v13];
    if (v12) {
  }
    }

  return v5;
}

- (void)setTriageAction:(id)a3
{
}

- (NSNumber)flagColor
{
  return self->_flagColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagColor, 0);

  objc_storeStrong((id *)&self->_colorTriageAction, 0);
}

@end