@interface CACSpokenCommandGroup
- (BOOL)isConfirmationRequired;
- (BOOL)isCustom;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isVisible;
- (CACSpokenCommandGroup)initWithIdentifier:(id)a3;
- (NSMutableArray)commandsArray;
- (NSString)displayString;
- (NSString)identifier;
- (id)cloneWithoutCommands;
- (unint64_t)searchScore;
- (void)saveToPreferences;
- (void)setCommandsArray:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsConfirmationRequired:(BOOL)a3;
- (void)setIsCustom:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setSearchScore:(unint64_t)a3;
@end

@implementation CACSpokenCommandGroup

- (CACSpokenCommandGroup)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACSpokenCommandGroup;
  v6 = [(CACSpokenCommandGroup *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_isCustom = [(NSString *)v7->_identifier hasPrefix:@"Custom"];
  }

  return v7;
}

- (id)cloneWithoutCommands
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  [v3 setIdentifier:self->_identifier];
  [v3 setDisplayString:self->_displayString];
  [v3 setIsEnabled:self->_isEnabled];
  [v3 setIsConfirmationRequired:self->_isConfirmationRequired];
  [v3 setIsCustom:self->_isCustom];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  identifier = self->_identifier;
  v4 = [a3 identifier];
  LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v4];

  return (char)identifier;
}

- (BOOL)isGroup
{
  return 1;
}

- (BOOL)isVisible
{
  return 1;
}

- (void)setLocale:(id)a3
{
}

- (NSString)displayString
{
  displayString = self->_displayString;
  if (!displayString)
  {
    if (!self->_identifier) {
      goto LABEL_4;
    }
    v4 = +[CACPreferences sharedPreferences];
    id v5 = [v4 displayNameForCommandSetIdentifier:self->_identifier];
    [(CACSpokenCommandGroup *)self setDisplayString:v5];

    displayString = self->_displayString;
    if (!displayString)
    {
LABEL_4:
      [(CACSpokenCommandGroup *)self setDisplayString:&stru_26EB332F0];
      displayString = self->_displayString;
    }
  }
  return displayString;
}

- (NSMutableArray)commandsArray
{
  commandsArray = self->_commandsArray;
  if (!commandsArray)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = self->_commandsArray;
    self->_commandsArray = v4;

    commandsArray = self->_commandsArray;
  }
  return commandsArray;
}

- (void)saveToPreferences
{
  if ([(CACSpokenCommandGroup *)self isGroup])
  {
    commandsArray = self->_commandsArray;
    [(NSMutableArray *)commandsArray makeObjectsPerformSelector:sel_saveToPreferences];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setCommandsArray:(id)a3
{
}

- (void)setDisplayString:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isConfirmationRequired
{
  return self->_isConfirmationRequired;
}

- (void)setIsConfirmationRequired:(BOOL)a3
{
  self->_isConfirmationRequired = a3;
}

- (BOOL)isCustom
{
  return self->_isCustom;
}

- (void)setIsCustom:(BOOL)a3
{
  self->_isCustom = a3;
}

- (unint64_t)searchScore
{
  return self->_searchScore;
}

- (void)setSearchScore:(unint64_t)a3
{
  self->_searchScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_commandsArray, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end