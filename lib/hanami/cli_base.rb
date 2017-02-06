module Hanami
  module CliBase
    # Add new custom CLI command to special CLI class.
    # Please be careful. This is a private method that
    # can be deleted soon.
    #
    # @since 0.8.0
    # @api private
    #
    # @example Usage with Cli class
    #   require 'hanami'
    #   require 'hanami/cli'
    #
    #   Hanami::Cli.define_commands do
    #     desc 'custom', 'Generate a something'
    #     long_desc <<-EOS
    #       long description for your custom command
    #     EOS
    #     def custom
    #       if options[:help]
    #         invoke :help, ['auth']
    #       else
    #         # ...
    #       end
    #     end
    #   end
    def define_commands(&blk)
      class_eval(&blk) if block_given?
    end

    def banner(command, nspace = true, subcommand = false)
      super(command, nspace, namespace != 'hanami:cli')
    end
  end
end
